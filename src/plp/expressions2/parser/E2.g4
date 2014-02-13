grammar E2;

programa : expressao ;

expressao : 'length' expressao               # opUnaria
          | 'not' expressao                  # opUnaria
          | '-' expressao                    # opUnaria
          | expressao ('+'|'-') expressao    # opBin
          | expressao '==' expressao         # opBin
          | expressao 'and' expressao        # opBin
          | expressao 'or' expressao         # opBin
          | expressao '++' expressao         # opBin
          | valor                            # terminal
          | ID                               # id
          | 'let' decVars 'in' expressao     # decVar
          ;

valor : Inteiro | Booleano | String ;

decVars: decVariavel (',' decVariavel)*;

decVariavel : 'var' ID '=' expressao ;

Inteiro : ('0'..'9')+ ;
Booleano : 'verdadeiro' | 'falso';
String : '"' .*? '"' ;
S: (' '|'\n'|'\t') -> skip;
ID: ('a'..'z'|'A'..'Z')+;
