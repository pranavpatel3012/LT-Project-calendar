%{
#include <stdlib.h>
#include "y.tab.h"
%}

cmt     "cmt"
smcmt   "cmt*"
emcmt   "*cmt"

%%  

{cmt}(.*) ; 
{smcmt}(.*\n)*.*{emcmt}  {};  

[0-9]+  {
            yylval.integer = atoi(yytext);
            return INT;
        }

and         {return and;}
What        {return What;}
is          {return is;}
today       {return today;}
todays      {return todays;}
date        {return date;}
How         {return How;}
many        {return many;}
days        {return days;}
the         {return the;}
day         {return day;}
after       {return after;}    
in          {return in;}
between     {return between;}
January     {return January;}
February    {return February;}
March       {return March;}
April       {return April;}
May         {return May;}
June        {return June;}
July        {return July;}
August      {return August;}
September   {return September;}
October     {return October;}
November    {return November;}
December    {return December;}
months      {return months;}
remaining   {return remaining;}
years       {return years;}
year        {return year;}

"?" {
        return *yytext;
	}

"/" {
        return *yytext;
    }

"," {
        return *yytext;
    }

[\n]    {return yytext;}

[ \t\n]+         

.       printf( "Unrecognized character: %s\n", yytext );

%%

int yywrap(void)
{
	return 1;
}