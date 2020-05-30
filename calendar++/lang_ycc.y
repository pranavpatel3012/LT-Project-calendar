%{
	#include<stdio.h>
	#include<time.h>
	extern FILE *yyin;
	int yylex(void);
	void yyerror(char *);
	void predict(int);
%}

%union{
int integer;
}

%token KEYWORD
%token What is today todays the date How many INT after days day and in remaining years year months between January February March April May June July August September October November December

%type <integer> stmt stmt2 stmt3 stmt4 stmt5 stmt6 stmt8 stmt9 stmt10 stmt11 stmt12 INT January February March April May June July August September October November December MONTH

%%


stmt:	What is stmt2 											{}
	|	How many stmt3 											{}
	;

stmt2:	todays date '?'											{time_t T = time(NULL);struct tm tm= *localtime(&T);printf("%d/%d/%d\n",tm.tm_mday,tm.tm_mon+1,tm.tm_year+1900);}
	 |	the date after INT days '?'								{predict($4);}
	 ;

stmt3:	days  stmt4 											{}
	 |	months stmt5 											{}
	 |	years stmt8 											{}
	 ;

stmt4:	in MONTH '?' 											{}
	 |	between stmt9 											{}
	 |	',' months stmt6 										{}
	 |	remaining in the year '?'								{time_t T = time(NULL);struct tm tm= *localtime(&T);daycount(tm.tm_year+1900,tm.tm_year+1900,12,tm.tm_mon+1,31,tm.tm_mday,1);}
	 ;

stmt9:	today and INT '/' INT '/' INT '?'						{time_t T = time(NULL);struct tm tm= *localtime(&T);daycount(tm.tm_year+1900,$7,tm.tm_mon+1,$5,tm.tm_mday,$3,0);}
	 |	 INT '/' INT '/' INT and INT '/' INT '/' INT '?'		{daycount($5,$11,$3,$9,$1,$7,0);}
	 ;

stmt6:	',' years between stmt10								{}
	 |	remaining in the year '?'								{time_t T = time(NULL);struct tm tm= *localtime(&T);alldiff(tm.tm_mday,tm.tm_mon+1,tm.tm_year+1900,31,12,tm.tm_year+1900,1);}
	 ;

stmt10:	today and INT '/' INT '/' INT '?'						{time_t T = time(NULL);struct tm tm= *localtime(&T);alldiff(tm.tm_mday,tm.tm_mon+1,tm.tm_year+1900,$3,$5,$7,0);}
	 |	 INT '/' INT '/' INT and INT '/' INT '/' INT '?'		{alldiff($1,$3,$5,$7,$9,$11,0);}
	 ;

stmt5:	remaining in the year '?'								{time_t T = time(NULL);struct tm tm= *localtime(&T);alldiff(tm.tm_mday,tm.tm_mon+1,tm.tm_year+1900,31,12,tm.tm_year+1900,2);}
	 |	between stmt11 											{}
	 ;

stmt11:	today and INT '/' INT '/' INT '?'						{time_t T = time(NULL);struct tm tm= *localtime(&T);alldiff(tm.tm_mday,tm.tm_mon+1,tm.tm_year+1900,$3,$5,$7,2);}
	 |	 INT '/' INT '/' INT  and INT '/' INT '/' INT '?'		{alldiff($1,$3,$5,$7,$9,$11,2);}
	 ;

stmt8:	between stmt12 											{}
	 	
stmt12:	today and INT '/' INT '/' INT '?'						{time_t T = time(NULL);struct tm tm= *localtime(&T);alldiff(tm.tm_mday,tm.tm_mon+1,tm.tm_year+1900,$3,$5,$7,3);}
	 |	 INT '/' INT '/' INT and INT '/' INT '/' INT '?'		{alldiff($1,$3,$5,$7,$9,$11,3);}
	 ;

