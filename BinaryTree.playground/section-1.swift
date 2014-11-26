
import Foundation

class Node<T: Comparable> {
    var value: T
    var leftNode: Node?
    var rightNode: Node?
    
    init (value: T) {
        self.value = value
    }
}

class Tree <T: Comparable> {
    var head : Node<T>?
    init() {
        self.head = nil
    }
    
    func insert (value: T) {
        if self.head == nil {
            self.head = Node(value: value)
        } else {
            self.traverseAndInsert(value, node: self.head!)
        }
    }
    
    func traverseAndInsert (value: T, node: Node<T>) {
        if value > node.value {
            if node.rightNode == nil {
                node.rightNode = Node(value: value)
            } else {
                self.traverseAndInsert(value, node: node.rightNode!)
            }
        } else {
            if node.leftNode == nil {
                node.leftNode = Node(value: value)
            } else {
                self.traverseAndInsert(value, node: node.leftNode!)
            }
        }
    }
}
