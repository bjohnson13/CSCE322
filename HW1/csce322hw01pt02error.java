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
    String errorToken = parseToken(msg);

    System.out.println("ERR: " + errorToken + " in line " + line + ".");
    System.exit(0);
  }

  public String parseToken(String msg) {
    String[] token = msg.split("\\'");

    return token[1];
  }

}
