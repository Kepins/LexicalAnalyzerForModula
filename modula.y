%{
#include	<stdio.h>
#include	<string.h>
#define MAX_STR_LEN	100

  int yylex(void);
  void yyerror(const char *txt);

  void found( const char *nonterminal, const char *value );
%}

%union {
  char s[ MAX_STR_LEN + 1 ];
  int i;
  double d;
}

%start GRAMMAR
/* keywords */
%token <i> KW_AND KW_BEGIN KW_CONST KW_DIV KW_DO KW_ELSE KW_ELSIF KW_END KW_FOR
%token <i> KW_FROM KW_IF KW_IMPORT KW_IN KW_MOD KW_MODULE KW_NOT KW_PROCEDURE
%token <i> KW_OR KW_THEN KW_TYPE KW_TO KW_VAR KW_WHILE KW_REPEAT KW_UNTIL
%token<i> KW_LOOP KW_CASE KW_OF KW_ARRAY KW_RECORD KW_DOWNTO
/* literal values */
%token <s> STRING_CONST CHAR_CONST
%token <i> INTEGER_CONST
%token <d> REAL_CONST
/* operators */
%token <I> ASSIGN LE GE NEQ
/* other */
%token <s> IDENT

%left '+' '-' KW_OR
%left '*' '/' KW_DIV KW_MOD KW_AND '&'
%left NEG KW_NOT

%%

 /* GRAMMAR */
 /* Oprocz podanych nizej, GRAMMAR moze byc takze modulem programu
    (PROGRAM_MODULE) */
GRAMMAR: TOKEN | GRAMMAR TOKEN
	| error
;

TOKEN: KEYWORD | LITERAL_VALUE | OPERATOR | OTHER
;

KEYWORD: KW_AND | KW_BEGIN | KW_CONST | KW_DIV | KW_DO | KW_ELSE | KW_ELSIF
	| KW_END | KW_FOR | KW_FROM | KW_IF | KW_IMPORT | KW_IN | KW_MOD
	| KW_MODULE | KW_NOT | KW_OR | KW_THEN | KW_TYPE | KW_TO | KW_VAR
	| KW_WHILE | KW_REPEAT | KW_UNTIL | KW_LOOP | KW_CASE | KW_OF
	| KW_ARRAY | KW_RECORD | KW_DOWNTO
;

LITERAL_VALUE: STRING_CONST | INTEGER_CONST | REAL_CONST | CHAR_CONST
;

OPERATOR: ASSIGN | LE | GE | NEQ
;

OTHER: IDENT | ',' | ';' | '=' | ':' | '(' | ')' | '+' | '*' | '-' | '.' | '|'
	| '<' | '[' | ']'
;

%%

int main( void )
{ 
	printf( "Szymon Kepinski\n" );
	printf( "yytext              Typ tokena         Wartosc tokena znakowo\n\n" );
	yyparse();
	return( 0 ); // OK
}

void yyerror( const char *txt)
{
	printf( "%s\n", txt );
}

void found( const char *nonterminal, const char *value )
{  /* informacja o znalezionych strukturach skladniowych (nonterminal) */
        printf( "===== FOUND: %s %s%s%s=====\n", nonterminal, 
                        (*value) ? "'" : "", value, (*value) ? "'" : "" );
}
