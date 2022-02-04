/* drone.y */
%token LSB 
%token RSB 
%token LCB 
%token RCB 
%token LP 
%token RP 
%token COMMA 
%token END_STATEMENT 
%token IF 
%token ELSE
%token FUNCTION_IDENTIFIER 
%token IN 
%token STEP 
%token WHILE 
%token AND 
%token OR 
%token ARROW 
%token RETURN 
%token STRING_IDENTIFIER
%token CHAR_IDENTIFIER 
%token EQUALS_OP 
%token GREATER_THAN 
%token LESS_THAN 
%token NOT_EQUALS 
%token LESS_OR_EQUAL
%token CONST_TYPE 
%token TRUE 
%token FALSE 
%token FLOAT_TYPE 
%token CHAR_TYPE 
%token STRING_TYPE 
%token INTEGER_TYPE
%token RAPTIN 
%token RAPTOUT 
%token INTEGER_VALUE 
%token FLOAT_VALUE 
%token DRONE_X 
%token DRONE_Y 
%token STRUCT 
%token SURFACE
%token ALTITUDE 
%token HEADING 
%token SURFACE_HEIGHT 
%token SURFACE_WIDTH 
%token SURFACE_CENTER_X 
%token SURFACE_CENTER_Y
%token SGET_HEIGHT 
%token SGET_WIDTH 
%token SGET_CENTER_X 
%token SGET_CENTER_Y 
%token CALL_FUNCTION
%token FUNCTION_GET_HEADING 
%token FUNCTION_GET_ALTITUDE 
%token FUNCTION_GET_TEMP
%token FUNCTION_NOZZLE_ON_OFF 
%token FUNCTION_HEADING_LEFT 
%token FUNCTION_HEADING_RIGHT
%token FUNCTION_STOP_DRONE 
%token FUNCTION_MOVE_FORWARD 
%token FUNCTION_CLIMB_UP 
%token FUNCTION_DROP_DOWN
%token FUNCTION_CONNECT_TO_WIFI 
%token FOR 
%token PLUS 
%token MINUS 
%token NL 
%token COMMENT 
%token GENERAL_IDENTIFIER 
%token UNDEFINED
%token BEGINNING 
%token END 
%token MAIN 
%token ASSIGNOP 
%token GREATER_OR_EQUAL 
%token BOOL 
%token DIVIDE 
%token MULTIPLY 
%token CALL_PREDEFINED
%token FUNCTION_MOVE_BACKWARD
%token FUNCTION_MOVE_LEFT
%token FUNCTION_MOVE_RIGHT
%token MATH_POW
%% 

program: BEGINNING declare_function main END {printf("Input program is valid\n"); return 0;}

main: MAIN LP RP LCB stmts RCB

stmts: stmt | stmts stmt

stmt: unmatched | matched

matched: IF LP logic_expr RP LCB matched RCB ELSE LCB matched RCB
        | init_stmt
        | declaration_stmt 
        | call_function 
        | return 
        | comment 
        | struct 
        | loop 
        | array 
        | output
        | input 

unmatched: IF LP logic_expr RP LCB matched RCB
        | IF LP logic_expr RP LCB unmatched RCB
        | IF LP logic_expr RP LCB matched RCB ELSE LCB unmatched RCB

return: RETURN id END_STATEMENT

input: RAPTIN LP type_identifier GENERAL_IDENTIFIER RP END_STATEMENT

init_stmt: type_identifier identifier ASSIGNOP term END_STATEMENT
        | type_identifier identifier ASSIGNOP values END_STATEMENT
        | surface_init_stmt 
        | type_identifier identifier ASSIGNOP call_function

values: TRUE 
        | FALSE 
        | FLOAT_VALUE

call_function: CALL_FUNCTION ARROW func_name func_param END_STATEMENT
        | CALL_PREDEFINED ARROW predefined_funcs func_param END_STATEMENT

predefined_funcs: FUNCTION_GET_HEADING 
        | FUNCTION_GET_ALTITUDE 
        | FUNCTION_MOVE_FORWARD    
        | FUNCTION_HEADING_LEFT 
        | FUNCTION_HEADING_RIGHT 
        | FUNCTION_NOZZLE_ON_OFF 
        | FUNCTION_GET_TEMP
        | FUNCTION_CLIMB_UP 
        | FUNCTION_DROP_DOWN 
        | FUNCTION_CONNECT_TO_WIFI 
        | SGET_HEIGHT
        | SGET_WIDTH 
        | SGET_CENTER_Y 
        | SGET_CENTER_X 
        | FUNCTION_MOVE_BACKWARD
        | FUNCTION_MOVE_RIGHT
        | FUNCTION_MOVE_LEFT
        | FUNCTION_STOP_DRONE
        | MATH_POW

declaration_stmt: type_identifier identifier END_STATEMENT 
        | CONST_TYPE type_identifier identifier END_STATEMENT

surface_init_stmt: SURFACE identifier ASSIGNOP surface_term END_STATEMENT

logic_expr: identifier
        | id comparison_expr id

comparison_expr: AND 
        | OR 
        | EQUALS_OP 
        |  GREATER_THAN 
        | LESS_THAN 
        | LESS_OR_EQUAL
        | NOT_EQUALS 
        | GREATER_OR_EQUAL 

type_identifier: 
        | FLOAT_TYPE 
        | INTEGER_TYPE 
        | STRING_TYPE 
        | CHAR_TYPE 
        | BOOL

identifier: GENERAL_IDENTIFIER 
        | HEADING 
        | ALTITUDE 
        | DRONE_Y 
        | DRONE_X

term:   factor 
        | term PLUS id 
        | term MINUS id

factor: 
        | factor MULTIPLY id 
        | factor DIVIDE id 
        | id

id: identifier 
        | INTEGER_VALUE 
        | string_value

surface_term: LP SURFACE_WIDTH ASSIGNOP id COMMA SURFACE_HEIGHT ASSIGNOP id
COMMA SURFACE_CENTER_X ASSIGNOP id COMMA SURFACE_CENTER_Y ASSIGNOP id RP 

struct: STRUCT GENERAL_IDENTIFIER LCB stmts RCB END_STATEMENT

array: type_identifier GENERAL_IDENTIFIER dimension END_STATEMENT

dimension: dimension LSB INTEGER_VALUE RSB 
        | LSB INTEGER_VALUE RSB

string_value: STRING_IDENTIFIER GENERAL_IDENTIFIER STRING_IDENTIFIER 

output: RAPTOUT LP id RP END_STATEMENT 

func_name: identifier 

func_param: LP param_context RP

param_context:   | identifier COMMA param_context 
        | identifier

declare_function: 
        | FUNCTION_IDENTIFIER GENERAL_IDENTIFIER LP func_param_declare RP LCB stmts RCB

func_param_declare:  | type_identifier identifier COMMA func_param_declare 
        | type_identifier identifier

loop: while_stmt 
        | for_stmt

while_stmt: WHILE LP logic_expr RP LCB stmts RCB

for_stmt: FOR LP INTEGER_TYPE GENERAL_IDENTIFIER IN INTEGER_VALUE ARROW 
term STEP arith_op id RP LCB stmts RCB

arith_op: PLUS 
        | MINUS 
        | DIVIDE 
        | MULTIPLY

comment: COMMENT

%%
#include "lex.yy.c"

int yyerror(char* s){
  fprintf(stderr, "%s on line %d\n",s, yylineno);
  return 1;
}

int main(){
  yyparse();
  return 0;
}