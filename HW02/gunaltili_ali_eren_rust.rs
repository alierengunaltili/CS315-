
fn main() {
    let b:bool = true;
    let a:bool = false;
    let c:bool = a |b;
    println!("-----1-----");
    println!("{}", c); //true
    let d:bool = a >=b;
    let e:bool = b >= a;
    println!("-----2-----");
    println!("{}", d); //false
    println!("-----3-----");
    println!("{}", e); //true
    println!("-----4-----");
    println!("{}", a && b);
    println!("-----5-----");
    let x:bool = false;
    println!("{}",  b || foo());
    println!("-----6-----");
    println!("{}", foo() || b);
    println!("-----7-----");
    println!("{}", foo() || fun());
    println!("-----8-----");
    println!("{}", fun() && foo());
    println!("-----9-----");
    println!("{}", foo() && fun());
        println!("-----10----");
    println!("{}", foo() & fun());
        println!("-----11-----");
    println!("{}", fun() | foo());
        println!("-----12-----");
    println!("{}", true && true || foo());
        println!("-----13-----");
    println!("{}", foo() && true || foo());
}
fn foo()->bool{
    println!("in foo");
    return false;}
fn fun()->bool{
    println!("in fun");
    return true;}