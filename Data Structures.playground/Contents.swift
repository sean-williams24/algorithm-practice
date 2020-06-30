import UIKit


// MARK: - Binary Search Trees

class Node {
    
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}
class BST {
    
    var root: Node
    
    init(value: Int) {
        self.root = Node(value: value)
    }
    
    func search(_ value: Int) -> Bool {
        return searchHelper(root, value: value)
    }
    
    // create a node with the given value and insert it into the binary tree
    func insert(_ value: Int) {
        insertHelper(root, value: value)
    }
    
    // helper method - use to implement a recursive search function
    func searchHelper(_ current: Node?, value: Int) -> Bool {
        if let current = current {
            if current.value == value {
                return true
            } else {
                if current.value > value {
                    // check left
                    return searchHelper(current.left, value: value)
                } else {
                    // check right
                    return searchHelper(current.right, value: value)
                }
            }
        }
        return false
    }
    
    // helper method - use to implement a recursive insert function
    func insertHelper(_ current: Node, value: Int) {
        if current.value > value {
            if let left = current.left {
                insertHelper(left, value: value)
            } else {
                current.left = Node(value: value)
            }
        } else {
            // Go right
            if let right = current.right {
                insertHelper(right, value: value)
            } else {
                current.right = Node(value: value)
            }
        }
    }
    
    func printTree() -> String {
        return String((preorderPrint(root, traverse: "\(root.value)-")?.dropLast(1))!)
    }
    
    func preorderPrint(_ start: Node?, traverse:  String) -> String? {
        var str = traverse
        
        if start?.left != nil {
            str.append("\(start?.left?.value ?? 80)-")
            str = preorderPrint(start?.left, traverse: str)!
            
            if start?.right != nil {
                str.append("\(start?.right?.value ?? 90)-")
                 str = preorderPrint(start?.right, traverse: str)!
            }
        }
        return str
    }
}

// Test cases
// Set up tree
let tree1 = BST(value: 4)

// Insert elements
tree1.insert(2)
tree1.insert(1)
tree1.insert(3)
tree1.insert(5)
print(tree1.printTree())

// Check search
print(tree1.search(4)) // Should be true
print(tree1.search(6)) // Should be false
print(tree1.search(1))
print(tree1.search(2))
print(tree1.search(3))
print(tree1.search(7))




// MARK: - Trees



class BinaryTree {
    
    var root: Node
    
    init(rootValue: Int) {
        self.root = Node(value: rootValue)
    }
    
    // Return true if the value is in the tree, otherwise return false
    func search(_ value: Int) -> Bool {
        return preorderSearch(root, value: value)
    }
    
    // Return a string containing all tree nodes as they are visited in a pre-order traversal.
    func printTree() -> String {
        return String((preorderPrint(root, traverse: "\(root.value)-")?.dropLast(1))!)
    }
    
    
    // Helper method - use to create a recursive search solution.
//    func preorderSearch(_ start: Node?, value: Int) -> Bool {
//        if start?.value == value {
//            return true
//        }
//
//        var result = false
//        if start?.left != nil {
//               result = preorderSearch(start?.left, value: value)
//            }
//
//        if result == false {
//            if start?.right != nil {
//               result = preorderSearch(start?.right, value: value)
//            }
//        }
//
//        return result
//    }
    
    func preorderSearch(_ start: Node?, value: Int) -> Bool {
        if let start = start {
            if start.value == value {
                return true
            } else {
                return preorderSearch(start.left, value: value) || preorderSearch(start.right, value: value)
            }
        }
        return false
    }
    
    
    // Helper method - use to construct a string representing the preordered nodes
    func preorderPrint(_ start: Node?, traverse:  String) -> String? {
        var str = traverse
        
        if start?.left != nil {
            str.append("\(start?.left?.value ?? 80)-")
            str = preorderPrint(start?.left, traverse: str)!
            
            if start?.right != nil {
                str.append("\(start?.right?.value ?? 90)-")
                 str = preorderPrint(start?.right, traverse: str)!
            }
        }
        return str
    }
}

// Test cases
// Set up tree
let tree = BinaryTree(rootValue: 1)
tree.root.left = Node(value: 2)
tree.root.right = Node(value: 3)
tree.root.left?.left = Node(value: 4)
tree.root.left?.right = Node(value: 5)

// Test search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false
print(tree.search(1))
print(tree.search(2))
print(tree.search(3))
print(tree.search(5))

// Test printTree
print(tree.printTree()) // Should be 1-2-4-5-3





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
