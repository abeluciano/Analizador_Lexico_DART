package examenFinal;
import java.io.File;

public class Generador {

	public static void main(String[] args) {
		
		String path ="E:/abel/eclipse/examenFinal/src/examenFinal/";
		String archivo = path + "lenguaje.lex";
		
		File file = new File(archivo);
		jflex.Main.generate(file);
	}

}
