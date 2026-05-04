%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(const char *S);
    int yylex();
%}

%token NUMBER PLUS MINUS MUL DIV LPAREN RPAREN
%left PLUS MINUS
%left MUL DIV 

%%
input:input line
    |
    ;
line:expr'\n'   {printf("Result=%d\n",$1);}
    |'\n'  
    ;
expr:expr PLUS expr     {$$=$1+$3;}
