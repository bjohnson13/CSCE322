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
                        {
                          //System.out.println( "Cease File");
                          System.out.printf( "You need to fill %.0f spaces...\n", numberOfSpaces );
                        }
                    EOF;

section           : SECTIONBEGIN
                    title
                    SECTIONEND
                  ;

title             : TITLESYMBOL (SECTIONNAMEVALUES | SECTIONNAMESPACES | SECTIONNAMEGAME)
                        {
                          String sectionName = $text;
                          if(sectionName.equals("Spaces")) {
                            hasSpaces++;
                            if(hasSpaces > 1)
                            {
                              // TODO: Throw Parse Error - ?Rule 1
                              //System.out.println( "----------------------------ERROR: Too Many Spaces Sections");
                            }
                          } else if (sectionName.equals("Values")) {
                            hasValues++;
                            if(hasValues > 1)
                            {
                              // TODO: Throw Parse Error - ?Rule 1
                              //System.out.println( "----------------------------ERROR: Too Many Values Sections");
                            }
                          } else if (sectionName.equals("Game")) {
                            hasGame++;
                            if(hasGame > 1)
                            {
                              // TODO: Throw Parse Error - ?Rule 1
                              //System.out.println( "----------------------------ERROR: Too Many Game Sections");
                            }
                          }
                        }
                    ASSIGNVALUE
                    (list | game+)
                  ;

list              : (VALUESBEGIN | SPACESBEGIN)
                        {   numberOfValues = 0; }
                    listValue+
                    (VALUESEND | SPACESEND)
                        {
                          if(numberOfValues <= 3) {
                            //TODO: Throw Parse ERROR - ?Rule 4
                            //System.out.println("----------------------------ERROR: Not Enought Values in " + listType + " section");
                          }
                        }
                  ;

game              : GAMEBEGIN
                    gameBoard
                    GAMEEND
                  ;

listValue         : listSymbol+
                    VALUESEPARATOR?
                  ;

gameBoard         : gameRow+
                        {
                          if(numberOfRows <= 2)
                          {
                            // TODO: Throw Parse Error - ?Rule 2
                            //System.out.println( "----------------------------ERROR: Not Enought Rows");
                          }

                          if(firstGameBoard)
                          {
                            firstGameBoard = false;
                            if(numberOfRows != numberOfColumns)
                            {
                              //TODO: Throw Semantic Error - Rule 1
                              //System.out.println("----------------------------Number of Rows do not equal Number of Columns");
                            }

                            if(numberOfNumbers > (numberOfSpaces / 4)) {
                              //TODO: Throw Semantic Error - Rule 2
                              //System.out.println("----------------------------Too Many Numbers, not enough Spaces");
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
                            if(numberOfColumns <= 2)
                            {
                              // TODO: Throw Parse Error - ?Rule 3
                              //System.out.println( "----------------------------ERROR: Not Enought Columns");
                            }
                            numberOfColumns = 0;
                          }
                        }
                  ;

listSymbol        : NUMBER { numberOfValues++; }
                  ;

gameSymbol        : (NUMBER { numberOfNumbers++; }
                    | DASH  { numberOfSpaces++; }
                    ) { numberOfColumns++; }
                  ;

SECTIONBEGIN      : '%section%'  ; //{ System.out.println( "Start Section: " + getText() ); } ;
SECTIONEND        : '$section'   ; //{ System.out.println( "Cease Section: " + getText() ); } ;
TITLESYMBOL       : '%title%'    ; //{ System.out.print( "Label: " + getText() ); };
SECTIONNAMESPACES : '<Spaces>'   ; //{ System.out.println( "<Spaces>" ); } ;
SECTIONNAMEVALUES : '<Values>'   ; //{ System.out.println( "<Values>" ); } ;
SECTIONNAMEGAME   : '<Game>'     ; //{ System.out.println( "<Game>" ); } ;
GAMEBEGIN         : '%game%'     ; //{ System.out.println( "Start Values: " + getText() ); } ;
GAMEEND           : '$game'      ; //{ System.out.println( "Cease Values: " + getText() ); } ;
SPACESBEGIN       : '%spaces%'   ; //{ System.out.println( "Start Spaces: " + getText() ); } ;
SPACESEND         : '$spaces'    ; //{ System.out.println( "Cease Spaces: " + getText() ); } ;
VALUESBEGIN       : '%values%'   ; //{ System.out.println( "Start Values: " + getText() ); } ;
VALUESEND         : '$values'    ; //{ System.out.println( "Cease Values: " + getText() ); } ;
NUMBER            : ('-'?[0-9])+ ; //{ System.out.println( "Numerical Symbol: " + getText() ); } ;
DASH              : '-'          ; //{ System.out.println( "Open Space: " + getText() ); } ;
ENDROW            : '/n'         ; //{ System.out.println( "Cease Row: " + getText() ); } ;
ASSIGNVALUE       : '=>'         ; //{ System.out.println( "Assign: " + getText() ); } ;
VALUESEPARATOR    : '^' ;
WS                : [ \r\n ]+ -> skip ;

ERROR             :
                    . {
                      System.out.println("ERR: " + getText() + " in line " + getLine());
                      System.exit(0);
                    }
                  ;
