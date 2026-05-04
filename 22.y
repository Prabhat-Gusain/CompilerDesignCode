%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex();
%}

%token NUMBER PLUS

%%
line:expr '\n'  {printf("Result=%d\n",$1);};

expr:expr PLUS expr     {$$=$1+$3;}
    |NUMBER             {$$=$1;}
    ;
%%

void yyerror(const char *s)
{
    printf("invalid\n");
}

int main()
{
    printf("Enter expression:");
    yyparse();
    return 0;
}