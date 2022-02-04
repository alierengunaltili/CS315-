package main
import "fmt"

//g is global value
var g int = 20

func test2(x int){
	fmt.Println(x)
}

func add(x int, y int){
	fmt.Println(x + y)
}

func addWithReturn(x,y int) (int,int) {
	fmt.Println("Inside of add function")
	return x+ y, x- y
}

//same thing with addWithReturn
func returnWithVariable(x,y int)(z1, z2 int){
	defer addWithReturn(z1,z2)
	z1 = x + y
	z2 = x - y
	fmt.Println("Before return")
	return
}
func recursion(x int) int{
	if(x == 0){
		return 1
	}
	defer fmt.Println("x is ", x)
	return (x) * recursion(x - 1)
}

//nested1 and nested2 created for trying defer statement in multiple functions
//defer can call other function or statement but it is not directly same thing with 
//nested functions.
func nested2(y int){
	//when we try to reach nested1's local variable x inside of nested2 
	//we face with error since we reach nested2 with defer statement.
	fmt.Println(y)
}
func nested1(x int){
	x = 15
	defer nested2(36)
}

func nested3(y int) int{
	var x = 15
	nested4 := func(y int){
		x = x * 2
		fmt.Println("x:",x)
	}
	defer nested4(y)
	return x
}
func nest1(x int){
	g = 77 //updating the global g
	var g = 35
	nest2 := func(x int){
		g = 55
		fmt.Println("Inside nest2 g:", g)
	}
	nest3 := func(g int){
		fmt.Println("Inside nest3 g:", g)
	}
	nest2(x)
	nest3(x)
}
func test(){
	var g = 40
	fmt.Println("test")
	fmt.Println("g in test:", g)
}

//call-by-value swap by using copy of actual parameters and put the copied values inside formal parameters.
func swap(x,y int){
	var tmp int
	tmp = x
	x = y
	y = tmp
	fmt.Println("Address of x in swap method call by value", &x)
	fmt.Println("Address of y in swap method call by value", &y)
	fmt.Println("Inside call-by-value swap x",x)
	fmt.Println("Inside call-by-value swap y", y)
}

//call-by-reference to change some values inside of the function by using pointer to variable's address value.
func swapRef(x,y *int){
	var tmp int
	tmp = *x
	*x = *y
	*y = tmp
	fmt.Println("Address of pointer x in reference method", x)
	fmt.Println("Address of pointer y in reference method", y)
	fmt.Println("Inside call-by-reference swap x",*x)
	fmt.Println("Inside call-by-reference swap y", *y)
}

//default parameter passing is not supported but programmer can built some special methods to be used.
func defaultMethod(y int){
	if y == -99 {
		fmt.Println("Succesfull")
	} else{
		fmt.Println("Unsuccesfull")
	}
}

//function as a parameter of a function
//In go language functions are data types, they can be assigned into some values or taking as a parameter in functions.
func funcParam(myFunc func(int)int){
	fmt.Println(myFunc(7))
}

//closure part
func closure(x string) func(){
	return func(){ fmt.Println(x)}
}

//closure example which returns func() int.
func returnFunc() func() int{
	i := 0
	return func() int{
		i++
		return i
	}
}

func main(){
	var tmp = 66
	var par = 88
	fmt.Println("Beginning")
	y := func(tmp int){
		fmt.Println("Insıde of nested")
		tmp = 68 //this tmp changes the tmp in main as main function is parent for y:= func.
		defer test()
	}
	fmt.Println("Outside of func")
	y(88)
	fmt.Println("After function call")
	fmt.Println("--------------------")
	fmt.Println(tmp)
	fmt.Println(par)
	res := nested3(12)
	fmt.Println("Res:", res)
	x := test //example of assigning some variable to function itself
	x() //calling test() or assigning x to test then call x() are same thing.
	//simple function calls writed to understand function in golang
	var a = 11
	var b = 9
	b1,b2 := returnWithVariable(a,b) //multiple return values put it into the b1 and b2 respect to their places.
	fmt.Println(b1) //trying to print return value
	fmt.Println(b2)
	fmt.Println("----------------------------")
	rec := recursion(5) //trying recursion function 
	fmt.Println("Result: ",  rec)
	fmt.Println("BELOW PART IS FOR SCOPE, GLOBAL, LOCAL VARIABLES")
	fmt.Println("--------------------------------")
	var g = 30
	test()
	fmt.Println("g:", g)
	fmt.Println("Calling nest function to show nested function and formal parameter scoping.")
	nest1(88)
	fmt.Println("-------------------------")
	//parameter passing method comparison
	fmt.Println("BELOW PART IS FOR PARAMETER PASSING METHOD")
	fmt.Println("Call by value part")
	var par1 = 88
	var par2 = 44
	fmt.Println("Before call-by-value swap x", par1)
	fmt.Println("Before call-by-value swap y", par2)
	fmt.Println("Address of x in main", &par1)
	fmt.Println("Address of y in main", &par2)
	swap(par1,par2)
	fmt.Println("After call-by-value swap x", par1)
	fmt.Println("After call-by-value swap y", par2)
	fmt.Println("Call by reference part")
	par1 = 100
	par2 = 200
	fmt.Println("Address of x in main", &par1)
	fmt.Println("Address of y in main", &par2)
	fmt.Println("Before call-by-reference swap x", par1)
	fmt.Println("Before call-by-reference swap y", par2)
	swapRef(&par1,&par2)
	fmt.Println("After call-by-reference swap x",par1)
	fmt.Println("After call-by-reference swap y", par2)
	fmt.Println("-------------------------")

	var def = -99
	defaultMethod(def)

	fmt.Println("BELOW PART IS CLOSURES AND FUNCTIONS AS A SUBPROGRAM")
	funcParam(nested3)
	//different ways to call function
	func(x int){
		fmt.Println("Function is called after its creation", x )
	}(16)
	funcTmp := closure("HELLO")
	funcTmp()
	nextInt := returnFunc()
	fmt.Println("First call of closure",nextInt())
	fmt.Println("Second call of closure", nextInt())
	fmt.Println("Fourth call of closure", nextInt())
	updated := nextInt
	fromBeginning := returnFunc
	fmt.Println("Already defined", updated())
	fmt.Println(fromBeginning()())
}
