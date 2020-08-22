//
//  SearchAlgorithmTest.swift
//  Algorithms
//
//  Created by wentilin on 2020/8/22.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class SearchAlgorithmTest {
    static func testStringExist() {
        var board: [[Character]] = [["a", "b", "c", "e"],
                                     ["s", "f", "c", "s"],
                                     ["a", "d", "e", "e"]]
        print("Exsit: \(SearchAlgorithm.exist(board: &board, word: "bcced"))")
    }
}


extension SearchAlgorithmTest {
    static func testMovingCount() {
        print("moving count: \(SearchAlgorithm.movingCount(m: 3, n: 3, k: 4))")
    }
}
