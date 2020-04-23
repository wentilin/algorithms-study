//
//  Search.swift
//  Algorithms
//
//  Created by linwenhu on 2020/4/21.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

/*
 * 查找nxm数组
 * 数组左向右递增，上向下增长
 */
func search_nxm(_ array: [[Int]], number: Int) -> (Int, Int)? {
    let searchAreas = _searchAreas(array)
    for area in searchAreas {
        if let result = _search_nxn(arr: &arr, area: area, number: number) {
            return result
        }
    }
    
    return nil
}

private func _searchAreas(_ array: [[Int]]) -> [(i: Int, j: Int, count: Int)] {
    var rowCount: Int = array.count
    var columnCount: Int = array[0].count
    var i: Int = 0
    var j: Int = 0
    var searchAreas: [(i: Int, j: Int, count: Int)] = []
    
    if rowCount == columnCount {
        searchAreas.append((i, j, rowCount))
    } else {
        while rowCount != 0, columnCount != 0 {
            searchAreas.append((i, j, min(rowCount, columnCount)))
            
            if rowCount < columnCount {
                j += rowCount
                
                columnCount = columnCount - rowCount
            } else {
                i += columnCount
                
                rowCount = rowCount - columnCount
            }
        }
    }
    
    return searchAreas
}

private func _search_nxn(arr: inout [[Int]], area: (i: Int, j: Int, count: Int), number: Int) -> (Int, Int)? {
    guard let (a, b) = _searchDiagonal(arr: &arr, area: area, number: number) else {
        return nil
    }
    
    // search a row
    for k in area.i...a {
        if arr[k][b] == number {
            return (k, b)
        }
    }
    
    // search column
    for k in area.i...b {
        if arr[a][k] == number {
            return (a, k)
        }
    }
    
    return nil
}

private func _searchDiagonal(arr: inout [[Int]], area: (i: Int, j: Int, count: Int), number: Int) -> (Int, Int)? {
    let (i, j ,count) = area
    for k in 0..<count {
        let cur = arr[i+k][j+k]
        if cur >= number {
            return (i+k, j+k)
        }
    }
    
    return nil
}
