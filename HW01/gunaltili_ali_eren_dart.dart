import 'dart:convert';
void main() {

  List<int> arr = [1, 2, 3, 4, 5]; //only [] is allowed for subscript operator 
  //List<int> arr = []; is non-fixed size declaration.
  //But if we say var arr = new List(5); it is fixed length definition.
  arr[0] = 11; //array index starts from zero
  //arr[1.2] = 13; cause syntax error -> The argument type 'double' can't be assigned to the parameter type 'int'.
  print("First element");
  print(arr[0]);
  print("Before insertion ");
  print(arr);
  print("After insertion");
  //arr[10] = 99; gives index out of bounds
  arr.add(99);
  print(arr);

  //Range checking
  /*for(int i = 0; i <= arr.length; i++){
    arr[i] = 15; //as we give equal condition at the last, arr[arr.length] gives error.
    //range is checked by dart program.
    //Error message: RangeError (index): Invalid value: Not in range 0..4, inclusive: 5
  }
  */
  var tmp = new List(2);
  tmp[0] = 100;
  tmp[1] = 200;
  print("Array with 2 elements");
  print(tmp);
  //tmp.add(300); Unhandled exception: Unsupported operation: Cannot add to a fixed-length list
  //print("After addition");
  //print(tmp);
  //TwoD array declarations
  List<List<int>> twoD = [[1,2,3], [3,4,5], [5,6,7]]; //2d arrays can directly intialized just like oneD.
  //Or they can declared as oneD then for every index we can put array object inside of them.
  //Dart can holds object inside their array.
  var twoD_2 = new List(3);
  print("Initial state ");
  print(twoD_2);
  for(int i = 0; i < twoD.length; i++){
    twoD_2[i] = new List(3);
  }

  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      twoD_2[i][j] = 8;
    }
  }

  print("Two D Array dynamic");
  print(twoD);
  print("Two D Fixed Size");
  print(twoD_2);
  print("----------------------");
  print("Non-homogenous array");
  var mixArray = ["apple", 16.6, true, 26]; //non homogenous arrays are allowed
  print(mixArray);

  List<int> arr1 = new List(5);

  for (int i = 0; i < arr1.length; i++) {
    arr1[i] = (i + 1) * 10;
  }

  var ragged = new List(5);
  //ragged array creation
  for(int i = 0; i < 5; i++){
    ragged[i] = new List(i + 1);
  }
  for(int i = 0; i < ragged.length; i++){
    for(int j = 0; j < ragged[i].length; j++){
      ragged[i][j] = (i + 1) * 10 + j + 1;
    }
  }
  print("Ragged Array");
  print(ragged);
  print("----------------");
  //Slicing Part
  var sliced = arr.sublist(1,4);
  print("Sliced Array");
  print(sliced);

  print("----------------");
  //Array's first, last item and length of the array can be reached.
  arr1.first = 99;
  arr1.last = 89;
  print("Last item of arr1");
  print(arr1.last);
  print("Arr1 elements");
  print(arr1);
  print("Arr elements");
  print(arr);

  //operator provided for arrays
  //List<int> sum; Error Message: type 'List<dynamic>' is not a subtype of type 'List<int>'
  List<int> sum = [];
  if(arr == arr1){
    sum = arr;
  }
  else{
    sum = arr + arr1;
  }
  print("Sum of arr and arr1");
  print(sum);
  print("Equality check");
  print(sum == arr);
  print(sum != arr);
}