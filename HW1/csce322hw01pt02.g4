grammar csce322hw01pt02;

@members {
  public int hasValues = 0;
  public int hasSpaces = 0;
  public int hasGame   = 0;

  public double numberOfSpaces  = 0;
  public double numberOfNumbers = 0;

  public int numberOfValues  = 0;
  public int numberOfRows    = 0;
  public int numberOfColumns = 0;

  public boolean firstGameBoard  = true;
}

greaterThanSudoku : section section section
                        { System.out.println( "Cease File"); }
                    EOF;

section           : SECTIONBEGIN
                        { System.out.println( "Start Section: " + $SECTIONBEGIN.text ); }
                    title
                    SECTIONEND
                        { System.out.println( "Cease Section: " + $SECTIONEND.text ); }
                  ;

title             : TITLESYMBOL '<' SECTIONNAME '>'
                        { System.out.println( "Label: " + $TITLESYMBOL.text + '<' + $SECTIONNAME.text + '>' );
                          if($SECTIONNAME.text.equals("Spaces")) {
                            hasSpaces++;
                            if(hasSpaces > 1)
                            {
                              // TODO: Throw Parse Error
                              System.out.println( "ERROR: Too Many Spaces Sections");
                            }
                          } else if ($SECTIONNAME.text.equals("Values")) {
                            hasValues++;
                            if(hasValues > 1)
                            {
                              // TODO: Throw Parse Error
                              System.out.println( "ERROR: Too Many Values Sections");
                            }
                          } else if ($SECTIONNAME.text.equals("Game")) {
                            hasGame++;
                            if(hasGame > 1)
                            {
                              // TODO: Throw Parse Error
                              System.out.println( "ERROR: Too Many Game Sections");
                            }
                          }
                        }
                    ASSIGNVALUE
                        { System.out.println( "Assign: " + $ASSIGNVALUE.text ); }
                    (list | game+)
                  ;

list              : LISTBEGIN
                        { String listType = "Spaces";
                          if ($LISTBEGIN.text.contains("values"))
                          {
                            listType = "Values";
                          }
                          System.out.println( "Start " + listType + ": " + $LISTBEGIN.text);
                          numberOfValues = 0;
                        }
                    listValue+
                    LISTEND
                        { System.out.println( "Cease " + listType + ": " + $LISTEND.text );
                          if(numberOfValues <= 3) {
                            //TODO: Throw Parse ERROR
                            System.out.println("ERROR: Not Enought Values in " + listType + " section");
                          }
                        }
                  ;

game              : GAMEBEGIN
                        { System.out.println( "Start Values: " + $GAMEBEGIN.text ); }
                    gameBoard
                    GAMEEND
                        { System.out.println( "Cease Values: " + $GAMEEND.text ); }
                  ;

listValue         : listSymbol+
                    VALUESEPARATOR?
                  ;

gameBoard         : gameRow+
                        {
                          if(numberOfRows <= 2)
                          {
                            // TODO: Throw Parse Error
                            System.out.println( "ERROR: Not Enought Rows");
                          }

                          if(firstGameBoard)
                          {
                            firstGameBoard = false;
                            if(numberOfRows != numberOfColumns)
                            {
                              //TODO: Throw Semantic Error
                              System.out.println("-------------------------Number of Rows do not equal Number of Columns");
                            }

                            if(numberOfNumbers > (numberOfSpaces / 4)) {
                              //TODO: Throw Semantic Error
                              System.out.println("-------------------------Too Many Numbers, not enough Spaces");
                            }
                          }
                        }
                  ;

gameRow           : gameSymbol+
                      { numberOfRows++; }
                    ENDROW?
                        {
                          if ($ENDROW.text != null)
                          {
                            System.out.println( "Cease Row: " + $ENDROW.text );

                            if(numberOfColumns <= 2)
                            {
                              // TODO: Throw Parse Error
                              System.out.println( "ERROR: Not Enought Columns");
                            }

                            numberOfColumns = 0;
                          }
                        }
                  ;

listSymbol        : NUMBER
                        { System.out.println( "Numerical Symbol: " + $NUMBER.text );
                          numberOfValues++;
                        }
                  ;
gameSymbol        : (NUMBER
                        { System.out.println( "Numerical Symbol: " + $NUMBER.text );
                          numberOfNumbers++;
                        }
                    | DASH
                        { System.out.println( "Open Space: " + $DASH.text );
                          numberOfSpaces++;
                        }
                    )
                    { numberOfColumns++; }
                  ;

SECTIONBEGIN      : '%section%' ;
SECTIONEND        : '$section' ;
GAMEBEGIN         : '%game%' ;
GAMEEND           : '$game' ;
TITLESYMBOL       : '%title%' ;
LISTBEGIN         : '%' ( 'spaces' | 'values' ) '%' ;
LISTEND           : '$' ( 'spaces' | 'values' ) ;
SECTIONNAME       : ( 'Spaces' | 'Values' | 'Game' ) ;
NUMBER            : ('-'?[0-9])+ ;
DASH              : '-' ;
ENDROW            : '/n' ;
VALUESEPARATOR    : '^' ;
ASSIGNVALUE       : '=>' ;
WS                : [ \r\n ]+ -> skip ;

//ERROR             :
//                    . {
//                      System.out.println("ERR: " + getText() + " in line " + getLine());
//                      System.exit(0);
//                    }
//                  ;
