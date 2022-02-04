import numpy as np
import warnings
warnings.filterwarnings("ignore", category=np.VisibleDeprecationWarning)
# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

print("--------------------")

a = np.array([10,20,30,50,100])
b = np.array([[1, 2, 3, 4, 5],[6,7,8,9,10]]) #directly initialized
b[len(b) - 1] = 99
c = np.array([[1, 2, 3], [4, 5, 6]])
d = np.array([[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]])
e = np.empty(4)
f= b + a
g = a * b
h = a ** 2
print("Not equality comparison: ", end = "")
print(b !=a)
print("Summation of two array: " , end = "")
print(f)
print("Multiplication of two array: " , end = "")
print(g)
print("Exponent of array: " , end = "")
print(h)
print("Array E before initialization: ", end = "")
print(e)
for i in range(4):
    e[i] = 0
print("Array E after initialization: ", end = "")
print(e)
a = np.array([11,22,33,44])
print("Array A: ", end= "")
print(a)
print("Array B: ", end= "")
print(b)
print("Array C: ", end= "")
print(c)
print("Array D: ", end= "")
print(d)

print("--------------------------")
print("First element of multiDim Array: ", end= "")
print(d[0])
#print(d['a']) # only integers are allowed

#ragged array creation
print("Ragged Array: ", end = "")
ragg = np.array([[[1,2,3],[4,5,6]], [[11,22,33], [41,51,61],[71,81,91]]])
for i in range(len(ragg)):
    for j in range(len(ragg[i])):
        print(ragg[i][j])

print('-------------------')
print("Ragged array without for loop: ", end = "")
print(ragg)

sorted = np.arange(5) #create array with size 15 and sorted ascending order.
print("Last element of sorted array with size 5: " , end = "")
print(sorted[len(sorted) - 1])
#print(sorted[len(sorted)]) #cause error: index is out of bounds
print("Sorted array with size 5: " , end = "")
print(sorted)
print("value at index 1: ", end= "")
print(sorted[1])
print("value at index 2: ", end= "")
print(sorted[2])

arr = np.array([1, 2, 3.7, 18])
print("Before adding string to array: ", end = "")
print(arr)
app = "apple"
arr1 = np.array([1, 2, 3.7, 18, "abc", app])
print("After adding string to array: ", end = "")
print(arr1)
print("Not sliced array: ", end = "")
print(arr)
tmp_arr = arr[1:3] #index 1 inclusive index 3 not. Basically from index 1 to 3 - 1 inclusively.
print("Sliced array: ", end = "")
print(tmp_arr)
print("Sliced array without typing two integer: ", end = "")
arrCopy = arr[:]
print(arrCopy)
full2d = np.array([[1,2],[3,4],[5,6],[7,8],[9,10]])
print("Not sliced 2D array: ", end = "")
print(full2d)
slice = full2d[:, 0:1] #if : is writing without two integer which show interval. It means take the all part.
print("Sliced array of 2D: ", end = "")
print(slice)


#arr[len(arr)] = 19 #cause error: IndexError: index 4 is out of bounds for axis 0 with size 4
#print(sorted["1"]) print(sorted{1}) both cause error
#print(sorted[18]) #won't print anything
# See PyCharm help at https://www.jetbrains.com/help/pycharm/
