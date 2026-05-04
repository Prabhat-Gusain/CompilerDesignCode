%{
    #include"19.tab.h"
%}

%%
[a-zA-Z]    {yylval.val=yytext[0];return ID;}
"+"     {return PLUS;}
"-"     {return MINUS;}
"*"     {return MUL;}
"/"     {return DIV;}
"("     {return LPAREN;}
")"     {return RPAREN;}
[\t]    ;
\n      {return '\n';}
.       {reutrn yytext[0];}
%%

int yywrap()
{
    return 1;
}