MONTH:	January													{$$=31;printf("The days in the January are 31.\n");}
	 |	February												{time_t T = time(NULL);struct tm tm= *localtime(&T);if((tm.tm_year%4)==0){$$=29;}else{$$=28;}printf("The days in the February are %d.\n",$$);}
	 |	March													{$$=31;printf("The number of days in the March are 31.\n");}
	 |	April													{$$=30;printf("The number of days in the April are 30.\n");}
	 |	May 													{$$=31;printf("The number of days in the May are 31.\n");}
	 |	June 													{$$=30;printf("The number of days in the June are 30.\n");}
	 |	July 													{$$=31;printf("The number of days in the July are 31.\n");}
	 |	September 												{$$=30;printf("The number of days in the September are 30.\n");}
	 |	October 												{$$=31;printf("The number of days in the October are 31.\n");}
	 |	November 												{$$=30;printf("The number of days in the November are 30.\n");}
	 |	December 												{$$=31;printf("The number of days in the December are 31.\n");}
	 |	August													{$$=31;printf("The number of days in the August are 31.\n");}
	 ;

%%


void yyerror(char *s)
{
	//fprintf(stderr, "%s\n",s);
}


int main(int argc, char * argv[])
{
	yyin=fopen(argv[1],"r");
	int i;
	for(i=1;i<=120;i++){
		yyparse();
	}
	fclose(yyin);
	return 0;
}


void predict(int n)
{
	int mon[12]={31,28,31,30,31,30,31,31,30,31,30,31};
	struct tm tm = {0} ;
    time_t T;
    T=time(NULL);
    tm = *gmtime( &T ) ;
    tm.tm_year = tm.tm_year;
    tm.tm_mon = tm.tm_mon;
    tm.tm_mday = tm.tm_mday + n;
    T = mktime( &tm ) ;
    tm = *gmtime( &T ) ;
    printf("The date after %d days is %d/%d/%d.\n",n,tm.tm_mday,tm.tm_mon+1,tm.tm_year+1900);
}


int month(int a,int yy)
{
	int mon[12]={31,28,31,30,31,30,31,31,30,31,30,31};
  	int x=0,c;
  	for(c=0;c<a-1;c++)
    {
   		if(c==1)
      	{
      		if(yy%4==0)
      			x+=29;
      		else
      			x+=28;
      	}
    	else
    	x+=mon[c];
    }
	return(x);
}


void daycount(int y1,int y2,int m1,int m2,int d1,int d2,int flag)
{
  	int count=0,i;
  	for(i=y1;i<y2;i++)
    {
    	if(i%4==0)
    		count+=366;
    	else
    		count+=365;
    }
  	count-=month(m1,y1);
  	count-=d1;
  	count+=month(m2,y2);
  	count+=d2;
  	if(count<0)
  		count=count*-1;
  	if(flag==0)
  	{
  		printf("The number of days between two dates is %d days.\n",count);
  	}
  	else
  	{
  		printf("The number of days remaining in the year is %d days.\n",count);
  	}
}


void alldiff(int day1,int mon1,int year1,int day2,int mon2,int year2,int flag)
{
    int day_diff, mon_diff, year_diff;
    if(day2 < day1)
    {      
        if (mon2 == 3)
        {
            if ((year2 % 4 == 0 && year2 % 100 != 0) || (year2 % 400 == 0)) 
            {
                day2 += 29;
            }
            
            else
            {
                day2 += 28;
            }                        
        }
        
        else if (mon2 == 5 || mon2 == 7 || mon2 == 10 || mon2 == 12) 
        {
           day2 += 30; 
        }
                
        else
        {
           day2 += 31;
        }
        
        mon2 = mon2 - 1;
    }
    
    if (mon2 < mon1)
    {
        mon2 += 12;
        year2 -= 1;
    }       
    
    day_diff = day2 - day1;
    mon_diff = mon2 - mon1;
    year_diff = year2 - year1;
    if(flag==0)
    {
    	printf("%d years %d months and %d days\n", year_diff, mon_diff, day_diff);
    }
    else if(flag==2)
    {
    	mon_diff=mon_diff+(12*year_diff);
    	printf("%d months\n",mon_diff);
    }
    else if(flag==3)
    {
    	printf("%d years\n",year_diff);
    }
    else
    {
    	printf("%d months and %d days\n",mon_diff, day_diff);
    }
}