%{
#include <string.h> /* for strdub */
#include <stdlib.h> /* for atoi */
#include "tuto.tab.h" /*for tokens defintion and yylval */ 
%}
/* ===== tokens defintion ====  */
DIGIT	[0-9]	
ID	[a-z][a-z0-9]*	

/* DIGIT = regex matches with a single digit
   ID    = regex matches with one letter and or followed by other letter or number 
*/


%%
":="		{return(ASSGNOP);}
{DIGIT}+	{yylval.intval = atoi(yytext);
		 return(NUMBER);}
do		{return(DO);}
esle 		{return(ELSE);}
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
