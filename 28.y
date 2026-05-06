%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex();
%}

%token NUMBER PLUS MINUS MUL DIV LPAREN RPAREN
%left PLUS MINUS
%left MUL DIV

%%
input:input line
    | 
    ;

line:expr '\n'  {printf("RESULT=%d\n",$1);}
    ;

expr:expr PLUS expr  {$$=$1+$3;}
    |expr MINUS expr  {$$=$1-$3;}
    |expr MUL expr  {$$=$1*$3;}
    |expr DIV expr  {$$=$1/$3;}
    |LPAREN expr RPAREN     {$$=$2;}
    |NUMBER     {$$=$1;}
    ;
%%

void yyerror(const char *s)
{
    printf("invalid \n");
}

int main(){
    printf("Enter expression:");
    yyparse();
    return 0;
}