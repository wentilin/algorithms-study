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

extension TreeAlgorithm {
    /**
     题目：对称的二叉树
     描述：请实现一个函数，用来判断一棵二叉树是不是对称的。注意，如果一个二叉树同此二叉树的镜像是同样的，定义其为对称的。
     解法：分别同步层次遍历左右子树，左子树左到右，右子树右到左，一一比较
     */
    static func isSymmetric(of pRoot: TreeNode?) -> Bool {
        var leftNodes: [TreeNode] = []
        var rightNodes: [TreeNode] = []
        
        if pRoot?.left != nil {
            leftNodes.append(pRoot!.left!)
        }
        
        if pRoot?.right != nil {
            rightNodes.append(pRoot!.right!)
        }
        
        while !leftNodes.isEmpty && leftNodes.count == rightNodes.count {
            var leftLevels: [TreeNode] = []
            var rightLevels: [TreeNode] = []
            
            while !leftNodes.isEmpty {
                let leftNode = leftNodes.removeLast()
                let rightNode = rightNodes.removeLast()
                
                if leftNode.value != rightNode.value {
                    return false
                }
                
                if let left0 = leftNode.left {
                    leftLevels.append(left0)
                }
                
                if let right1 = rightNode.right {
                    rightLevels.append(right1)
                }
                
                if leftLevels.count != rightLevels.count {
                    return false
                }
                
                if let right0 = leftNode.right {
                    leftLevels.append(right0)
                }
                
                if let left1 = rightNode.left {
                    rightLevels.append(left1)
                }
                
                if leftLevels.count != rightLevels.count {
                    return false
                }
            }
            
            leftNodes = leftLevels
            rightNodes = rightLevels
        }
        
        return leftNodes.count == 0 && rightNodes.count == 0
    }
    
    static func isSymmetricRecursive(of pRoot: TreeNode?) -> Bool {
        return _checkSymmetric(pRoot1: pRoot, pRoot2: pRoot)
    }
    
    private static func _checkSymmetric(pRoot1: TreeNode?, pRoot2: TreeNode?) -> Bool {
        if pRoot1 == nil, pRoot2 == nil {
            return true
        }
        
        if pRoot1 == nil || pRoot2 == nil {
            return false
        }
        
        return pRoot1!.value == pRoot2!.value &&
            _checkSymmetric(pRoot1: pRoot1?.left, pRoot2: pRoot2?.right) &&
            _checkSymmetric(pRoot1: pRoot1?.right, pRoot2: pRoot2?.left)
    }
}

extension TreeAlgorithm {
    /**
     题目：二叉搜索树与双向链表
     描述：输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的双向链表。要求不能创建任何新的结
     点，只能调整树中结点指针的指向。
     解法：使用非递归中序遍历
     */
    static func convertBinarySearchTreeToDoubleLinkedList(pRootOfTree: inout TreeNode?) {
        var stack: [TreeNode] = []
        var node = pRootOfTree
        var pHeadOfTree: TreeNode? = nil
        var preNode: TreeNode? = nil
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            
            if !stack.isEmpty {
                node = stack.removeLast()
                let temp = node
                node = node?.right
                
                if pHeadOfTree == nil {
                    pHeadOfTree = temp
                    preNode = temp
                } else {
                    preNode?.right = temp
                    temp?.left = preNode
                    preNode = temp
                }
            }
        }
        
        preNode?.right = nil
        pRootOfTree = pHeadOfTree
    }
    
    static var preNode: TreeNode?
    static var head: TreeNode?
    static func convertBinarySearchTreeToDoubleLinkedListRecursive(pRootOfTree: TreeNode?) -> TreeNode? {
        miOrderVisit(pRootOfTree: pRootOfTree)
        return head
    }
    
    private static func miOrderVisit(pRootOfTree: TreeNode?) {
        if pRootOfTree == nil {
            return
        }
        
        miOrderVisit(pRootOfTree: pRootOfTree?.left)
        
        if head == nil {
            head = pRootOfTree
            preNode = pRootOfTree
        } else {
            preNode?.right = pRootOfTree
            pRootOfTree?.left = preNode
            preNode = pRootOfTree
        }
        
        miOrderVisit(pRootOfTree: pRootOfTree?.right)
    }
}


extension TreeAlgorithm {
    /**
     题目：序列化二叉树
     描述：请实现两个函数，分别用来序列化和反序列化二叉树
          二叉树的序列化是指：把一棵二叉树按照某种遍历方式的结果以某种格式保存为字符串，
          从而使得内存中建立起来的二叉树可以持久保存。序列化可以基于先序、中序、后序、
          层序的二叉树遍历方式来进行修改，序列化的结果是一个字符串，序列化时通过 某种符
          号表示空节点（#），以 ！ 表示一个结点值的结束（value!）。
          二叉树的反序列化是指：根据某种遍历顺序得到的序列化字符串结果str，重构二叉树。
          例如，我们可以把一个只有根节点为1的二叉树序列化为"1,"，然后通过自己的函数来解析回这个二叉树
     解法：使用BFS遍历树
     */
    static func serialize(root: TreeNode?) -> String {
        if root == nil {
            return "[]"
        }
        
        var queue: [TreeNode?] = [root!]
        var res: [String] = []
        while !queue.isEmpty {
            if let node = queue.removeFirst() {
                res.append("\(node.value)")
                queue.append(node.left)
                queue.append(node.right)
            } else {
                res.append("null")
            }
        }
        
        return "[" + res.joined(separator: ",") + "]"
    }
    
