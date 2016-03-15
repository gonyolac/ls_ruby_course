 Local Variables 

1. 

 Outer scope variables (like `str` at Line 1) is accessible and mutable from within a block.


2. 

The code raises an exception as `str` has not been initialized as either a local variable or method. 

3.Not necessarily, because `str` could have been initialized in the omitted lines of code.
 If it has indeed been initialized, then the code will run. Otherwise, the code will raise an exception.

4. Local variables are inaccessible to methods unless passed as an argument. 

5. Since the local variable `str` at Line 1 has been initialized outside the method, it is not accessible to a_method
 unless it is passed as an argument. Also, `str` at Line 4 is a local variable initialized within a_method, thus likewise
 inacessible from the outer scope.

6. `b` remains to be "hello" because b has been initialized to point to `"hello"` at Line 2.
 even though a has been mutated into `'hi world'` from Lines 3 (reassignment to `"hi"`) and 4 (`"world"` is destructively concatenated into "hi").

7. 

a = "hello"
b = "world"

 There are 4 variables from the initializations at Lines 1, 2, 4, and 5. There remains 2 objects, "hello" and "world",
 which were initialized at Lines 1 and 2. Lines 4 to 7 are simply reassingments of the variables to what object
 each one 'points' to. (Variables a, b and c point to "hello" while Variable d points to "world")

Mutating Method Arguments

1. It shows that the + method is not destructive, instead returning a new string object. 

2. In contrast to #1, the << method mutates the object, thus it is a destructive method,
 as evidenced by greeting returning as "hello world"

3. 

 Line 2 is variable initialization. The argument 'param' for the change method is rendered irrelevant.
 This means that no matter what is passed as an argument, it is 'param' inside the method that is being modified and not the argument being passed. 

4. Line 2 is variable reassingment. It is the reassigned variable 'param' that is being modified and not the local variable 'greeting', similar to
 what went on in question #3

 Working with collections

1. Array#map performs a specified block of code through each element in the array, then stores each return value into a new array. 

2. Array#select performs a specific block of code through each element in the array, then stores the array element into a new array if the block returns 'true' for that same element.

3. Enumerable#reduce performs the block of code with an initial aggregate 
 (usually the first element of a collection when not specified) and a succeeding collection element.
 The resulting value would then become the new initial aggregate, and the block continues to execute 
 until it has done so up to the end of the collection. The final return value would then be the aggregate upon the final block execution.

4. At Line 3, `n += 1` is actually `n = n + 1`. It is reassigning the variable n to be the sum of itself and the increment of 1.
 On the other hand `n + 1` is just a regular operation performed on each array element, represented by n. While both are valid, I think
 'n + 1' is preferrable because the intended result is clearer.  

5. Array#map simply runs a block of code through each array element and stores each return value into a new array. Array#select, on the other hand, 
 stores the original array element which satisfies the block of code, or for which it return 'true'. When the code above is run, the return values (in this case booleans) are stored into the array, by Array#map.

6. arr contains nil as its array elements because 'puts n' has been added inside the block.
 Array#map stores the final return value of a block into a new array, so when puts n is executed,
 the array element is printed out, its return value, nil, is stored into the return array.

7. Array#select returns a new array containing array elements for which a block of code returns 'true'.
 In this instance, arr returns `[1, 2, 3]` since `n + 2` in the block returns a valid value for each array element,
 with Array#select rendering each element as 'true'. 


8. Since puts n was added to the end of the block, arr returns an empty array. As Array#select runs the block through each array element,
 their resulting return values end up as 'nil', whose 'truthiness' is classified as 'false'. The array elements are therefore did not pass the 'test',
 which was to return as 'true' ,and were thus filtered out.
