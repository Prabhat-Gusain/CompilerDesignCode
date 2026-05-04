%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex();
%}

%token NUMBER

%%
line:NUMBER '\n'    {
                        if($1<0)
                            printf("Negative number\n");
                        else
                            printf("Positive number\n");
                    };
                
%%

void yyerror(const char *s)
{
    printf("invalid \n");
}

int main()
{
    printf("Enter number:");
    yyparse();
    return 0;
}