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
                        { System.out.println( "Start List: " + $LISTBEGIN.text ); }
                    listValue+
                    LISTEND
                        { System.out.println( "Cease List: " + $LISTEND.text ); }
                  ;

game              : GAMEBEGIN
                        { System.out.println( "Start Game: " + $GAMEBEGIN.text ); }
                    gameBoard
                    GAMEEND
                        { System.out.println( "Cease Game: " + $GAMEEND.text ); }
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
