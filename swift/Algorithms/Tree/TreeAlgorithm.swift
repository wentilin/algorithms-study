//
//  TreeAlgorithm.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/17.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class TreeAlgorithm {
    static func hasSubTree(root1: TreeNode?, root2: TreeNode?) -> Bool {
        if root1 == nil || root2 == nil {
            return false
        }
        
        return isSubTree(root1: root1, root2: root2) ||
            hasSubTree(root1: root1?.left, root2: root2) ||
            hasSubTree(root1: root1?.right, root2: root2)
    }
    
    private static func isSubTree(root1: TreeNode?, root2: TreeNode?) -> Bool {
        if root2 == nil {
            return true
        }
        
        if root1 == nil {
            return false
        }
        
        if root1!.value == root2!.value {
            return isSubTree(root1: root1?.left, root2: root2?.left) && isSubTree(root1: root1?.right, root2: root2?.right)
        } else {
            return false
        }
    }
}

extension TreeAlgorithm {
    static func mirror(root: TreeNode?) {
        if root == nil || (root?.left == nil && root?.right == nil) {
            return
        }
        
        let tmp = root?.left
        root?.left = root?.right
        root?.right = tmp
        
        mirror(root: root?.left)
        mirror(root: root?.right)
    }
}

extension TreeAlgorithm {
    static func breathVisit(_ tree: TreeNode?) -> [Int] {
        guard let t = tree else { return [] }
        
        var queue: Queue<TreeNode> = .init()
        var res: [Int] = []
        queue.push(t)
        while !queue.isEmpty {
            let node = queue.pop()!
            res.append(node.value)
            
            if let left = node.left {
                queue.push(left)
            }
            
            if let right = node.right {
                queue.push(right)
            }
        }
        
        return res
    }
}

extension TreeAlgorithm {
    /// 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历的结果。
    /// 如果是则输出Yes,否则输出No。
    /// 假设输入的数组的任意两个数字都互不相同。
    static func verifySquenceOfBST(_ sequence: [Int]) -> Bool {
        guard sequence.count > 0 else { return false }
        
        return _judegeSequenceOfBST(sequence, left: 0, right: sequence.count-1)
    }
    
    static func _judegeSequenceOfBST(_ sequence: [Int], left: Int, right: Int) -> Bool {
        if left >= right {
            return true
        }
        
        let last = sequence[right]
        var i = left
        while sequence[i] < last {
            i += 1
        }
        
        // Must less than right tree
        for j in i..<right {
            if last >= sequence[j] {
                return false
            }
        }
        
        return _judegeSequenceOfBST(sequence, left: left, right: i-1) && _judegeSequenceOfBST(sequence, left: i, right: right - 1)
    }
}
