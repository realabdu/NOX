%{
#include <string.h> /* for strdub */
#include <stdlib.h> /* for atoi */
#include "NoxBison.tab.h" /*for tokens defined in bison file, and yylval */ 
%}
/* ===== tokens defintion ====  */
DIGIT	[0-9]	
ID	[a-z][a-z0-9]*	

/*
 felx -> bison
	- bison expect to call yylex() to get the next token, and taking any associated value in the global yylval
 DIGIT = regex matches with a single digit
 ID    = regex matches with one letter and or followed by other letter or number 

 * = 1 or more 
 + = zero or more 

float implementation.
 {digit}+"."{digit}*
*/


%%
":="		{return(ASSGNOP);}
{DIGIT}+	{yylval.intval = atoi(yytext);
		 return(NUMBER);}
do		{return(DO);}
else		{return(ELSE);}
end		{return(END);}
fi		{return(FI);}
if		{return(IF);}
in		{return(IN);}
integer		{return(INTEGER);}
let		{return(LET);}
read		{return(READ);}
skip		{return(SKIP);}
then		{return(THEN);}
while		{return(WHILE);}
write		{return(WRITE);}
{ID}		{yylval.id = (char *)strdup(yytext);
		return(IDENTIFIER);}
[ \t\n]+	
.		{return(yytext[0]);}
%%
int yywrap(void){}
