%{
#include<stdio.h>
FILE*fout;
int vowels=0,con=0;
%}

%%
[aeiouAEIOU]	{vowels++;}
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]	{con++;}
[ \t\n0-9]	{}
.	{}
%%

int main()
{
FILE*fin;

fin=fopen("input5.txt","r");
fout=fopen("result3.txt","w");

if(!fin)
{
printf("Error while opeing file\n");
return 1;
}
if(!fout)
{
printf("Error while writing file\n");
return 1;
}

yyin=fin;
yylex();

fprintf(fout,"number of vowels in a sentence:%d\n",vowels);
fprintf(fout,"number of consonants in a sentence:%d\n",con);

fclose(fin);
fclose(fout);

return 0;
}

int yywrap()
{
return 1;
}