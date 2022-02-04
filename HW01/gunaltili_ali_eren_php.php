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


$array1 = array(1, 2, 3, 4, 5);  
// $array2 = [1, 2, 3, 4, 5]; 
//debug_to_console($array1[count($array1)]); gives error that means range is checked.

$multi_dim = array ( array ( 1, 2),
                  array ( 3,4 ),
                  array(5,6,),
                  array(7,8));
//multi dim array printing with nested for loops
debug_to_console("Multi Dim");
debug_to_console("----------------");
$i = 0;
$j = 0;
for($i = 0; $i < count($multi_dim); $i++){
    for($j = 0; $j < 2; $j++){
        debug_to_console_wo_newLine($multi_dim[$i][$j]);
    }
    debug_to_console("");
}
debug_to_console("----------------");
$ragged = array ( array ( 1, 2, 3),
                  array ( 2,4 ),
                  array(6,7,8,9));
debug_to_console("--------------------------");
debug_to_console("Ragged Array");
$slicefromrag = array(0,0,0);
//slice from ragged array
$t = 0;
for($t = 0; $t < 3; $t++){
    $slicefromrag[$t] = array_slice($ragged[$t], 1, 2);
}
$x = 0;
for($x = 0; $x < 3; $x++) {
    debug_to_console($ragged[$x]);
}
debug_to_console("-----------------------");

debug_to_console("Taking slice from rag array's column with for loop");
$x = 0;
for($x = 0; $x < 3; $x++) {
    debug_to_console($slicefromrag[$x]);
}
debug_to_console("--------------------------");
$empty = array();
$empty[1] = 19;
debug_to_console_wo_newLine("After adding new item to empty: ");
debug_to_console($empty);
$arr = array(1, 2, 3, 4, 5);
$arr[0] = 99;

$slice = array_slice($arr, 1, 4); 
debug_to_console("-----------------");
debug_to_console_wo_newLine("First element: ");
debug_to_console($array1[0]);
debug_to_console_wo_newLine("First element: ");
debug_to_console($array1{0});
//debug_to_console($array1["zero"]); //cause error:  Undefined index: zero in
// print same thing [] and {} do the same job.
debug_to_console("Full Array without Slice");
debug_to_console($arr);
debug_to_console("Sliced Array");
debug_to_console($slice); // printing sliced array
$arr[10] = 100;
debug_to_console("After addition to new item in array");
debug_to_console($arr);
$x = array(11);
$y = array(9, 16); //non-homogenous 
$z = $x + $y;
debug_to_console("Sum Array of two array");
debug_to_console($z);
debug_to_console("-----------");


//assoc arrays for comparison with operators.
$x = array("first" => 51);
$y = array("first" => "51");

var_dump($x);

// == (Equal)
var_dump($x == $y);

// === (Identical)
var_dump($x === $y);
// !=, <> (Not Equal)
var_dump($x != $y);
var_dump($x <> $y);

// !== (Non Identical)
var_dump($x !== $y);

?>