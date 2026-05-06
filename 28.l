%{
    #include"28.tab.h"    
%}

%%
[0-9]+  {yylval=atoi(yytext);return NUMBER;}
"+"     {return PLUS;}
"-"     {return MINUS;}
"*"     {return MUL;}
"/"     {return DIV;}
"("     {return LPAREN;}
")"     {return RPAREN;}
[ \t]   ;
\n      {return '\n';}
.       {return yytext[0];}
%%

int yywrap()
{
    return 1;
}