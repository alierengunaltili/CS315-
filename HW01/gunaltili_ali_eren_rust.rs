fn main() {

    let stat_array: [i32; 5] = [1, 2, 3, 4, 5];
    let mut array: [i32; 3] = [0; 3]; //all elements initialized to 0
    let mut multi_dim = [[0u8; 3]; 3];

    multi_dim[0][0] = 100;
    let mut ragged = [[0u8; 4]; 2];
    ragged[0][0] = 99;
    println!("array first item {}", multi_dim[0][0]);
    println!("array first item of ragged {}", ragged[0][0]);

    // This iterates by reference:
    println!("initial state of array" );
    for item in array.iter().enumerate() {
        let (i, x): (usize, &i32) = item;
        println!("array[{}] = {}", i, x);
    }
    println!("after changing the value of array");
    array[0] = 9;
    array[1] = 10;
    array[2] = 11;
    // This iterates by value:
    for item in array.into_iter().enumerate() {
        let (i, x): (usize, &i32) = item;
        println!("array[{}] = {}", i, x);
    }
    
    println!("Initialized array ") ; //array of 1 2 3 4 5
    for item in stat_array.into_iter().enumerate() {
        let (i, x): (usize, &i32) = item;
        println!("array[{}] = {}", i, x);
    }
     //taking slice from an array
     let full_arr = [1,2,3,4,5];
     let slice = &full_arr[1..4]; //Index 1 is inclusive 4 is exclusive
     println!("First index of sliced array {}", slice[0]);// prints 2 as the new sliced array is {2,3,4}. 
     println!("Last index of sliced array {}", slice[slice.len() - 1]); // prints the last index of sliced array which is 4

}