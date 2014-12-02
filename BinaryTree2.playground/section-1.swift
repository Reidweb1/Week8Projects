// Playground - noun: a place where people can play

import UIKit

class BinaryTree {
    var value : Int? = nil
    var leftTree : BinaryTree? = nil
    var rightTree : BinaryTree? = nil
    
    convenience init(value: Int) {
        self.init()
        self.value = value
    }
    
    func insert (newValue: Int) {
        if self.value == nil {
            self.value = newValue
        } else {
            if newValue > self.value {
                if self.rightTree == nil {
                    self.rightTree = BinaryTree(value: newValue)
                } else {
                    self.rightTree?.insert(newValue)
                }
            } else if newValue < self.value {
                if self.leftTree == nil {
                    self.leftTree = BinaryTree(value: newValue)
                } else {
                    self.leftTree?.insert(newValue)
                }
            } else {
                println("Duplicate Value Recieved")
            }
        }
    }
    
    func find (value: Int) -> BinaryTree? {
        if value == self.value {
            return self
        } else {
            if value > self.value && self.rightTree != nil {
                return self.rightTree?.find(value)
            } else if value < self.value && self.leftTree != nil {
                return self.leftTree?.find(value)
            } else {
                return nil
            }
        }
    }
    
    func remove (value: Int) {
        if value == self.value {
            if self.rightTree == nil && self.leftTree == nil {
                self.value = nil
            } else if self.rightTree != nil && self.leftTree == nil {
                self.value = self.rightTree?.value
                self.rightTree = self.rightTree?.rightTree
            } else {
                self.value = self.leftTree?.value
                self.leftTree = self.leftTree?.leftTree
            }
        } else {
            if value > self.value {
                self.rightTree?.remove(value)
            } else {
                self.leftTree?.remove(value)
            }
        }
    }
    
    class func count(tree: BinaryTree) -> Int {
        var index: Int = 1
        if let rightSide = tree.rightTree {
            index += BinaryTree.count(rightSide)
        }
        if let leftSide = tree.leftTree {
            index += BinaryTree.count(leftSide)
        }
        return index
    }
    
}

var newTree = BinaryTree()
newTree.insert(3)
newTree.insert(5)
newTree.insert(2)
newTree.insert(1)
newTree.insert(6)

newTree.remove(2)

var count = BinaryTree.count(newTree)

