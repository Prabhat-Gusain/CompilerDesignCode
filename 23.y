%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex();
%}

%token NUMBER

%%
line:NUMBER '\n'    {
                        if($1%2==0)
                            printf("Even number\n");
                        else
                            printf("Odd number\n");
                    };
%%

void yyerror(const char *s)
{
    printf("invalid \n");
}

int main()
{
    printf("enter expression \n");
    yyparse();
    return 0;
}