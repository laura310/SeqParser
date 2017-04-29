package diagram;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import net.sourceforge.plantuml.SourceStringReader;
import test.Main;

public class SequenceDiagram {
	static String parsedCode = "";
	static  String outPath = "";

	/***
	 * ENTRY POINT OF THE WHOLE PROJECT
	 * @param args
	 */
	public static void main(String[] args){
		if(args.length != 1) {
			System.out.println("\nPlease specify the [path]/name.png of generated diagram.");
			System.out.println("e.g.: Users/laurazhou/Desktop/diagram.png");	
			return;
		}	
		outPath = args[0];

		Main testMain = new Main();
		testMain.main(args);	
		drawDiagram(parsedCode);
	}
	
	public static void addParsedCode(String parsed){
		parsedCode += parsed;
	}
	
	
	public static void drawDiagram(String parsedcode){
		try {
			OutputStream pngDiagram = new FileOutputStream(outPath);
			String seqString = "@startuml\n";
			seqString += parsedcode;
			seqString += "@enduml\n";

			SourceStringReader reader = new SourceStringReader(seqString);

			reader.generateImage(pngDiagram);

		} catch (IOException e) {
			System.out.println("IOException from drawDiagram method: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
}
