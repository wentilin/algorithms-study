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
