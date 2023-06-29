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
NOMBRE_VARIBLE = [_a-zA-Z][_a-zA-Z0-9]*
CADENA = '[_a-zA-Z][_a-zA-Z0-9]*'
CARACTER = '[_a-zA-Z0-9]'
NUMERO_ENTERO = 0|[1-9][0-9]*
NUMERO_FLOTANTE = [0-9]+(\.[0-9]+)?
OPERADORES_MATEMATICOS = ("+" | "-" | "*" | "/")
BOOL = (true|false)
LIST = \[[^\]]*\]
MAP = \{[^\}]*\}
OBJECT = \{[^\}]*\}
SET = \{[^\}]*\}
FUNCTION = \w+\([^\)]*\)
NUM = -?[0-9]+(\.[0-9]+)?
DATETIME= \d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}
DURATION = \d+:\d+:\d+
ITERABLE = \w+\[\]


%%
"void main()" { imprimir("Funcion Principal", yytext()); }
"if" { imprimir("Instrucción if", yytext()); }
"String" { imprimir("Variable String", yytext()); }
"int" { imprimir("Varible int", yytext()); }
"float" { imprimir("Variable Float", yytext()); }
"double" { imprimir("Variable double", yytext()); }
"var" { imprimir("varible alfanumerica", yytext()); }
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
{BLANCO} { imprimir("Espacio en blanco", yytext()); }
{NOMBRE_VARIBLE} { imprimir("Nombre de la variable", yytext()); }
{BOOL} { imprimir("Booleano", yytext()); }
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
{NUM} { imprimir("Numero", yytext()); }
{DATETIME} { imprimir("Fecha y hora", yytext()); }
{DURATION} { imprimir("Durción en horas, minutos y segundos", yytext()); }
{ITERABLE} { imprimir("Tipo iterable", yytext()); }
. { throw new RuntimeException("Caracter inválido \""+yytext() +
"\" en la línea "+yyline+", columna "+yycolumn); }
