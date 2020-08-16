//
//  TreeNode.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/17.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class TreeNode: NSObject {
    let value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

class TreeLinkNode: NSObject {
    let value: Int
    var left: TreeLinkNode?
    var right: TreeLinkNode?
    var parent: TreeLinkNode?
    
    init(value: Int, left: TreeLinkNode? = nil, right: TreeLinkNode? = nil, parent: TreeLinkNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
        self.parent = parent
    }
}
