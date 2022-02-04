<?php

//function for printing to console
function debug_to_console($data) {
    $output = $data;
    if (is_array($output))
        $output = implode(',', $output);

    echo "" . $output . "\n";
}

//function for printing to console in  same line
function debug_to_console_wo_newLine($data) {
    $output = $data;
    if (is_array($output))
        $output = implode(',', $output);

    echo "" . $output . " ";
}




$a = false;
$b = true;
$c = $b and $a; // assignment has higher precedence than "and". Thus
// b directly takes the c's value.
$d = ($b and $a); // () has higher precedence than assignment. Therefore first "and" is executed
// inside the parantheses. 
$e = $b && $a; // e = false because && has higher precedence than assignment operator.
var_dump((bool) $c);
var_dump((bool) $d);
var_dump((bool) $e);
var_dump($b > $a);
var_dump((bool) $a > $b);
var_dump($a * $b);
var_dump($a + $b);
var_dump('----------------------');
function foo(){
    var_dump('in foo');
    return true;
}

function fun(){
    var_dump('in fun');
    return 'abc';
}

function falseFun(){
    var_dump('in false fun');
    return '';
}
$x = false;
$y = '';
$z = -5;
var_dump($y and $z); //after finding empty y left of and shortcircuit the expression.
var_dump($z or $x); //nonempty variable in left of side of the or.
var_dump((bool) (foo() || falseFun())); //doesn't go inside of falseFun()
var_dump((bool) (false && foo())); // doesn't go inside of foo
var_dump((bool) (true or false and falseFun())); // after seeing true left of the or, expression is short circuited.
var_dump(fun() * foo());
var_dump($x & foo()); //don't use shortcircuit
var_dump($z | falseFun()); //don't do shortcircuit eventhough left of the or is nonempty.
?>