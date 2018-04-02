%{
	
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>	
	
	typedef struct
	{
		char text[250];
	} ttext;
	
	FILE *yyin;
	
	#define YYSTYPE ttext
	
	int yylex();
	void yyerror( char *s );
	int ifs;
	
	#include "p.c"
%}

%token comment
%token lineComment
%token line
%token banned
%token bad
%token good
%token lBracket
%token rBracket
%token endif
%token ifndef

%%
	Start : Start bad Statements { addFile(1); removeFile(0); }
		  | Start good Statements { addFile(0); removeFile(1); }
		  | Start Statements
		  | Statements
	;
	
	Statements : line {
						printFile($1.text);
					  }
			   | banned { 
							printFile("!BANNED! ");
							printFile($1.text); }
			   | endif {
						if(ifs > 0)
						{
							printFile($1.text);
							ifs--;
						}
					   }
			   | ifndef {
							printFile("ifndef ");
							ifs++;
						}
			   | comment {}
			   | lineComment {}
			   | lBracket { printFile("$BEGIN"); }
			   | rBracket { printFile("$END"); }
	;


%%

int main(int argc, char *argv[])
{
	openFiles(argv[1]);
	yyin = fopen(argv[1], "r");
	yyparse();
	fclose(yyin);
	closeFiles();
	return 0;
}

void yyerror(char *s)
{
	printf ("Parsing Error\n");
}