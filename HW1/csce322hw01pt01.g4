grammar csce322hw01pt01;

greaterThanSudoku : .*?
                        { System.out.println( "Cease File"); }
                    EOF
                  ;

SECTIONBEGIN      : '%section%' { System.out.println( "Start Section: " + getText() ); } ;
SECTIONEND        : '$section'  { System.out.println( "Cease Section: " + getText() ); } ;
TITLESYMBOL       : '%title%'   { System.out.print( "Label: " + getText() ); };
SPACESBEGIN       : '%spaces%'  { System.out.println( "Start Spaces: " + getText() ); } ;
SPACESEND         : '$spaces'   { System.out.println( "Cease Spaces: " + getText() ); } ;
VALUESBEGIN       : '%values%'  { System.out.println( "Start Values: " + getText() ); } ;
VALUESEND         : '$values'   { System.out.println( "Cease Values: " + getText() ); } ;
GAMEBEGIN         : '%game%'    { System.out.println( "Start Values: " + getText() ); } ;
GAMEEND           : '$game'     { System.out.println( "Cease Values: " + getText() ); } ;
SECTIONNAMESPACES : '<Spaces>'  { System.out.println( "<Spaces>" ); } ;
SECTIONNAMEVALUES : '<Values>'  { System.out.println( "<Values>" ); } ;
SECTIONNAMEGAME   : '<Game>'    { System.out.println( "<Game>" ); } ;
NUMBER            : ('-'?[0-9])+ { System.out.println( "Numerical Symbol: " + getText() ); } ;
DASH              : '-'         { System.out.println( "Open Space: " + getText() ); } ;
ENDROW            : '/n'        { System.out.println( "Cease Row: " + getText() ); } ;
VALUESEPARATOR    : '^' ;
ASSIGNVALUE       : '=>'        { System.out.println( "Assign: " + getText() ); } ;
WS                : [ \r\n ]+ -> skip ;

ERROR             :
                    . {
                      System.out.println("ERR: " + getText() + " in line " + getLine() + ".");
                      System.exit(0);
                    }
                  ;
