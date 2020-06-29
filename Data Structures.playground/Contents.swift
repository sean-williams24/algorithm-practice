import UIKit

//MARK: - Hashing

class HashTable {
    
    var table: [[String]]
    
    init() {
        table = Array(repeating: [], count: 10000)
    }
    
    // use the helper functions to calulate the hash value, per the instructions
    func calculateHashValue(_ input: String) -> Int {
        let first = getFirstCharacterValue(input)
        let second = getSecondCharacterValue(input)
        
        return 100 * first + second
    }
    
    // store the input in the hash table, using the appropriate bucket
    func store(_ input: String) {
        let hashValue = calculateHashValue(input)
        print(hashValue)
        table[hashValue].append(input)
        print(table[hashValue])
    }
    
    // return true if the input string is stored in the hash table, otherwise return false
    func lookup(_ input: String) -> Bool {
        return false
    }
    
    // gets the hash value of the first character
    func getFirstCharacterValue(_ input: String) -> Int {
        if input.count > 0 {
            return Int(input[input.startIndex].unicodeScalars.first!.value)
        }
        return 0
    }
    
    // gets the hash value of the second character
    func getSecondCharacterValue(_ input: String) -> Int {
        if input.count > 1 {
            return Int(input[input.index(after: input.startIndex)].unicodeScalars.first!.value)
        }
        // string does not have a second index
        return 0
    }
}


let hashTable = HashTable()

// these two have the same hash value
let string1 = "UDACITY"
let string2 = "UDACIOUS"
// different hash value
let string3 = "SWIFTASTIC"

hashTable.store(string1)
hashTable.store(string2)
hashTable.store(string3)






var locations = ["North America" : ["USA" : ["Mountain View"]]]

locations["Asia"] = ["India" : ["Bangalore"]]
locations["Africa"] = ["Egypt" : ["Cairo"]]
locations["Asia"]?["China"] = ["Shanghai"]

locations["North America"]?["USA"]?.append("Atlanta")

print(locations)

if let nAmerica = locations["North America"]?["USA"] {
    for city in nAmerica.sorted() {
     print(city)
 }
    
}


for city in locations["North America"]!["USA"]!.sorted() {
    
}

//MARK: - Quick Sort / Recursion

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
