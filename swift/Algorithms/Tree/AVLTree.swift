//
//  AVLTree.swift
//  Algorithms
//
//  Created by linwenhu on 2020/11/9.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class AVLNode<Key: Comparable, Payload> {
    typealias Node = AVLNode<Key, Payload>
    
    var payload: Payload?
    fileprivate var key: Key
    
    weak var parent: Node?
    var leftChild: Node?
    var rightChild: Node?
    
    fileprivate var height: Int
    
    init(key: Key, payload: Payload?, leftChild: Node?, rightChild: Node?, parent: Node?, height: Int) {
        self.key = key
        self.payload = payload
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
        self.height = height
        
        self.leftChild?.parent = self
        self.rightChild?.parent = self
    }
    
    convenience init(key: Key, payload: Payload?) {
        self.init(key: key, payload: payload, leftChild: nil, rightChild: nil, parent: nil, height: 1)
    }
    
    convenience init(key: Key) {
        self.init(key: key, payload: nil)
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return leftChild == nil && rightChild == nil
    }
    
    var isLeft: Bool {
        return parent?.leftChild === self
    }
    
    var isRight: Bool {
        return parent?.rightChild === self
    }
    
    var hasLeft: Bool {
        return leftChild != nil
    }
    
    var hasRight: Bool {
        return rightChild != nil
    }
    
    var hasBothChild: Bool {
        return leftChild != nil && rightChild != nil
    }
}

extension AVLNode: Equatable {
    static func == (lhs: AVLNode<Key, Payload>, rhs: AVLNode<Key, Payload>) -> Bool {
        return lhs.key == rhs.key
    }
}

class AVLTree<Key: Comparable, Payload> {
    typealias Node = AVLNode<Key, Payload>
    
    fileprivate(set) var root: Node?
    fileprivate(set) var size = 0
    
    init() { }
}

// MARK: Insert
extension AVLTree {
    func insert(key: Key, payload: Payload? = nil) {
        if let root = root {
            insert(key: key, payload: payload, node: root)
        } else {
            root = Node(key: key, payload: payload);
        }
        
        size += 1
    }
    
    private func insert(key: Key, payload: Payload?, node: Node) {
        if key < node.key {
            if let child = node.leftChild {
                insert(key: key, payload: payload, node: child)
            } else {
                let child = Node(key: key, payload: payload, leftChild: nil, rightChild: nil, parent: node, height: 1)
                node.leftChild = child
                balance(node: child)
            }
        } else if key != node.key {
            if let child = node.rightChild {
                insert(key: key, payload: payload, node: child)
            } else {
                let child = Node(key: key, payload: payload, leftChild: nil, rightChild: nil, parent: node, height: 1)
                node.rightChild = child
                balance(node: child)
            }
        }
    }
}

// MARK: Balance
extension AVLTree {
    fileprivate func balance(node: Node?) {
        guard let node = node else {
            return
        }
        
        updateHeightUpwards(node: node.leftChild)
        updateHeightUpwards(node: node.rightChild)
        
        let lrFactor = lrDifference(node: node)
        var rotateRes: Node? = node
        if lrFactor > 1 {
            if lrDifference(node: node.leftChild) > 0 { // LL
                rotateRes = llRotate(node: node)
            } else { // LR
                rotateRes = lrRotate(node: node)
            }
        } else if lrFactor < -1 {
            if lrDifference(node: node.rightChild) < 0 { // RR
                rotateRes = rrRotate(node: node)
            } else { // RL
                rotateRes = rlRotate(node: node)
            }
        }
        
        if let node = rotateRes, node.isRoot {
            root = node
        }
        
        balance(node: rotateRes?.parent)
    }
    
    /**
     RR型：左旋
                7                           11
               /    \                        /    \
              3      11     ==>       7      16
                 /    \                /    \       \
                9      16           3      9      26
                     \
                     26
     */
    @discardableResult
    fileprivate func rrRotate(node: Node) -> Node? {
        let parent: Node? = node.parent

        let rChild: Node? = node.rightChild
        let rlChild: Node? = rChild?.leftChild
        rlChild?.parent = node
        node.rightChild = rlChild
        rChild?.parent = parent
        rChild?.leftChild = node
        node.parent = rChild
        
        if let parent = parent {
            if parent.rightChild === node {
                parent.rightChild = rChild
            } else {
                parent.leftChild = rChild
            }
        }
        
        updateHeightUpwards(node: node)
        
        return rChild
    }
    
