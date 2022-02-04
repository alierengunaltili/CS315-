import 'dart:convert';
bool foo(){
  print("in foo");
  return true;
}

bool fun(){
  print("in fun");
  return false;
}
void main() {
  
  bool vr = true;
  bool tmp = false;
  bool y = tmp && vr;
  bool t = tmp || vr;
  print("y = ${y}" );
  print("t = ${t}");
  print("boolean expression calculation ")
  print(y & t); //bitwise and
  print(y ^ t); //xor 
  print(vr || foo());
  print(tmp && foo());
  print(vr | foo());
  print(vr || fun() && false );
  print(false || vr && fun());
}
