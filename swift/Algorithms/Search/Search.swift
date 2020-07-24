//
//  Search.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/22.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

/*
 * 方法一
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

func findNxM(_ array: [[Int]], target: Int) -> Bool {
    if let _ = indexOfArryNxM(array, target: target) {
        return true
    }
    
    return false
}

/*
* 方法二
* 查找nxm数组
* 数组左向右递增，上向下增长
*/
func indexOfArryNxM(_ array: [[Int]], target: Int) -> (Int, Int)? {
    guard array.count > 0 else { return nil }
    
    let rowCount = array.count
    let columnCount = array[0].count
    
    var row: Int = rowCount - 1
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

/*
 * 查找非递减旋转数组最小值
 */
func minNumberInRotateArray(_ array: [Int]) -> Int {
    if array.isEmpty {
        return 0
    }
    
    var lo = 0
    var hi = array.count - 1
    var mid = 0
    
    while lo < hi {
        mid = lo + (hi - lo) / 2
        if array[mid] > array[hi] {
            lo = mid + 1
        } else if array[mid] == array[hi] {
            hi -= 1
        } else {
            hi = mid
        }
    }
    
    return array[lo]
}