    /**
     LL型：右旋
                7                          7
               /    \                      /    \
              3      16     ==>     3       11
                 /                            /   \
                11                          9     16
                /
               9
     */
    @discardableResult
    fileprivate func llRotate(node: Node) -> Node? {
        let parent: Node? = node.parent

        let lChild: Node? = node.leftChild
        let lrChild: Node? = lChild?.rightChild
        lrChild?.parent = node
        node.leftChild = lrChild
        lChild?.parent = parent
        lChild?.rightChild = node
        node.parent = lChild
        
        if let parent = parent {
            if parent.rightChild === node {
                parent.rightChild = lChild
            } else {
                parent.leftChild = lChild
            }
        }
        
        updateHeightUpwards(node: node)
        
        return lChild
    }
    
    /**
     RL型：右旋再左旋
     */
    @discardableResult
    fileprivate func rlRotate(node: Node) -> Node? {
        if let rChild = node.rightChild {
            llRotate(node: rChild)
        }
        return rrRotate(node: node)
    }
    
    /**
     LR型：左旋再右旋
     */
    @discardableResult
    fileprivate func lrRotate(node: Node) -> Node? {
        if let lChild = node.leftChild {
            rrRotate(node: lChild)
        }
        
        return llRotate(node: node)
    }
    
    fileprivate func updateHeightUpwards(node: Node?) {
        if let node = node {
            let lHeight = node.leftChild?.height ?? 0
            let rHeight = node.rightChild?.height ?? 0
            node.height = max(lHeight, rHeight) + 1
            updateHeightUpwards(node: node.parent)
        }
    }
    
    fileprivate func lrDifference(node: Node?) -> Int {
        let lHeight = node?.leftChild?.height ?? 0
        let rHeight = node?.rightChild?.height ?? 0
        
        return lHeight - rHeight
    }
}

// MARK: Search
extension AVLTree {
    subscript(key: Key) -> Payload? {
        get { return search(key: key) }
        set { insert(key: key, payload: newValue) }
    }
    
    func search(key: Key) -> Payload? {
        return search(key: key, node: root)?.payload
    }
    
    private func search(key: Key, node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        
        if key == node.key {
            return node
        } else if key < node.key {
            return search(key: key, node: node.leftChild)
        } else {
            return search(key: key, node: node.rightChild)
        }
    }
}

extension AVLNode {
  public func minimum() -> AVLNode? {
    return leftChild?.minimum() ?? self
  }

  public func maximum() -> AVLNode? {
    return rightChild?.maximum() ?? self
  }
}

// MARK: Delete
extension AVLTree {
    func delete(key: Key) {
        if size == 1 {
            root = nil
            size -= 1
        } else if let node = search(key: key, node: root) {
            delete(node: node)
            size -= 1
        }
    }
    
    private func delete(node: Node) {
        if node.isLeaf {
            if let parent = node.parent {
                guard node.isLeft || node.isRight else {
                    fatalError("Invalid node")
                }
                
                if node.isLeft {
                    parent.leftChild = nil
                } else if node.isRight {
                    parent.rightChild = nil
                }
                
                balance(node: parent)
            }
        } else {
            if let replacement = node.leftChild?.maximum(), replacement !== node {
                node.key = replacement.key
                node.payload = replacement.payload
                delete(node: replacement)
            } else if let replacement = node.rightChild?.minimum(), replacement !== node {
                node.key = replacement.key
                node.payload = replacement.payload
                delete(node: replacement)
            }
        }
    }
}

extension AVLNode: CustomDebugStringConvertible {
  public var debugDescription: String {
    var s = "key: \(key), payload: \(String(describing: payload ?? nil)), height: \(height)"
    if let parent = parent {
      s += ", parent: \(parent.key)"
    }
    if let left = leftChild {
      s += ", left = [" + left.debugDescription + "]"
    }
    if let right = rightChild {
      s += ", right = [" + right.debugDescription + "]"
    }
    return s
  }
}

extension AVLTree: CustomDebugStringConvertible {
  public var debugDescription: String {
    return root?.debugDescription ?? "[]"
  }
}

extension AVLNode: CustomStringConvertible {
  public var description: String {
    var s = ""
    if let left = leftChild {
      s += "(\(left.description)) <- "
    }
    s += "\(key)"
    if let right = rightChild {
      s += " -> (\(right.description))"
    }
    return s
  }
}

extension AVLTree: CustomStringConvertible {
  public var description: String {
    return root?.description ?? "[]"
  }
}
