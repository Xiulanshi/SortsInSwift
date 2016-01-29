//: Playground - noun: a place where people can play

import UIKit

//BIG O NOTATION
/*
// Making Comparison
// Searching values in a sorted array

//array of sorted integers
let numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//let numberList : Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// LINEAR TIME - Our first approach employs a common “brute force” technique that involves looping through the entire array until we find a match.
// While this approach achieves our goal, each item in the array must be evaluated. A function like this is said to run in “linear time” because its speed is dependent on its input size. In other words, the algorithm becomes less efficient as its input size (n) grows. O(n)

// LINEAR SEARCH - Linear search is the simplest search algorithm; it is a special case of brute-force search. Its worst case cost is proportional to the number of elements in the list. Its expected cost is also proportional to the number of elements if all elements are searched equally.

func linearSearch(key: Int) {
    
    //check all possible values
    for number in numberList {
        if number == key {
            print("value at \(key) found.")
            break
        }
    }
}

linearSearch(8)

// LOGARITHMIC TIME - Our next approach uses a technique called binary search. With this method, we apply our knowl- edge about the data to help reduce our search criteria.
// This type of search is said to work in logarithmic time and is represented with the symbol O(log n). Overall, its complexity is minimized when the size of its inputs (n) grows.
//BINARY SEARCH ----In computer science, a binary search or half-interval search algorithm finds the position of a target value within a sorted array.[1][2] The binary search algorithm can be classified as a dichotomic divide-and-conquer search algorithm and executes in logarithmic time.
/*
Class:	Search algorithm
Data structure:	Array
Worst case performance:	O(log n)
Best case performance:	O(1)
Average case performance:	O(log n)
Worst case space complexity: O(1)
*/

func binarySearch(key: Int, imin: Int, imax: Int) {
    
    var midIndex : Double = round(Double((imin + imax) / 2))
    var midNumber = numberList[Int(midIndex)]
    
    //reduce the range
    if midNumber > key {
        binarySearch(key, imin: imin, imax: Int(midIndex) - 1)
    }
    
    //increase the range
    else if (midNumber < key) {
        binarySearch(key, imin: Int(midIndex) + 1, imax: imax)
    }
    else {
        print("value \(key) found..")
    }
}

binarySeach(6, imin: 1, imax: 10)
*/

// SORTING - Sorting is an essential task when managing data. As we saw with Big O Notation, sorted data allows us to implement efficient algorithms. Our goal with sorting is to move from disarray to or- der. This is done by arranging data in a logical sequence so we’ll know where to find information. Sequences can be easily implemented with integers, but can also be achieved with characters (e.g., alphabets), and other sets like binary and hexadecimal numbers.

//a simple array of unsorted integers
   var numberList = [8, 2, 10, 9, 11, 1, 7, 3, 4]
// var numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 7, 3, 4]

// INSERTION SORT ---One of the more basic algorithms in computer science, insertion sort works by evaluating a constant set of numbers with a secondary set of changing numbers. The outer loop acts as the invariant, assuring all array values are checked. The inner loop acts as a secondary engine, reviewing which numbers get compared. Completed enough times, this process eventually sorts all items in the list.  O(n^2)

/*

Insertion sort is a simple sorting algorithm that builds the final sorted array (or list) one item at a time. It is much less efficient on large lists than more advanced algorithms such as quicksort, heapsort, or merge sort. Advantages: 
Simple implemetation, 
Efficient for small data sets, 
More efficient than other quadratic (O(n^2) i.e. Selection sort or Bubble sort, 
Adaptive, 
Stable, ie does not change the relative order of element with equal keys.
In-place i.e. only requires a constant amount O(1) of additional memory space, 
Online i.e. can sort a list as it receives it.

Class:	Sorting algorithm
Data structure:	Array
Worst case performance:	О(n^2) comparisons, swaps
Best case performance:	O(n) comparisons, O(1) swaps
Average case performance:	О(n^2) comparisons, swaps
Worst case space complexity:	О(n) total, O(1) auxiliary
*/

//Method 0 -
//Insertion sort - rank items by comparing each key in the list

func insertionSort() {
    var x, y, key: Int
    for (x = 0; x < numberList.count; x++) {
        key = numberList[x]
        for (y = x; y > -1; y--) {
            if (key < numberList[y]) {
                numberList.removeAtIndex(y + 1)
                numberList.insert(key, atIndex: y)
            }
        }
    }
}


