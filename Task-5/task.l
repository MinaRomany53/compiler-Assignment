
/* (5). Write a FLEX program that will produce a program to check for balanced parentheses in an arithmetic expression. */

%{
#include<stdio.h>
int noParenth=0;
%}

%%
"("         {noParenth++;}

")"         {noParenth--;}

[\n]        {
                if(noParenth==0)
                fprintf(yyout," Balanced\n",yytext);
                else if(noParenth>0)
                fprintf(yyout," The statemnet has either extra ( paranthesis or a missing ) paranthesis\n",yytext);
                else if(noParenth<0)
                fprintf(yyout," The statemnet has either extra ) paranthesis or a missing ( paranthesis\n",yytext); 
                noParenth=0;
            }   
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