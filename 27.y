%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex();
%}

%token  NUMBER ID PLUS MINUS MUL DIV LPAREN RPAREN 
%left PLUS MINUS  
%left MUL DIV 

%%
input:
    |input line; 
    ;

line:expr '\n'  {printf("valid expression\n");};

expr:expr PLUS expr  
    |expr MINUS expr    
    |expr MUL expr      
    |expr DIV expr      
    |LPAREN expr RPAREN     
    |NUMBER    
    |ID
    ;
%%

void yyerror(const char *s)
{
    printf("invalid");
}

int main()
{
    printf("Enter expression");
    yyparse();
    return 0;
}