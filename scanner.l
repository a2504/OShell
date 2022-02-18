%option noyywrap

%{

%}

%%

[^ \t\n]*           { printf("IDENTIFIER\n"); }
[ \t\n]             {  }                            /*ignoring whitespace*/

%%

int main(int argc, char **argv)
{
    yylex();

    return 0;
}
