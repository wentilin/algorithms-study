//
//  TreeTests.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/17.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class _TreeTests {
    static func testHasSubtree() {
        let root = TreeNode(value: 0)
        let left0 = TreeNode(value: 1)
        let right0 = TreeNode(value: 2)
        let left1 = TreeNode(value: 3)
        let right1 = TreeNode(value: 4)
        let left2 = TreeNode(value: 5)
        let right2 = TreeNode(value: 6)
        root.left = left0
        root.right = right0
        left0.left = left1
        left0.right = right1
        left1.left = left2
        left1.right = right2
        
        let subroot = TreeNode(value: 1)
        let subleft = TreeNode(value: 3)
        subroot.left = subleft
        
        print("has subtree: \(TreeAlgorithm.hasSubTree(root1: root, root2: subroot))")
    }
    
    static func testMirror() {
        let root = _buildTree()
        TreeAlgorithm.mirror(root: root)
        
        print("mirror: \(root)")
    }
    
    static func testBreathVisit() {
        let root = _buildTree()
        let res = TreeAlgorithm.breathVisit(root)
        
        print("breath visit: \(res)")
    }
    
    private static func _buildTree() -> TreeNode {
        let root = TreeNode(value: 0)
        let left0 = TreeNode(value: 1)
        let right0 = TreeNode(value: 2)
        let left1 = TreeNode(value: 3)
        let right1 = TreeNode(value: 4)
        let left2 = TreeNode(value: 2)
        let right2 = TreeNode(value: 2)
        root.left = left0
        root.right = right0
        left0.left = left1
        left0.right = right1
        right0.left = left2
        right0.right = right2
        
        return root
    }
}

extension _TreeTests {
    static func testVerifySquenceOfBST() {
        let sequence: [Int] = [1, 4, 7, 6, 3, 13, 14, 10, 8]
        print("VerifySquenceOfBST(\(sequence)):\(TreeAlgorithm.verifySquenceOfBST(sequence))")
    }
}

extension _TreeTests {
    static func testFindPath() {
        let tree = _buildTree()
        let target = 4
        let path = TreeAlgorithm.findPath(tree, target: target)
        print("findPath with target(\(target)):\(path)")
    }
}

extension _TreeTests {
    static func testDepth() {
        let tree = _buildTree()
        print("Depth of Tree: \(TreeAlgorithm.depth(of: tree))")
    }
}

extension _TreeTests {
    static func testIsSymmetric() {
        print("isSymmetric:\(TreeAlgorithm.isSymmetric(of: _buildSymmetricTree_1()))")
        print("isSymmetricRecursive:\(TreeAlgorithm.isSymmetricRecursive(of: _buildSymmetricTree_1()))")
    }
    
    private static func _buildSymmetricTree() -> TreeNode {
        let root = TreeNode(value: 5)
        
        let left = TreeNode(value: 5)
        let left_left = TreeNode(value: 5)
        let left_left_left = TreeNode(value: 5)
        
        let right = TreeNode(value: 5)
        let right_right = TreeNode(value: 5)
        let right_right_left = TreeNode(value: 5)
        
        
        root.left = left
        root.right = right
        
        left.left = left_left
        left_left.left = left_left_left
        
        right.right = right_right
        right_right.left = right_right_left
        
        return root
    }
    
    private static func _buildSymmetricTree_1() -> TreeNode {
        let root = TreeNode(value: 8)
        
        let left = TreeNode(value: 6)
        let left_left = TreeNode(value: 5)
        let left_left_left = TreeNode(value: 7)
        
        let right = TreeNode(value: 6)
        let right_right = TreeNode(value: 5)
        let right_right_left = TreeNode(value: 7)
        
        
        root.left = left
        root.right = right
        
        left.left = left_left
        left.right = left_left_left
        
        right.right = right_right
        right.left = right_right_left
        
        return root
    }
}

extension _TreeTests {
    static func testConvert() {
        var searchTree: TreeNode? = _buildBinarySearchTree()
//        TreeAlgorithm.convertBinarySearchTreeToDoubleLinkedList(pRootOfTree: &searchTree)
        
        searchTree = TreeAlgorithm.convertBinarySearchTreeToDoubleLinkedListRecursive(pRootOfTree: searchTree)
        
        var node: TreeNode? = searchTree
        var resRight: String = "\(node!.value)"
        while node?.right != nil {
            resRight += "->\(node!.right!.value)"
            node = node?.right
        }
        
        var resLeft: String = "\(node!.value)"
        while node?.left != nil {
            resLeft += "<-\(node!.left!.value)"
            node = node?.left
        }
        
        print(resRight)
        print(resLeft)
    }
    
    private static func _buildBinarySearchTree() -> TreeNode {
        let root = TreeNode(value: 8)
        
        let left0 = TreeNode(value: 3)
        let left1 = TreeNode(value: 1)
        let right1 = TreeNode(value: 6)
        let left1_1 = TreeNode(value: 4)
        let right1_1 = TreeNode(value: 7)
        
        let right0 = TreeNode(value: 10)
        let right2 = TreeNode(value: 14)
        let left2 = TreeNode(value: 13)
        
        
        root.left = left0
        root.right = right0
        left0.left = left1
        left0.right = right1
        right1.left = left1_1
        right1.right = right1_1
        
        right0.right = right2
        right2.left = left2
        
        return root
    }
}

extension _TreeTests {
    static func testSerialize() {
        let serializeData = TreeAlgorithm.serialize(root: _buildSymmetricTree())
        print(serializeData)
        print(TreeAlgorithm.deserialize(data: serializeData))
    }
}

extension _TreeTests {
    static func testKthNodeOfBinarySearchTree() {
        print(TreeAlgorithm.kthNodeOf(binarySearchTree: _buildBinarySearchTree(), k: 3)?.value)
    }
}


extension _TreeTests {
    static func testPrintZStyle() {
        let node1 = TreeNode(value: 8)
        let node2 = TreeNode(value: 6)
        let node3 = TreeNode(value: 10)
        let node4 = TreeNode(value: 5)
        let node5 = TreeNode(value: 7)
        let node6 = TreeNode(value: 9)
        let node7 = TreeNode(value: 11)

        node1.left = node2
        node1.right = node3

        node2.left = node4
        node2.right = node5

        node3.left = node6
        node3.right = node7
        print(TreeAlgorithm.printZStyle(root: node1))
    }
}

extension _TreeTests {
    static func testTrieTree() {
        let trie = Trie()
        trie.insert("abcd")
        trie.insert("afdc")
        trie.insert("abef")
        
        print("find trie: \(trie.find("afdc"))")
    }
}


extension _TreeTests {
    static func testAVLTree() {
        let tree = AVLTree<Int, String>()

        tree.insert(key: 5, payload: "five")
        print(tree)

        tree.insert(key: 4, payload: "four")
        print(tree)

        tree.insert(key: 3, payload: "three")
        print(tree)

        tree.insert(key: 2, payload: "two")
        print(tree)

        tree.insert(key: 1, payload: "one")
        print(tree)
        print(tree.debugDescription)
    }
}
