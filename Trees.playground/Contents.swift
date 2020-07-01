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



