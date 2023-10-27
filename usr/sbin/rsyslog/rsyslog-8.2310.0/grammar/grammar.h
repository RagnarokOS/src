/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
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

#ifndef YY_YY_GRAMMAR_H_INCLUDED
# define YY_YY_GRAMMAR_H_INCLUDED
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
    NAME = 258,
    FUNC = 259,
    BEGINOBJ = 260,
    ENDOBJ = 261,
    BEGIN_INCLUDE = 262,
    BEGIN_ACTION = 263,
    BEGIN_PROPERTY = 264,
    BEGIN_CONSTANT = 265,
    BEGIN_TPL = 266,
    BEGIN_RULESET = 267,
    STOP = 268,
    SET = 269,
    RESET = 270,
    UNSET = 271,
    CONTINUE = 272,
    EXISTS = 273,
    CALL = 274,
    CALL_INDIRECT = 275,
    LEGACY_ACTION = 276,
    LEGACY_RULESET = 277,
    PRIFILT = 278,
    PROPFILT = 279,
    BSD_TAG_SELECTOR = 280,
    BSD_HOST_SELECTOR = 281,
    RELOAD_LOOKUP_TABLE_PROCEDURE = 282,
    IF = 283,
    THEN = 284,
    ELSE = 285,
    FOREACH = 286,
    ITERATOR_ASSIGNMENT = 287,
    DO = 288,
    OR = 289,
    AND = 290,
    NOT = 291,
    VAR = 292,
    STRING = 293,
    NUMBER = 294,
    CMP_EQ = 295,
    CMP_NE = 296,
    CMP_LE = 297,
    CMP_GE = 298,
    CMP_LT = 299,
    CMP_GT = 300,
    CMP_CONTAINS = 301,
    CMP_CONTAINSI = 302,
    CMP_STARTSWITH = 303,
    CMP_STARTSWITHI = 304,
    UMINUS = 305
  };
#endif
/* Tokens.  */
#define NAME 258
#define FUNC 259
#define BEGINOBJ 260
#define ENDOBJ 261
#define BEGIN_INCLUDE 262
#define BEGIN_ACTION 263
#define BEGIN_PROPERTY 264
#define BEGIN_CONSTANT 265
#define BEGIN_TPL 266
#define BEGIN_RULESET 267
#define STOP 268
#define SET 269
#define RESET 270
#define UNSET 271
#define CONTINUE 272
#define EXISTS 273
#define CALL 274
#define CALL_INDIRECT 275
#define LEGACY_ACTION 276
#define LEGACY_RULESET 277
#define PRIFILT 278
#define PROPFILT 279
#define BSD_TAG_SELECTOR 280
#define BSD_HOST_SELECTOR 281
#define RELOAD_LOOKUP_TABLE_PROCEDURE 282
#define IF 283
#define THEN 284
#define ELSE 285
#define FOREACH 286
#define ITERATOR_ASSIGNMENT 287
#define DO 288
#define OR 289
#define AND 290
#define NOT 291
#define VAR 292
#define STRING 293
#define NUMBER 294
#define CMP_EQ 295
#define CMP_NE 296
#define CMP_LE 297
#define CMP_GE 298
#define CMP_LT 299
#define CMP_GT 300
#define CMP_CONTAINS 301
#define CMP_CONTAINSI 302
#define CMP_STARTSWITH 303
#define CMP_STARTSWITHI 304
#define UMINUS 305

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 46 "grammar.y"

	char *s;
	long long n;
	es_str_t *estr;
	enum cnfobjType objType;
	struct cnfobj *obj;
	struct cnfstmt *stmt;
	struct nvlst *nvlst;
	struct objlst *objlst;
	struct cnfexpr *expr;
	struct cnfarray *arr;
	struct cnffunc *func;
	struct cnffuncexists *exists;
	struct cnffparamlst *fparams;
	struct cnfitr *itr;

#line 174 "grammar.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_GRAMMAR_H_INCLUDED  */
