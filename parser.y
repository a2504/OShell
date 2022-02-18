
%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(char* s);
%}

%union {int num; char *id; }
%token <id> IDENTIFIER
%token EOL
%token EXIT

%%

commands:
| commands command			{ ; }
;

command: executable options { ; }
;

executable: IDENTIFIER		{ printf("ID %s\n", $1); }
| EXIT						{ printf("EX\n"); exit(EXIT_SUCCESS); }
;

options: EOL
| option options			{ ; }
;

option: IDENTIFIER			{ printf("OP %s\n", $1); }

%%

int main(int argc, char **argv)
{
    yyparse();

    return 0;
}

int yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);

	return 0;
}
