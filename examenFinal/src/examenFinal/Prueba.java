package examenFinal;

import java.io.IOException;
import java.io.StringReader;

public class Prueba {

	public static void main(String[] args) {
		String expresion ="void main() { String nombre = 'Juan';";
		
		AnalizadorLexico lexico = new AnalizadorLexico(new StringReader(expresion));
		try {
			lexico.yylex();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
