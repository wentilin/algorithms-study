//
//  TrieTree.swift
//  Algorithms
//
//  Created by wentilin on 2020/9/30.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class TrieTree: NSObject {
    let char: Character
    var children: [TrieTree?]
    var isEndingChar = false
    
    init(char: Character) {
        self.char = char
        children = Array(repeating: nil, count: 26)
    }
}