//Method 1
func insertionSort1(var numberList: [Int]) -> [Int] {
    var y,  key : Int
    
    for x in 0..<numberList.count {
        
        //obtain a key to be evaluated
        key = numberList[x]
        
        //iterate backwards through the sorted protion
        for (y = x; y > -1; y--) {
            
            if (key < numberList[y]) {
                
                // remove item from original position
                numberList.removeAtIndex(y + 1)
                
                //insert the number at the key position
                numberList.insert(key, atIndex: y)
            }
        }
    } // end for

    return numberList
} // end function

insertionSort1(numberList)


//Method 2 ---Insertion

func insert(x: Int, var intoSortedList xs: [Int]) -> [Int] {
    var didInsertX = false
    for i in 0..<xs.count {
        if (x < xs[i]) {
            xs.insert(x, atIndex: i)
            didInsertX = true
            break
        }
    }
    if !didInsertX {
        xs.append(x)
    }
    return xs
}

insert(3, intoSortedList: [1, 2, 4, 5])

func insertion_sort(xs: [Int]) -> [Int] {
    var sortedSoFar = [Int]()
    for x in xs {
        sortedSoFar = insert(x, intoSortedList: sortedSoFar)
    }
    return sortedSoFar
}

insertion_sort(numberList)

// BUBBLE SORT ----- Another common sorting technique is the bubble sort. Like insertion sort, this algorithm combines a series of steps with an invariant. The function works by evaluating pairs of values. Once compared, the position of the largest value is swapped with the smaller value. Completed enough times, this “bubbling” effect eventually sorts all items in the list. O(n^2)
/*
Bubble sort, sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps through the list to be sorted, compares each pair of adjacent items and swaps them if they are in the wrong order. The pass through the list is repeated until no swaps are needed, which indicates that the list is sorted. The algorithm, which is a comparison sort, is named for the way smaller elements "bubble" to the top of the list. Although the algorithm is simple, it is too slow and impractical for most problems even when compared to insertion sort.

Class:	Sorting algorithm
Data structure:	Array
Worst case performance:	O(n^2)
Best case performance:	O(n)
Average case performance:	O(n^2)
Worst case space complexity:	O(1) auxiliary
*/
func bubbleSort(var numberList: [Int]) -> [Int] {
    
    var z, passes, key: Int
    
    //track collection iterations
    for x in 0..<numberList.count {
        
        passes = (numberList.count - 1) - x
        
        //use shorthand "half-open" range operator
        for y in 0..<passes {
            key = numberList[y]
            
            //compare and rank values
            if (key > numberList[y + 1]) {
                z = numberList[y + 1]
                numberList[y + 1] = key
                numberList[y] = z
            }
        }
    }
    return numberList
} //end function

bubbleSort(numberList)

// BINARY NUMBER ---- In mathematics and digital electronics, a binary number is a number expressed in the binary numeral system or base-2 numeral system which represents numeric values using two different symbols: typically 0 (zero) and 1 (one).

// HEXADECIMAL -- In mathematics and computing, hexadecimal (also base 16, or hex) is a positional numeral system with a radix, or base, of 16. It uses sixteen distinct symbols, most often the symbols 0–9 to represent values zero to nine, and A, B, C, D, E, F (or alternatively a, b, c, d, e, f) to represent values ten to fifteen. 

// INVARIANT --- In computer science, an invariant is a condition that can be relied upon to be true during execution of a program, or during some portion of it. It is a logical assertion that is held to always be true during a certain phase of execution. For example, a loop invariant is a condition that is true at the beginning and end of every execution of a loop.

// MERGE SORT ---- In computer science, merge sort (also commonly spelled mergesort) is an efficient, general-purpose, comparison-based sorting algorithm. Most implementations produce a stable sort, which means that the implementation preserves the input order of equal elements in the sorted output. Mergesort is a divide and conquer algorithm. 

/*  An example of merge sort. First divide the list into the smallest unit (1 element), then compare each element with the adjacent list to sort and merge the two adjacent lists. Finally all the elements are sorted and merged.
Class: Sorting algorithm; 
Data structure:Array
Worst case performance:	O(n log n)
Best case performance: O(n log n) typical, O(n) natural variant
Average case performance: O(n log n)
Worst case space complexity: О(n) total, O(n) auxiliary
*/

