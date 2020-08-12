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

extension TreeAlgorithm {
    /// 输入一颗二叉树的根节点和一个整数，打印出二叉树中结点值的和为输入整数的所有路径。
    /// 路径定义为从树的根结点开始往下一直到叶结点所经过的结点形成一条路径。
    static func findPath(_ tree: TreeNode, target: Int) -> [[Int]] {
        var path: [[Int]] = []
        _visitNode(tree, target: target, path: [], pathSum: 0, allPath: &path)
        
        return path
    }
    
    private static func _visitNode(_ node: TreeNode?, target: Int, path: [Int], pathSum: Int, allPath: inout [[Int]]) {
        guard let node = node else { return }
        
        let nextPath = path + [node.value]
        let sum = pathSum + node.value
        if sum == target, node.left == nil, node.right == nil {
            allPath.append(nextPath)
            return
        }
        
        _visitNode(node.left, target: target, path: nextPath, pathSum: sum, allPath: &allPath)
        _visitNode(node.right, target: target, path: nextPath, pathSum: sum, allPath: &allPath)
    }
}

extension TreeAlgorithm {
    static func depth(of tree: TreeNode?) -> Int {
        guard let _tree = tree else {
            return 0
        }
        
        return max(depth(of: _tree.left), depth(of: _tree.right)) + 1
    }
}


extension TreeAlgorithm {
    /// 从上到下按层打印二叉树，同一层结点从左至右输出。每一层输出一行。
    /// 解法：广度优先遍历每一层，把当前层的值存起来，再加入下一层
    static func printLevels(pRoot: TreeNode?) -> [[Int]] {
        var levels: [[Int]] = [[]]

        if (pRoot == nil) {
            return [[]]
        }

        var stack: [TreeNode] = []
        stack.append(pRoot!)

        while (!stack.isEmpty) {
            var level: [TreeNode] = []
            var levelValues: [Int] = []

            while (!stack.isEmpty) {
                let node = stack.removeFirst()
                level.append(node)
            }

            for node in level {
                if (node.left != nil) {
                    stack.append(node.left!)
                }
                
                if (node.right != nil) {
                    stack.append(node.right!)
                }

                levelValues.append(node.value)
            }

            levels.append(levelValues)
        }

        return levels
    }
}

extension TreeAlgorithm {
    /// 给定一个二叉树和其中的一个结点，请找出中序遍历顺序的下一个结点并且返回。
    /// 注意，树中的结点不仅包含左右子结点，同时包含指向父结点的指针。
    static func nextOfRootFirst(pNode: TreeLinkNode?) -> TreeLinkNode? {
        if pNode == nil {
            return nil
        }
        
        var pNode: TreeLinkNode? = pNode
        
        // 具有右子点，返回右子点的左边路劲的最尾部节点或者该右节点
        if (pNode?.right != nil) {
            pNode = pNode?.right
            while (pNode?.left != nil) {
                pNode = pNode?.left
            }
            return pNode
        }

        // 是父节点的左子点，返回父节点
        if (pNode?.parent != nil && pNode!.parent!.left == pNode!) {
            return pNode?.parent
        }

        // 是父节点的右节点，找到改节点的父节点的父节点...直到节点是其父节点的左节点
        while (pNode?.parent != nil) {
            let parent = pNode!.parent
            if (pNode == parent!.left) {
                return parent
            }

            pNode = pNode?.parent
        }

        return nil
    }
}

extension TreeAlgorithm {
    // 输入一棵二叉树，判断该二叉树是否是平衡二叉树。
    // 在这里，我们只需要考虑其平衡性，不需要考虑其是不是排序二叉树
    public func isTreeBalanced(_ root: TreeNode?) -> Bool {
        if (root == nil) {
            return true
        }

        let leftLevel = _levelOf(root?.left)
        let rightLevel = _levelOf(root?.right)

        if (abs(leftLevel - rightLevel) <= 1) {
            return isTreeBalanced(root?.left) && isTreeBalanced(root?.right)
        } else {
            return false
        }
    }
    
    public func _levelOf(_ root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }

        let rightLevel = _levelOf(root?.right)
        let leftLevel = _levelOf(root?.left)

        return max(rightLevel, leftLevel) + 1
    }
}

extension TreeAlgorithm {
    /*
     输入某二叉树的前序遍历和中序遍历的结果，请重建出该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。
     例如输入前序遍历序列{1,2,4,7,3,5,6,8}和中序遍历序列{4,7,2,1,5,3,8,6}，则重建二叉树并返回。
     解法：先序遍历确定root的位置，中序遍历确定了左右子树的位置，递归生成树
     */
    static func reConstructBinaryTree(preOrders: [Int], inOrders: [Int]) -> TreeNode? {
        if preOrders.count == 0 {
            return nil
        }
        
        let  rootValue = preOrders[0]
        
        if preOrders.count == 1 {
            return TreeNode(value: rootValue)
        }
        
        let root = TreeNode(value: rootValue)
        var rootIndex = 0
        for i in 0..<inOrders.count {
            if rootValue == inOrders[i] {
                rootIndex = i
                break;
            }
        }
        
        root.left = reConstructBinaryTree(preOrders: Array(preOrders[1..<rootIndex+1]), inOrders: Array(inOrders[0..<rootIndex]))
        root.right = reConstructBinaryTree(preOrders: Array(preOrders[rootIndex+1..<preOrders.count]), inOrders: Array(inOrders[rootIndex+1..<inOrders.count]))
        
        return root
    }
}
