import org.antlr.v4.runtime.*;

public class csce322hw01pt02error extends BaseErrorListener {

  @Override
  public void syntaxError(Recognizer<?,?> recognizer,
                          Object offendingSymbol,
                          int line,
                          int charPositionInLine,
                          String msg,
                          RecognitionException e)
  {
    System.out.println("ERR: " + offendingSymbol + " in line " + line);
    System.exit(0);
  }

  
}
