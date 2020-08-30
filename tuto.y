%{
/* ======= C libraries, Symbol Table, Code generator & other C code ======= */
#include <stdlib.h> /* For mallon in symbol table */
#include <string.h> /*For stccmp in symbol */
#include <stdio.h> /*for error messages */
#include "ST.h" /* symbol table module */
#include "SM.h" /* stack machine module */
#include "CG.h" /* code generation module */
#define YYDEBUG 1 /* For debugging */

int errors;	/*error count */
/* ==== the following support backpatching === */
struct lbs{	/* Labels for data, if and while */
	int for_goto;
	int for_jmp_false;
};

struct lbs * newlblrec() /* Allocate space for the labels */
{
return (struct lbs *) malloc(sizeof(struct lbs));
};
/* install identifier& check of previously defined */
install (char *sym_name){
symrec *s;
s = getsym (sym_name);
if (s == 0)
s = putsym(sym_name);
else{errors++;
printf("%s in already defined\n ", sym_name);
}
}
/* if identifier is defined, generate code */
context_check(enum code_ops operation, char *sym_name){
symrec *identifier;
identifier = getsym(sym_name);
if(identifier ==0)
{errors++;
printf("%s", sym_name);
printf("s%\n", " is an undeclared identifier");
}
else gen_code(operation, identifier->offset);
}
%}
/* semantic records */ 
%union semrec{ /*semantic record */
	int intval;/* integer values */
	char *id; /* identifiers */
	struct lbs *lbls; /* for backpatching */
}
/* token types */
%start program 
%token <intval> NUMBER /* simple integer token, with semnatic value of type intval*/
%token <id> IDENTIFIER /* Simple identifier token, with semantic value of type id */ 
%token <lbls> IF WHILE	/* For backPatching lablels token, with semantic value of lbls*/
%token SKIP THEN ELSE FI DO END
%token INTEGER READ WRITE LET IN 	
%token ASSGNOP
/* OPERATOR PRECEDENCE */
%left '-''+'
%left '*''/'
%left '^'

%%
program: LET 
		declarations
	 IN 		{gen_code(DATA,data_location() - 1);}
		commands
	 END {gen_code(HALT,0);YYACCEPT;} 
	 ;
declarations: /*empty*/
	| INTEGER id_seq IDENTIFIER '.'{install($3);}
;
id_seq: /*empty*/
	|id_seq IDENTIFIER ',' {install($2);}
;
commands: /*empty*/
	|commands command';'
;
command: SKIP
	|READ IDENTIFIER		 {context_check(READ_INT,$2);}
	|WRITE exp		 {gen_code(WRITE_INT, 0);}
	|IDENTIFIER ASSGNOP exp	 {context_check(STORE, $1);}

	|IF exp		{$1 = (struct lbs *) newlblrec();
			 $1->for_jmp_false = reserve_loc();}
	THEN commands  { $1->for_goto = reserve_loc();}
	ELSE		{back_patch( $1->for_jmp_false,JMP_FALSE,gen_label());	}
		commands
	FI		{back_patch($1->for_goto, GOTO, gen_label());}

	|WHILE		{$1 = (struct lbs *) newlblrec();
			 $1->for_goto = gen_label();	}
		exp 	{$1->for_jmp_false = reserve_loc();} 
	DO
		commands
	END		{gen_code(GOTO, $1->for_goto);
			 back_patch($1->for_jmp_false,JMP_FALSE,gen_label());}
	;
exp: NUMBER	{gen_code(LD_INT, $1);} 
	|IDENTIFIER {context_check(LD_VAR , $1);}
	|exp '<' exp {gen_code(LT, 0);}
	|exp '=' exp {gen_code(EQ, 0);}
	|exp '>' exp {gen_code(GT, 0);}
	|exp '+' exp {gen_code(ADD, 0);}
	|exp '-' exp {gen_code(SUB, 0);} 
	|exp '*' exp {gen_code(MULT,0);}
	|exp '/' exp {gen_code(DIV, 0);}
	|exp '^' exp {gen_code(PWR,0);} 
	|'('exp')'
;
%%
main(int argc, char *argv[])
{
 extern FILE *yyin;
 ++argv,--argc;
 yyin = fopen(argv[0], "r");
/* yydebug = 1; */
errors = 0;
yyparse();

printf("Parse completed\n");
if(errors ==0){
	print_code();
	fetch_execute_cycle();
}
} 

yyerror(char *s)
{
errors++;
printf("%s\n", s); 
}
