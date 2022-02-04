package main
import "fmt"

//g is global value
var g int = 20
var i int = 40


func returnFunc() func() int{
	i := 0
	return func() int{
		i++
		return i
	}
}

func main(){
	nextInt := returnFunc()
	fmt.Println(nextInt())
	fmt.Println(nextInt())
	fmt.Println(nextInt())
	updated := nextInt
	fromBeginning := returnFunc
	fmt.Println("Already defined", updated())
	fmt.Println(fromBeginning()())
}

