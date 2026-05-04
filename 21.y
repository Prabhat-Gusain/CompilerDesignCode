%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex();
%}

%token NUMBER

%%
line:NUMBER'\n' {printf("Valid Number\n");}
    |'\n'       {printf("Enter something\n");}
    ;
%%

void yyerror(const char *s)
{
    printf("invalid\n");
}

int main()
{
    printf("Enter Input");
    yyparse();
    return 0;
}
