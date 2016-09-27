grammar csce322hw01pt02;

@members {
  public int hasValues = 0;
  public int hasSpaces = 0;

  public double numberOfSpaces  = 0;
  public double numberOfNumbers = 0;

  public int numberOfRows    = 0;
  public int numberOfColumns = 0;

  public boolean firstGameBoard  = true;

  public boolean ruleOne   = false;
  public boolean ruleTwo   = false;
}

greaterThanSudoku : listSection gameSection
                    EOF
                    {
                      if(ruleOne | ruleTwo) {
                        csce322hw01pt02error.semanticError(ruleOne, ruleTwo);
                      } else {
                        System.out.printf( "You need to fill %.0f spaces.\n", numberOfSpaces );
                      }
                    }
                  ;

listSection       : ( SECTIONBEGIN
                      titleValues
                      SECTIONEND
                      SECTIONBEGIN
                      titleSpaces
                      SECTIONEND
                    |
                      SECTIONBEGIN
                      titleSpaces
                      SECTIONEND
                      SECTIONBEGIN
                      titleValues
                      SECTIONEND
                    )
                  ;

gameSection       : SECTIONBEGIN
                    titleGame
                    SECTIONEND
                  ;

titleValues       : TITLESYMBOL
                    SECTIONNAMEVALUES
                    ASSIGNVALUE
                    list
                  ;

titleSpaces       : TITLESYMBOL
                    SECTIONNAMESPACES
                    ASSIGNVALUE
                    list
                  ;

titleGame         : TITLESYMBOL
                    SECTIONNAMEGAME
                    ASSIGNVALUE
                    game+
                  ;

list              : (VALUESBEGIN | SPACESBEGIN)
                    listValue
                    (VALUESEND | SPACESEND)
                  ;

game              : GAMEBEGIN
                    gameBoard
                    GAMEEND
                  ;

listValue         : listSymbol
                    listSymbol
                    listSymbol
                    listSymbol+
                  ;

gameBoard         : gameRow gameRow gameRow+
                        {
                          if(firstGameBoard)
                          {
                            firstGameBoard = false;
                            if(numberOfRows != numberOfColumns)
                            {
                              ruleOne = true;
                            }

                            Double totalSpaces = (double)numberOfRows * (double)numberOfColumns;
                            if(numberOfNumbers > (totalSpaces * 0.25)) {
                              ruleTwo = true;
                            }
                          }
                        }
                  ;

gameRow           : gameSymbol gameSymbol gameSymbol+
                      { numberOfRows++; }
                    ENDROW?
                        {
                          if ($ENDROW.text != null)
                          {
                            numberOfColumns = 0;
                          }
                        }
                  ;

listSymbol        : NUMBER VALUESEPARATOR?
                  ;

gameSymbol        : (
                      NUMBER { numberOfNumbers++; }
                    |
                      DASH  { numberOfSpaces++; }
                    )
                    { numberOfColumns++; }
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
