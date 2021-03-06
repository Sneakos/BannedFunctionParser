%{
	typedef struct
	{
		char text[250];
	} ttext;
	
	#define YYSTYPE ttext
	
	#include "p.tab.h"
%}

BANNED strcpy|strcpyA|strcpyW|wcscpy|_tcscpy|_mbscpy|StrCpy|StrCpyA|StrCpyW|lstrcpy|lstrcpyA|lstrcpyW|_tccpy|_mbccpy|_ftcscpy|strncpy|wcsncpy|_tcsncpy|_mbsncpy|_mbsnbcpy|StrCpyN|StrCpyNA|StrCpyNW|StrNCpy|strcpynA|StrNCpyA|StrNCpyW|lstrcpyn|lstrcpynA|lstrcpynW|strcat|strcatA|strcatW|wcscat|_tcscat|_mbscat|StrCat|StrCatA|StrCatW|lstrcat|lstrcatA|lstrcatW|StrCatBuff|StrCatBuffA|StrCatBuffW|StrCatChainW|_tccat|_mbccat|_ftcscat|strncat|wcsncat|_tcsncat|_mbsncat|_mbsnbcat|StrCatN|StrCatNA|StrCatNW|StrNCat|StrNCatA|StrNCatW|lstrncat|lstrcatnA|lstrcatnW|lstrcatn|sprintfW|sprintfA|wsprintf|wsprintfW|wsprintfA|sprintf|swprintf|_stprintf|wvsprintf|wvsprintfA|wvsprintfW|vsprintf|_vstprintf|vswprintfwnsprintf|wnsprintfA|wnsprintfW|_snwprintf|snprintf|sntprintf_vsnprintf|vsnprintf|_vsnwprintf|_vsntprintf|wvnsprintf|wvnsprintfA|wvnsprintfW|_snwprintf|_snprintf|_sntprintf|nsprintf|wvsprintf|wvsprintfA|wvsprintfW|vsprintf|_vstprintf|vswprintf|_vsnprintf|_vsnwprintf|_vsntprintf|wvnsprintf|wvnsprintfA|wvnsprintfW|strncpy|wcsncpy|_tcsncpy|_mbsncpy|_mbsnbcpy|StrCpyN|StrCpyNA|StrCpyNW|StrNCpy|strcpynA|StrNCpyA|StrNCpyW|lstrcpyn|lstrcpynA|lstrcpynW|_fstrncpy|strncat|wcsncat|_tcsncat|_mbsncat|_mbsnbcat|StrCatN|StrCatNA|StrCatNW|StrNCat|StrNCatA|StrNCatW|lstrncat|lstrcatnA|lstrcatnW|lstrcatn|_fstrncat|strtok|_tcstok|wcstok|_mbstok|makepath|_tmakepath|_makepath|_wmakepath|_splitpath|_tsplitpath|_wsplitpath|scanf|wscanf|_tscanf|sscanf|swscanf|_stscanf|snscanf|snwscanf|_sntscanf|_itoa|_itow|_i64toa|_i64tow|_ui64toa|_ui64tot|_ui64tow|_ultoa|_ultot|_ultow|gets|_getts|_gettws|CharToOem|CharToOemA|CharToOemW|OemToChar|OemToCharA|OemToCharW|CharToOemBuffA|CharToOemBuffW|alloca|_alloca|strlen|wcslen|_mbslen|_mbstrlen|StrLen|lstrlen|memcpy|RtlCopyMemory|CopyMemory|wmemcpy|ChangeWindowMessageFilter

%%

"#ifndef OMITBAD"									{ return bad; }
"#ifndef OMITGOOD"									{ return good; }
"#ifndef "											{ return ifndef; }
"#endif"											{ strcpy( yylval.text, yytext); return endif; }
" "*\t*"/*"([^*]|"*"[^/])*"*/"|" "*\t*"//"[^\n]*	{ return comment; }
\n" "*\t*"//".*										{ return lineComment; }
"{" 												{ return lBracket; }
"}" 												{ return rBracket; }
{BANNED}(" "|"(")									{ strcpy( yylval.text, yytext); return banned;  }
.|\n|" "*											{ strcpy( yylval.text, yytext); return line; }
\n*" "*\t*"#ifdef INCLUDEMAIN"						{ yyterminate(); }
<<EOF>>												{ yyterminate(); }

%%