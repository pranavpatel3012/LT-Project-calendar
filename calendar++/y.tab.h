/* A Bison parser, made by GNU Bison 3.4.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2019 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    KEYWORD = 258,
    What = 259,
    is = 260,
    today = 261,
    todays = 262,
    the = 263,
    date = 264,
    How = 265,
    many = 266,
    INT = 267,
    after = 268,
    days = 269,
    day = 270,
    and = 271,
    in = 272,
    remaining = 273,
    years = 274,
    year = 275,
    months = 276,
    between = 277,
    January = 278,
    February = 279,
    March = 280,
    April = 281,
    May = 282,
    June = 283,
    July = 284,
    August = 285,
    September = 286,
    October = 287,
    November = 288,
    December = 289
  };
#endif
/* Tokens.  */
#define KEYWORD 258
#define What 259
#define is 260
#define today 261
#define todays 262
#define the 263
#define date 264
#define How 265
#define many 266
#define INT 267
#define after 268
#define days 269
#define day 270
#define and 271
#define in 272
#define remaining 273
#define years 274
#define year 275
#define months 276
#define between 277
#define January 278
#define February 279
#define March 280
#define April 281
#define May 282
#define June 283
#define July 284
#define August 285
#define September 286
#define October 287
#define November 288
#define December 289

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 10 "lang_ycc.y"

int integer;

#line 129 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
