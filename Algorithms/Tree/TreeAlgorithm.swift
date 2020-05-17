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
