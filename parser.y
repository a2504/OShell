
%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(char* s);
%}

%token IDENTIFIER
%token EOL
%token EXIT

%%

commands:
| commands command			{ ; }
;

command: executable options {; }
;

executable: IDENTIFIER		{ printf("ID\n"); }
| EXIT						{ printf("EX\n"); exit(EXIT_SUCCESS); }
;

options: EOL
| IDENTIFIER options		{ printf("OP\n"); }
;

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
