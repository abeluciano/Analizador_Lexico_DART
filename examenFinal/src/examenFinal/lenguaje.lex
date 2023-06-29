package examenFinal;
import java_cup.runtime.*;
%%
%{
/*-*
* funciones y variables
*/
private void imprimir(String descripcion, String lexema) {
System.out.println(lexema + " - " + descripcion);
}
%}
/*-*
* Información sobre la clase generada
*/
%public
%class AnalizadorLexico
%type void
/*-*
* Ajustes regulares
*/
BLANCO = [\n| |\t]
IDENTIFICADOR = [_a-zA-Z][_a-zA-Z0-9]*
CADENA = \"([^\\\n]|(\\.))*?\"
CARACTER = \'([^\\\n]|(\\.))\'
NUMERO_ENTERO = 0|[1-9][0-9]*
NUMERO_FLOTANTE = [0-9]+(\.[0-9]+)?
OPERADORES_MATEMATICOS = ("+" | "-" | "*" | "/")
BOOL = (true|false)
VAR = [a-zA-Z_][a-zA-Z0-9_]*
LIST = \[[^\]]*\]
MAP = \{[^\}]*\}
OBJECT = \{[^\}]*\}
SET = \{[^\}]*\}
FUNCTION = \w+\([^\)]*\)
CLASS = \w+
NUM = -?[0-9]+(\.[0-9]+)?
ENUM = \w+
TYPEDEF = \w+
DATETIME= \d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}
DURATION = \d+:\d+:\d+
ITERABLE = \w+\[\]
ITERATOR = \w+
GENERATOR = \w+
REGEXP = .+
EXCEPTION = \w+
STREAM = \w+
STREAMCONTROLLER = \w+
INT32X4 = \w+


%%
{BLANCO} { imprimir("Espacio en blanco", yytext()); }
{BOOL} { imprimir("Booleano", yytext()); }
{VAR} { imprimir("Alfanumerico", yytext()); }	
{IDENTIFICADOR} { imprimir("Identificador", yytext()); }
{CADENA} { imprimir("Cadena de texto", yytext()); }
{CARACTER} { imprimir("Carácter", yytext()); }
{NUMERO_ENTERO} { imprimir("Número entero", yytext()); }
{NUMERO_FLOTANTE} { imprimir("Número flotante", yytext()); }
{OPERADORES_MATEMATICOS} { imprimir("Operador matemático", yytext()); }
{LIST} { imprimir("Lista", yytext()); }
{MAP} { imprimir("Mapa", yytext()); }
{OBJECT} { imprimir("Objeto", yytext()); }
{SET} { imprimir("Cojunto", yytext()); }
{FUNCTION} { imprimir("Funcion", yytext()); }
{CLASS} { imprimir("Clase", yytext()); }
{NUM} { imprimir("Numero", yytext()); }
{ENUM} { imprimir("Enumeracion", yytext()); }
{TYPEDEF} { imprimir("Tipo definido", yytext()); }
{DATETIME} { imprimir("Fecha y hora", yytext()); }

{DURATION} { imprimir("Durción en horas, minutos y segundos", yytext()); }
{ITERABLE} { imprimir("Tipo iterable", yytext()); }
{ITERATOR} { imprimir("Tipo iterador", yytext()); }
{GENERATOR} { imprimir("generador", yytext()); }
{REGEXP} { imprimir("Expresion regular", yytext()); }
{EXCEPTION} { imprimir("Excepcion", yytext()); }
{STREAM} { imprimir("Flujo", yytext()); }
{STREAMCONTROLLER} { imprimir("Controlador de Flujo", yytext()); }
{INT32X4} { imprimir("Tipo 32x4", yytext()); }

"if" { imprimir("Instrucción if", yytext()); }
"else" { imprimir("Instrucción else", yytext()); }
"for" { imprimir("Instrucción for", yytext()); }
"while" { imprimir("Instrucción while", yytext()); }
"do" { imprimir("Instrucción do", yytext()); }
"switch" { imprimir("Instrucción switch", yytext()); }
"case" { imprimir("Instrucción case", yytext()); }
"break" { imprimir("Instrucción break", yytext()); }
"continue" { imprimir("Instrucción continue", yytext()); }
"return" { imprimir("Instrucción return", yytext()); }
"print" { imprimir("Instrucción print", yytext()); }
"null" { imprimir("Valor nulo", yytext()); }	
"==" { imprimir("Operador igualdad", yytext()); }
"!=" { imprimir("Operador desigualdad", yytext()); }
">" { imprimir("Operador mayor que", yytext()); }
"<" { imprimir("Operador menor que", yytext()); }
">=" { imprimir("Operador mayor o igual que", yytext()); }
"<=" { imprimir("Operador menor o igual que", yytext()); }
"=" { imprimir("Operador de asignación", yytext()); }
";" { imprimir("Punto y coma", yytext()); }
"." { imprimir("Punto", yytext()); }
"," { imprimir("Coma", yytext()); }
"(" { imprimir("Paréntesis izquierdo", yytext()); }
")" { imprimir("Paréntesis derecho", yytext()); }
"[" { imprimir("Corchete izquierdo", yytext()); }
"]" { imprimir("Corchete derecho", yytext()); }
"{" { imprimir("Llave izquierda", yytext()); }
"}" { imprimir("Llave derecha", yytext()); }
. { throw new RuntimeException("Caracter inválido \""+yytext() +
"\" en la línea "+yyline+", columna "+yycolumn); }