func mergeSort(values: [Int]) -> [Int] {
    let n = values.count
    // Check length of values, return values if count is less than 2
    if n < 2{
        return values
    }
    // Split values into left and right (roughly equal size)
    
    var left = Array(values[0..<n / 2])
    var right = Array(values[n / 2..<n])
    
    // Sort the left half
    left = mergeSort(left)
    
    // Sort the right half
    right = mergeSort(right)
    
    // Merge the two halves together
    // Return the result
    
    return merge(withLeftArray: left, andRightArray: right)
}
func merge(withLeftArray left: [Int], andRightArray right: [Int]) -> [Int] {
    // Iterate over both left and right at the same time
    var i = 0
    var j = 0
    var result: [Int] = []
    while i < left.count || j < right.count {
        
        if j >= right.count {
            result.append(left[i])
            i++
            continue
        }
        else if i >= left.count {
            result.append(right[j])
            j++
            continue
        }
        
        if left[i] <= right[j] {
            result.append(left[i])
            i++
        }else{
            result.append(right[j])
            j++
        }
        
    }
    // Take the minimum of the two and add it to the result
    
    return result // <-- change this
}
mergeSort([10, 2, 6, 5, 7])
merge(withLeftArray: [3, 6], andRightArray: [1, 2])
mergeSort(numberList)


/* 
//QUICKSORT---- Quicksort (sometimes called partition-exchange sort) is an efficient sorting algorithm, serving as a systematic method for placing the elements of an array in order. Developed by Tony Hoare in 1959,[1] with his work published in 1961,[2] it is still a commonly used algorithm for sorting. When implemented well, it can be about two or three times faster than its main competitors, merge sort and heapsort.[3]

Quicksort is a comparison sort, meaning that it can sort items of any type for which a "less-than" relation (formally, a total order) is defined. In efficient implementations it is not a stable sort, meaning that the relative order of equal sort items is not preserved. Quicksort can operate in-place on an array, requiring small additional amounts of memory to perform the sorting.

Class:	Sorting algorithm
Worst case performance:	O(n2)
Best case performance:	O(n log n) (simple partition), or O(n) (three-way partition and equal keys)
Average case performance:	O(n log n)
Worst case space complexity:	O(n) auxiliary (naive), O(log n) auxiliary (Sedgewick 1978)
*/

/*
//SELECTION SORT ----In computer science, selection sort is a sorting algorithm, specifically an in-place comparison sort. It has O(n2) time complexity, making it inefficient on large lists, and generally performs worse than the similar insertion sort. Selection sort is noted for its simplicity, and it has performance advantages over more complicated algorithms in certain situations, particularly where auxiliary memory is limited.

The algorithm divides the input list into two parts: the sublist of items already sorted, which is built up from left to right at the front (left) of the list, and the sublist of items remaining to be sorted that occupy the rest of the list. Initially, the sorted sublist is empty and the unsorted sublist is the entire input list. The algorithm proceeds by finding the smallest (or largest, depending on sorting order) element in the unsorted sublist, exchanging (swapping) it with the leftmost unsorted element (putting it in sorted order), and moving the sublist boundaries one element to the right.

Class:	Sorting algorithm
Data structure:	Array
Worst case performance:	О(n^2)
Best case performance:	О(n^2)
Average case performance:	О(n^2)
Worst case space complexity: О(n) total, O(1) auxiliary
*/

func select(xs: [Int], startingAt k: Int) -> Int {
    var minIndex = k
    for i in (k+1)..<xs.count {
        if xs[i] < xs[minIndex] {
            // we found a new minimum
            minIndex = i
        }
    }
    return minIndex
}

select([0, 1, 2, 3, 9, 5, 4, 6], startingAt: 4)
select([8, 6, 7, 5, 3, 0, 9], startingAt: 0)

func selection_sort(inout xs: [Int]) -> [Int] {
    for sortedSoFar in 0..<xs.count {
        let minIndex = select(xs, startingAt: sortedSoFar)
        (xs[sortedSoFar], xs[minIndex]) = (xs[minIndex], xs[sortedSoFar])
    }
    return xs
}

var xs = [8, 6, 7, 5, 3, 0, 9]
selection_sort(&xs)

