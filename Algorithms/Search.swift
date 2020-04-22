//
//  Search.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/22.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

func findNxM(_ array: [[Int]], target: Int) -> Bool {
    if let _ = indexOfArryNxM(array, target: target) {
        return true
    }
    
    return false
}

func indexOfArryNxM(_ array: [[Int]], target: Int) -> (Int, Int)? {
    guard array.count > 0 else { return nil }
    
    let rowCount = array.count
    let columnCount = array[0].count
    
    var row: Int = rowCount
    var column: Int = 0
    
    while row > 0 && column < columnCount {
        let item = array[row][column]
        if item == target {
            return (row, column)
        } else if item > target {
            row -= 1
        } else {
            column += 1
        }
    }
    
    return nil
}
