grammar csce322hw01pt01;

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
                        { System.out.println( "Label: " + $TITLESYMBOL.text + '<' + $SECTIONNAME.text + '>' ); }
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
                          System.out.println( "Start " + listType + ": " + $LISTBEGIN.text ); }
                    listValue+
                    LISTEND
                        { System.out.println( "Cease " + listType + ": " + $LISTEND.text ); }
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
                  ;

gameRow           : gameSymbol+
                    ENDROW?
                        {
                          if ($ENDROW.text != null)
                          {
                            System.out.println( "Cease Row: " + $ENDROW.text );
                          }
                        }
                  ;

listSymbol        : NUMBER
                        { System.out.println( "Numerical Symbol: " + $NUMBER.text ); }
                  ;
gameSymbol        : (NUMBER
                        { System.out.println( "Numerical Symbol: " + $NUMBER.text ); }
                    | DASH
                        { System.out.println( "Open Space: " + $DASH.text ); }
                    )
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

error             :
                    {
                      System.out.println("ERR: " + getText() + " in line " + getLine());
                      System.exit(0);
                    }
                  ;
