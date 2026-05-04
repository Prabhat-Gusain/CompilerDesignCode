%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex();
%}

%union{
    char val;
}

%token <val>include
%token PLUS MINUS MUL DIV LPAREN RPAREN
%left PLUS MINUS
%left MUL DIV

%%
line    :expr'\n'   {printf("\n");};

expr    :expr PLUS expr {printf("+");}
        |expr MINUS expr    {printf("-");}
        |expr MUL expr  {printf("*");}
        |expr DIV expr  {printf("/");}
        |LPAREN expr RPAREN 
        ;
%%

void yyerror(const char *s)
{
    printf("invalid expression\n");
}

int main()
{
    printf("Enter Expession");
    yyparse();
    return 0;
}
