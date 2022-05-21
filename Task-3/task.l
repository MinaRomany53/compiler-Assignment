
/* (3). Write a FLEX program that will produce a program to extract all numbers in a text file and print its reversed. */

%{
#include<stdio.h>
#include <ctype.h>
#include <string.h>
%}

Number  [0-9]+

%%
{Number}   {
                for(int i = (strlen(yytext))-1; i >= 0; i--)
                fprintf(yyout,"%c", yytext[i]);
            }

.          {fprintf(yyout, "%s", yytext); }
%%

int yywrap(){
    return 1;
}

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt" , "r");
    yyout = fopen("output.txt" , "w");
    yylex();
    return 0;
}