/* symbol table record */
struct symrec
{
char *name; /* name of symbol */
int offset; /* data offfset*/
struct symrec *next; /* link field */
};

typedef struct symrec symrec; /* no need to type struct symrec everytime, you can just write symrec */
/* symbol table entry */
symrec *identifier;

/* symbol table, implementation: a chain of records */ 
symrec *sym_table = (symrec *)0; /* the pointer to the symbol table*/

/* operations: Putsym, Getsym */ 
symrec * putsym(char *sym_name){
symrec *ptr;
ptr = (symrec*) malloc(sizeof(symrec));
ptr->name = (char *) malloc (strlen(sym_name)+1);
strcpy (ptr->name,sym_name);
ptr->offset = data_location();
ptr->next = (struct symrec *)sym_table;
sym_table = ptr;
return ptr;
}

symrec *getsym ( char *symname ){
symrec *ptr;
for (    ptr = sym_table;
	 ptr != (symrec *) 0;
	ptr = (symrec *)ptr->next)

if (strcmp (ptr->name,symname) == 0)
	return ptr;
return 0;
}