    static func deserialize(data: String) -> TreeNode? {
        if data == "[]" {
            return nil
        }
        
        let values = data.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "").split(separator: ",")
        let root = TreeNode(value: Int(values[0])!)
        var queue: [TreeNode] = [root]
        var i = 1
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if values[i] != "null" {
                node.left = TreeNode(value: Int(values[i])!)
                queue.append(node.left!)
            }
            
            i += 1
            if values[i] != "null" {
                node.right = TreeNode(value: Int(values[i])!)
                queue.append(node.right!)
            }
            i += 1
        }
        
        return root
    }
}

extension TreeAlgorithm {
    /**
     题目：二叉搜索树的第k个结点
     描述：给定一棵二叉搜索树，请找出其中的第k小的结点。例如， （5，3，7，2，4，6，8）
          中，按结点数值大小顺序第三小结点的值为4。
     解法：迭代法中序遍历到第k个节点
     */
    static func kthNodeOf(binarySearchTree root: TreeNode?, k: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        var stack: [TreeNode] = []
        var node: TreeNode? = root
        var i = 1
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            
            if !stack.isEmpty {
                node = stack.removeLast()
                if i == k {
                    return node
                }
                node = node?.right
                
                i += 1
            }
        }
        
        return nil
    }
    
    static func _middleOrderVisit(node: TreeNode?) {
        if node == nil {
            return
        }
        
        _middleOrderVisit(node: node?.left)
        print(node?.value)
        _middleOrderVisit(node: node?.right)
    }
}


extension TreeAlgorithm {
    /**
     题目：按之字形顺序打印二叉树
     描述：请实现一个函数按照之字形打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右至左的顺序打印，
          第三行按照从左到右的顺序打印，其他行以此类推。
     解法：使用两个栈先左后右再左依次遍历
     */
    static func printZStyle(root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var stack: [TreeNode] = []
        var level: [TreeNode] = []
        stack.append(root!)
        var res: [Int] = []
        var isReverse = true
        while !stack.isEmpty {
            while !stack.isEmpty {
                let node = stack.removeLast()
                res.append(node.value)
                
                if !isReverse {
                    if let right = node.right {
                        level.append(right)
                    }
                    
                    if let left = node.left {
                        level.append(left)
                    }
                } else {
                    if let left = node.left {
                        level.append(left)
                    }
                    
                    if let right = node.right {
                        level.append(right)
                    }
                }
            }
            
            stack = level
            level = []
            isReverse = !isReverse
        }
        
        return res
    }
}

// MARK: 非递归遍历二叉树
extension TreeAlgorithm {
    static func preorderTraverse(_ tree: TreeNode?) -> [Int] {
        if tree == nil { return [] }
        
        var stack: [TreeNode] = []
        var node: TreeNode? = tree
        var vals: [Int] = []
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                vals.append(node!.value)
                node = node?.left
            }
            
            let n = stack.removeLast()
            node = n.right
        }
        
        return vals
    }
    
    static func inorderTraverse(_ tree: TreeNode?) -> [Int] {
        if tree == nil { return [] }
        
        var stack: [TreeNode] = []
        var node: TreeNode? = tree
        var vals: [Int] = []
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            
            let n = stack.removeLast()
            vals.append(n.value)
            node = n.right
        }
        
        return vals
    }
    
    static func postorderTraverse(_ tree: TreeNode?) -> [Int] {
        if tree == nil { return [] }
        
        var stack: [TreeNode] = []
        var node: TreeNode? = tree
        var lastNode: TreeNode? = nil
        var vals: [Int] = []
        
        while node != nil {
            stack.append(node!)
            node = node?.left
        }
        
        while !stack.isEmpty {
            let n = stack.removeLast()
            if n.right == nil || n.right == lastNode {
                vals.append(n.value)
                lastNode = n
            } else {
                stack.append(n)
                node = n.right
                while node != nil {
                    stack.append(node!)
                    node = node?.left
                }
            }
        }
        
        return vals
    }
}

extension TreeAlgorithm {
    /**
     题目：返回二叉树到叶节点最大路劲和
     */
    static func maxPathSum(_ root: TreeNode?) -> Int {
        var sum = Int.min
        _maxPathSum(root, sum: &sum)
        return sum
    }

    @discardableResult
    static func _maxPathSum(_ root: TreeNode?, sum: inout Int) -> Int {
        if root == nil {
            return 0
        }

        let left = max(_maxPathSum(root?.left, sum: &sum), 0)
        let right = max(_maxPathSum(root?.right, sum: &sum), 0)
        let newValue = root!.value + left + right
        sum = max(sum, newValue)
        
        return root!.value + max(left, right)
    }
}

extension TreeAlgorithm {
    /**
     题目：查找二叉查找树两个节点的最近公共节点
     */
    static func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        guard var p = p else {
            return q
        }
        
        guard var q = q else {
            return p
        }
        
        if root.value == p.value {
            return root
        }
        
        if root.value == q.value {
            return q
        }
        
        if p.value > q.value {
            (p, q) = (q, p)
        }
        
        if root.value > p.value && root.value < q.value {
            return root
        } else if root.value < p.value && root.value < q.value {
            return lowestCommonAncestor(root.right, p, q)
        } else {
            return lowestCommonAncestor(root.left, p, q)
        }
    }
}
