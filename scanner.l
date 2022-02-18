%option noyywrap

%{

%}

%%

.*                  { printf("Error: invalid syntax!"); }

%%

int main(int argc, char **argv)
{
    yylex();

    return 0;
}
