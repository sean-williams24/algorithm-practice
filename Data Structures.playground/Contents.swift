import UIKit

// MARK: - Graphs

struct Node {
    
    var value: Int?
    var edges: [Edge]
    
    init(value: Int?) {
        self.value = value
        self.edges = []
    }
}

struct Edge {
    
    var value: Int?
    var nodeFrom: Node?
    var nodeTo: Node?
    
    init(value: Int?, nodeFrom: Node?, nodeTo: Node?) {
        self.value = value
        self.nodeFrom = nodeFrom
        self.nodeTo = nodeTo
    }
}

class Graph {
    
    var nodes: [Node]
    var edges: [Edge]
    
    init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }
    
    // Don't return an array of edge objects!
    // Return an array of arrays where inner arrays look like
    // (Edge Value, From Node Value, To Node Value)
    func getEdgeList() -> [[Int]] {
        var edgeList = [[Int]]()
        
        for edge in edges {
            var innerList: [Int] = []
            innerList.append(edge.value ?? 0)
            innerList.append(edge.nodeFrom?.value ?? 0)
            innerList.append(edge.nodeTo?.value ?? 0)
            edgeList.append(innerList)
        }
        
        return edgeList
    }
    
    // Don't return any Node or Edge objects!
    // You'll return a 3D array
    // The indices of the outer list represent "from" nodes.
    // Each section in the array will store an array of arrays where the inner-most arrays look like
    // (To Node Value, Edge Value)
    // Should be [[], [(2, 100), (3, 101), (4, 102)], [], [(4, 103)], []]
    func getAdjacencyList() -> [[[Int]]] {
        let max = getMaxIndex()
        var adjacencyList = [[[Int]]]()
        
        for a in 0...max {
            var b: [[Int]] = []
            for edge in edges {
                if edge.nodeFrom?.value == a {
                    var c: [Int] = []
                    c.append(edge.nodeTo?.value ?? 99)
                    c.append(edge.value ?? 999)
                    b.append(c)
                }
            }
            adjacencyList.insert(b, at: a)
            
            if !nodes.contains(where: {$0.value == a}) {
                adjacencyList.insert(b, at: a)
            }
        }
        return adjacencyList
    }
    
    // Return a matrix, or 2D array.
    // Row numbers represent from nodes.
    // Column numbers represent to nodes.
    // Store the edge values in each spot, and a 0 if no edge exists.
    // Should be [[0, 0, 0, 0, 0], [0, 0, 100, 101, 102], [0, 0, 0, 0, 0], [0, 0, 0, 0, 103], [0, 0, 0, 0, 0]]
    func getAdjacencyMatrix() -> [[Int]] {
        let max = getMaxIndex()
        var adjacencyMatrix = [[Int]]()

        for a in 0...max {
            var inner = [Int]()

            for b in 0...max {
                inner.append(0)

                for edge in edges {
                    if edge.nodeFrom?.value == a && edge.nodeTo?.value == b {
                        inner.remove(at: b)
                        inner.append(edge.value ?? 0)
                    }
                }
            }
            adjacencyMatrix.append(inner)
        }
        return adjacencyMatrix
    }
    
    // Helper to be used with adjacency list and adjacency matrix
    // max node value determines the size of the array
    func getMaxIndex() -> Int {
        var maxIndex = 0
        
        for node in nodes {
            if node.value! > maxIndex {
                maxIndex = node.value!
            }
        }
        
        return maxIndex
    }
    
    // creates a node with a given value and inserts it into the graph
    func insertNodeWithValue(_ value: Int) {
        let newNode = Node(value: value)
        nodes.append(newNode)
    }
    
    // inserts an edge between the "to" and "from" nodes with the specified values
    func insertEdgeWithValue(_ newEdgeValue: Int, nodeFromValue: Int, nodeToValue: Int) {
        var fromFound: Node? = nil
        var toFound: Node? = nil
        
        for node in nodes {
            if nodeFromValue == node.value {
                fromFound = node
            }
            if nodeToValue == node.value {
                toFound = node
            }
        }
        
        if fromFound == nil {
            fromFound = Node(value: nodeFromValue)
            nodes.append(fromFound!)
        }
        if toFound == nil {
            toFound = Node(value: nodeToValue)
            nodes.append(toFound!)
        }
        
        let newEdge = Edge(value: newEdgeValue, nodeFrom: fromFound, nodeTo: toFound)
        fromFound?.edges.append(newEdge)
        toFound?.edges.append(newEdge)
        edges.append(newEdge)
    }
}

// Test cases
let node = Node(value: 1)
let graph = Graph(nodes: [node], edges: [])
graph.insertEdgeWithValue(100, nodeFromValue: 1, nodeToValue: 2)
graph.insertEdgeWithValue(101, nodeFromValue: 1, nodeToValue: 3)
graph.insertEdgeWithValue(102, nodeFromValue: 1, nodeToValue: 4)
graph.insertEdgeWithValue(103, nodeFromValue: 3, nodeToValue: 4)

print(graph.getEdgeList()) // Should be [(100, 1, 2), (101, 1, 3), (102, 1, 4), (103, 3, 4)]
print(graph.getAdjacencyList()) // Should be [[], [(2, 100), (3, 101), (4, 102)], [], [(4, 103)], []]
print(graph.getAdjacencyMatrix()) // Should be [[0, 0, 0, 0, 0], [0, 0, 100, 101, 102], [0, 0, 0, 0, 0], [0, 0, 0, 0, 103], [0, 0, 0, 0, 0]]





// MARK: - Binary Search Trees

//class Node {
//
//    var value: Int
//    var left: Node?
//    var right: Node?
//
//    init(value: Int) {
//        self.value = value
//    }
//}
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
