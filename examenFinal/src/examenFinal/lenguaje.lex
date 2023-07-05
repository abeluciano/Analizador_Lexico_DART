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
IMPORT = r"import\s+[\'\"]([a-zA-Z_][a-zA-Z0-9_]*(\.[a-zA-Z_][a-zA-Z0-9_]*)*)[\'\"]\s*;"
CADENA = '([^"\\]*(:\\.[^"\\]*)'
ENTERO = \d+
DECIMAL = \d+\.\d+
SUMA = \+
RESTA = -
MULTIPLICACION = \*
MODULO = %
AND_LOGICO = &&
OR_LOGICO = \|\|
SUMA_ASIGNACION = \+=
RESTA_ASIGNACION = -=
MULTIPLICACION_ASIGNACION = \*=
MODULO_ASIGNACION = %=
INCREMENTO = \+\+
DECREMENTO = --
IDENTIFICADOR_VARIABLE = [_a-zA-Z][_a-zA-Z0-9]*


CARACTER_NUEVA_LINEA = \n
CARACTER_TABULACION = \t
OPERADOR_TERNARIO = \?
DOS_PUNTOS = :
DESPLAZAMIENTO_IZQUIERDA = <<
DESPLAZAMIENTO_DERECHA = >>
AND_BIT_A_BIT = &
OR_BIT_A_BIT = \|
AND_BIT_A_BIT_ASIGNACION = &=
OR_BIT_A_BIT_ASIGNACION = \|=
DESPLAZAMIENTO_IZQUIERDA_ASIGNACION = <<=
DESPLAZAMIENTO_DERECHA_ASIGNACION = >>=
CARACTER_BLANCO = [\t\s]
LITERAL_LISTA = \[.*?\]
LITERAL_MAPA = \{.*?\}
LITERAL_SIMBOLO = #[_a-zA-Z0-9]+
LITERAL_EXPRESION_REGULAR = r'.*?'
COMENTARIO_UNA_LINEA = r'//.*'
OPERADOR_PROPAGACION = \.\.\.?
LITERAL_FECHA_HORA = \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}
LITERAL_EXPRESION_FUNCION = \(.*?\) ?(=>)? 



%%

"false" { imprimir("booleano", yytext()); }
"true" { imprimir("booleano", yytext()); }
"~" { imprimir("Complemento bit a bit", yytext()); }
"^=" { imprimir("XOR bit bit asignacion", yytext()); }
"^" { imprimir("XOR bit a bit", yytext()); }
"=" { imprimir("Asignacion", yytext()); }
"/=" { imprimir("Operador division asignacion", yytext()); }
"==" { imprimir("Operador igualdad", yytext()); }
"/" { imprimir("Operador division", yytext()); }
"!" { imprimir("Negacion logica", yytext()); }
"!=" { imprimir("Operador desigualdad", yytext()); }
">" { imprimir("Operador mayor que", yytext()); }
"<" { imprimir("Operador menor que", yytext()); }
">=" { imprimir("Operador mayor o igual que", yytext()); }
"<=" { imprimir("Operador menor o igual que", yytext()); }
";" { imprimir("Punto y coma", yytext()); }
"." { imprimir("Punto", yytext()); }
"," { imprimir("Coma", yytext()); }
"(" { imprimir("Paréntesis izquierdo", yytext()); }
")" { imprimir("Paréntesis derecho", yytext()); }
"[" { imprimir("Corchete izquierdo", yytext()); }
"]" { imprimir("Corchete derecho", yytext()); }
"{" { imprimir("Llave izquierda", yytext()); }
"}" { imprimir("Llave derecha", yytext()); }
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
"class" { imprimir("Palabra clave de declaración", yytext()); }
"extends" { imprimir("Palabra clave de declaración", yytext()); }
"implements" { imprimir("Palabra clave de declaración", yytext()); }
"enum" { imprimir("Palabra clave de declaración", yytext()); }
"const" { imprimir("Palabra clave de declaración", yytext()); }
"final" { imprimir("Palabra clave de declaración", yytext()); }
"static" { imprimir("Palabra clave de declaración", yytext()); }
"async" { imprimir("Palabra clave de declaración", yytext()); }
"await" { imprimir("Palabra clave de declaración", yytext()); }
"try" { imprimir("Palabra clave de excepciones", yytext()); }
"catch" { imprimir("Palabra clave de excepciones", yytext()); }
"finally" { imprimir("Palabra clave de excepciones", yytext()); }
"throw" { imprimir("Palabra clave de excepciones", yytext()); }
"default" { imprimir("Por defecto", yytext()); }
"repeat" { imprimir("Ciclo repeat", yytext()); }
"Function" { imprimir("Palabra clave de funciones", yytext()); }
"new" { imprimir("Palabra clave de clases y objetos", yytext()); }
"super" { imprimir("Palabra clave de clases y objetos", yytext()); }
"this" { imprimir("Palabra clave de clases y objetos", yytext()); }
"public" { imprimir("Modificador de acceso", yytext()); }
"private" { imprimir("Modificador de acceso", yytext()); }
"protected" { imprimir("Modificador de acceso", yytext()); }
"import" { imprimir("Importar", yytext()); }
"export" { imprimir("Exportar", yytext()); }
"part" { imprimir("Partir", yytext()); }
"@" { imprimir("Matadato", yytext()); }
"override" { imprimir("Sobreescribir", yytext()); }
"deprecated" { imprimir("Depreciado", yytext()); }
"add" { imprimir("Agregar", yytext()); }
"remove" { imprimir("Remover", yytext()); }
"contains" { imprimir("Contiene", yytext()); }
"length" { imprimir("Longitud", yytext()); }
"isEmpty" { imprimir("Vacio", yytext()); }
"clone" { imprimir("Clonar", yytext()); }
"sort" { imprimir("Ordenar", yytext()); }
"identical" { imprimir("Palabra clave de operadores de comparación", yytext()); }
"is" { imprimir("Palabra clave de operadores de comparación", yytext()); }
"is!" { imprimir("Palabra clave de operadores de comparación", yytext()); }
"as" { imprimir("s Libreria", yytext()); }
"substring" { imprimir("Subcadena", yytext()); }
"concat" { imprimir("Concatenar", yytext()); }
"elementAt" { imprimir("Ordenar Elemento", yytext()); }
"putIfAbsent" { imprimir("Palabra clave de manejo de mapas", yytext()); }
"containsKey" { imprimir("Contiene Clave", yytext()); }
"containsValue" { imprimir("Contiene valor", yytext()); }
"get" { imprimir("Obtener valor", yytext()); }
"Set" { imprimir("Cojunto", yytext()); }
"clear" { imprimir("Limpiar conjunto", yytext()); }
"isSupersetOf" { imprimir("Superconjunto", yytext()); }
"isSubsetOf" { imprimir("Subconjunto", yytext()); }
"difference" { imprimir("Diferencia", yytext()); }
"intersection" { imprimir("Interseccion", yytext()); }
"union" { imprimir("Union", yytext()); }

