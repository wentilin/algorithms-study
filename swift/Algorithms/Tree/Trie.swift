//
//  Trie.swift
//  Algorithms
//
//  Created by wentilin on 2020/9/30.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

/// 前缀树的字符必须为Aa~Zz，不区分大小写
class Trie {
    private let root: TrieTree = .init(char: .init("/"))
    
    public func insert(_ text: String) {
        var p = root
        for char  in text.lowercased() {
            let index = Int(char.unicodeScalars.first!.value - "a".unicodeScalars.first!.value)
            if p.children[index] == nil {
                p.children[index] = TrieTree(char: char)
            }
            p = p.children[index]!
        }
        p.isEndingChar = true
    }
    
    public func find(_ text: String) -> Bool {
        var p = root
        for char  in text.lowercased() {
            let index = Int(char.unicodeScalars.first!.value - "a".unicodeScalars.first!.value)
            if p.children[index] == nil {
                return false
            }
            p = p.children[index]!
        }
        
        return p.isEndingChar
    }
}
