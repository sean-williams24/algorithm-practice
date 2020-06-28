import UIKit


func quicksort(_ input: inout [Int], low: Int, high: Int) -> [Int] {
//    let last = input.count - 1
    // check the base case: low is less than high
    if low == high {
        return input
    }
    // select the pivot
    let pivot = input[high]
    
    // perform the partitioning step
    if pivot < input[low] {
        let highMover = input.remove(at: high - 1)
        let lowMover = input.remove(at: low)
        input.append(lowMover)
        input.insert(highMover, at: low)
        quicksort(&input, low: low, high: high - 1)

    } else {
        quicksort(&input, low: low + 1, high: high)
    }
    
    
    // make the recursive call with the new high and low values
    quicksort(&input, low: low, high: high - 1)

    return input
}

// Test case
var testArray = [21, 4, 1, 3, 9, 20, 25, 6, 21, 14]
print(quicksort(&testArray, low: 0, high: testArray.count - 1))



//func getFib(_ position: Int) -> Int {
//
//    if position == 0 || position == 1 {
//        return position
//    }
//
//    var first = 0
//    var second = 1
//    var fib = 1
//
//    for _ in 2...position {
//        fib = first + second
//        first = second
//        second = fib
//    }
//    return fib
//}


func getFib(_ position: Int) -> Int {

    if position == 0 || position == 1 {
        return position
    }
    let output = getFib(position - 1) + getFib(position - 2)
    print(output)
    return output
}


print(getFib(9))
