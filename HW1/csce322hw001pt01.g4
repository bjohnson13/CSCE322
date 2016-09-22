grammar csce322hw001pt01;

greaterThanSudoku :     { System.out.println( "\nStart File "); }
                    section section section
                        { System.out.println( "\nCease File\n"); }
                    EOF;

section           : SECTIONBEGIN
                        { System.out.println( "\nStart Section: " + $SECTIONBEGIN.text ); }
                    title
                    SECTIONEND
                        { System.out.println( "Cease Section: " + $SECTIONEND.text ); }
                  ;

title             : TITLESYMBOL '<' SECTIONNAME '>'
                        { System.out.println( "\tLabel: " + $TITLESYMBOL.text + '<' + $SECTIONNAME.text + '>' ); }
                    ASSIGNVALUE
                        { System.out.println( "\tAssign: " + $ASSIGNVALUE.text ); }
                    (list | game+)
                  ;

list              : LISTBEGIN
                        { System.out.println( "\t\tStart List: " + $LISTBEGIN.text ); }
                    listValue+
                    LISTEND
                        { System.out.println( "\t\tCease List: " + $LISTEND.text ); }
                  ;

game              : GAMEBEGIN
                        { System.out.println( "\t\tStart Game: " + $GAMEBEGIN.text ); }
                    gameBoard
                    GAMEEND
                        { System.out.println( "\t\tCease Game: " + $GAMEEND.text ); }
                  ;

listValue         : listSymbol+
                    '^'?
                  ;

gameBoard         : gameRow+
                  ;

gameRow           : gameSymbol+
                    ENDROW?
                        { System.out.println( "\t\t\tCease Row        : " + $ENDROW.text ); }
                  ;

listSymbol        : NUMBER
                        { System.out.println( "\t\t\tNumerical Symbol : " + $NUMBER.text ); }
                  ;
gameSymbol        : (DASH? NUMBER
                        {
                          String dashValue = $DASH.text;
                          if($DASH.text == null)
                          {
                            dashValue = "";
                          }
                          System.out.println( "\t\t\tNumerical Symbol : " + dashValue + $NUMBER.text );
                        }
                    | DASH
                        { System.out.println( "\t\t\tOpen Space       : " + $DASH.text ); }
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
NUMBER            : ([0-9])+ ;
DASH              : '-' ;
ENDROW            : '/n' ;
ASSIGNVALUE       : '=>' ;
WS                : [ \t\r\n ]+ -> skip ;
