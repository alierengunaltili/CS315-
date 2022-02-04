

x = True
y = False
tmp = 0
z = -11
ch = 'app'

print(x) # true
print(type(x)) #print <class 'bool'>
print(y) # false
print(z) # -11
print(tmp) # 0
print('--------------')
print(bool(x)) # true
print(bool(y)) # false
print(bool(z)) #true
print(bool(tmp)) #false
print('-----------------')
print(not x) #False
print(not tmp) #True
print(bool(ch)) #True
print('----------------')
#True = 1, False = 0
z = None
print(True + False * True) # 0 + 1 * 1 = 1
print(5 * x + y ) #prints 5, Because x is True.
print(1 == x) #prints True
print(x > 0) #prints True 1 >0
print(y > 0) # 0 is not greater than 0. Prints False
print("*********************")
def foo():
    print('in foo')
    return True

def fun():
    print('in fun')
    return "abc"

def false():
    print('in false')
    return 0
val = -4
print(val or False) #val is not empty. Thus expression is short circuited.
print(True or false()) #True and or cause short circuiting.
print( False and foo()) #If left side of the and is False, expression is shortcircuited.
print( false() and (fun() or foo())) # this expression is short circuited after finding the false() in left side of and
print( false() and fun() or foo()) # this means ((false() and fun()) or foo()). false() and fun() = False. False or foo() = foo()
print(foo() and fun()) #True and "and" don't cause short circuit evalution
print(foo() or fun()) #foo() = True, True and "or" cause short circuit.

def inc(x):
    global tmp
    tmp = tmp + 1
    return

tmp = 15
print(tmp)
inc(tmp)
print(tmp)
print(True and inc(tmp))
print(tmp)
print(True or inc(tmp))
print(tmp)