{IMPORT} { imprimir("Importaciones", yytext()); }
{CADENA} { imprimir("Cadena", yytext()); }
{ENTERO} { imprimir("Entero", yytext()); }
{DECIMAL} { imprimir("Decimal", yytext()); }
{SUMA} { imprimir("Suma", yytext()); }
{RESTA} { imprimir("Resta", yytext()); }
{MULTIPLICACION} { imprimir("Multiplicacion", yytext()); }
{MODULO} { imprimir("Modulo", yytext()); }
{AND_LOGICO} { imprimir("And logico", yytext()); }
{OR_LOGICO} { imprimir("Or logico", yytext()); }
{SUMA_ASIGNACION} { imprimir("Suma asignacion", yytext()); }
{RESTA_ASIGNACION} { imprimir("Resta asignacion", yytext()); }
{MULTIPLICACION_ASIGNACION} { imprimir("Mutiplicacion asignacion", yytext()); }
{MODULO_ASIGNACION} { imprimir("Modulo asignacion", yytext()); }
{INCREMENTO} { imprimir("Incremento", yytext()); }
{DECREMENTO} { imprimir("Decremento", yytext()); }
{IDENTIFICADOR_VARIABLE} { imprimir("Identificador variable", yytext()); }

{CARACTER_NUEVA_LINEA} { imprimir("Caracter nueva linea", yytext()); }
{CARACTER_TABULACION} { imprimir("caracter tabulacion", yytext()); }
{OPERADOR_TERNARIO} { imprimir("Operador ternario", yytext()); }
{DOS_PUNTOS} { imprimir("Dos puntos", yytext()); }
{DESPLAZAMIENTO_IZQUIERDA} { imprimir("Desplazamiento izquierda", yytext()); }
{DESPLAZAMIENTO_DERECHA} { imprimir("Desplazamiento derecha", yytext()); }
{AND_BIT_A_BIT} { imprimir("AND bit a bit", yytext()); }
{OR_BIT_A_BIT} { imprimir("OR bit a bit", yytext()); }
{AND_BIT_A_BIT_ASIGNACION} { imprimir("AND bit a bit asignacion", yytext()); }
{OR_BIT_A_BIT_ASIGNACION} { imprimir("OR bit a bit asignacion", yytext()); }
{DESPLAZAMIENTO_IZQUIERDA_ASIGNACION} { imprimir("Desplazamiento izquierda asignacion", yytext()); }
{DESPLAZAMIENTO_DERECHA_ASIGNACION} { imprimir("Desplazamiento derecha asignacion", yytext()); }
{CARACTER_BLANCO} { imprimir("Caracter blanco", yytext()); }
{LITERAL_LISTA} { imprimir("Lista", yytext()); }
{LITERAL_MAPA} { imprimir("Mapa", yytext()); }
{LITERAL_SIMBOLO} { imprimir("Simbolo", yytext()); }
{LITERAL_EXPRESION_REGULAR} { imprimir("Expreion regular", yytext()); }
{COMENTARIO_UNA_LINEA} { imprimir("Comentario una linea", yytext()); }
{OPERADOR_PROPAGACION} { imprimir("Operador Propagacion", yytext()); }
{LITERAL_FECHA_HORA} { imprimir("Fecha hora", yytext()); }
{LITERAL_EXPRESION_FUNCION} { imprimir("Expresion funcion", yytext()); }

. { throw new RuntimeException("Caracter inválido \""+yytext() +
"\" en la línea "+yyline+", columna "+yycolumn); }
