%{
    #include<stdio.h>
    FILE *fout;
    int v,c=0;
%}

%%
[aeiouAEIOU]    {v++;}
[ \t\n]     ;
[^aeiouAEIOU]   {c++;}
%%

int main()
{
    FILE*fin;
    fin=fopen("input7.txt","r");

    fout=fopen("output7.txt","w");
    if(!fin)
    {
        printf("error\n");
    }
    if(!fout)
    {
        printf("error\n");
    }

    yyin=fin;
    yylex();

    fprintf(fout,"no of vowels:%d\n",v);
    fprintf(fout,"no of consonants:%d\n",c);

    fclose(fin);
    fclose(fout);
    return 0;
}
