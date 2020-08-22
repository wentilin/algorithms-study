//
//  SearchAlgorithm.swift
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


extension SearchAlgorithm {
    /**
     题目：矩阵中的路径
     描述：请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以
          从矩阵中的任意一个格子开始，每一步可以在矩阵中向左，向右，向上，向下移动一个格子。如果一条
          路径经过了矩阵中的某一个格子，则该路径不能再进入该格子。
     解法：使用深度优先遍历(DFS)遍历，上下左右四格方向依次遍历，访问过的做标记
     */
    static func exist(board: inout [[Character]], word: String) -> Bool {
        var words = word.map{ $0 }
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if _dfs(board: &board, word: &words, i: i, j: j, k: 0) {
                    return true
                }
            }
        }
        
        return false
    }
    
    static func _dfs(board: inout [[Character]], word: inout [Character], i: Int, j: Int, k: Int) -> Bool {
        // 判断是否超出边界，当前单词是否匹配
        if i >= board.count || i < 0 ||
            j >= board[0].count || j < 0 ||
            board[i][j] != word[k] {
            return false
        }
        
        if (k == word.count - 1) {
            return true
        }
        
        let temp = board[i][j]
        // 标志已访问
        board[i][j] = "/"
        let res = _dfs(board: &board, word: &word, i: i+1, j: j, k: k+1) ||
            _dfs(board: &board, word: &word, i: i-1, j: j, k: k+1) ||
            _dfs(board: &board, word: &word, i: i, j: j+1, k: k+1) ||
            _dfs(board: &board, word: &word, i: i, j: j-1, k: k+1)
        
        board[i][j] = temp
        
        return res
    }
}

extension SearchAlgorithm {
    /**
     题目：机器人的运动范围
     描述：地上有一个m行和n列的方格。一个机器人从坐标0,0的格子开始移动，每一次只能向左，右，上，
          下四个方向移动一格，但是不能进入行坐标和列坐标的数位之和大于k的格子。 例如，当k为18时，机器
          人能够进入方格（35,37），因为3+5+3+7 = 18。但是，它不能进入方格（35,38），因为3+5+3+8 = 19。
          请问该机器人能够达到多少个格子？
     解法：使用深度优先遍历，因为往左往下递增，所以只需往左往下走
     */
    static func movingCount(m: Int, n: Int, k: Int) -> Int {
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)
        return _movingDFS(visited: &visited, i: 0, j: 0, k: k)
    }
    
    static func _movingDFS(visited: inout [[Bool]], i: Int, j: Int, k: Int) -> Int {
        if i >= visited.count || j >= visited[0].count || _sum(i) + _sum(j) > k || visited[i][j] {
            return 0
        }
        visited[i][j] = true
        return 1 + _movingDFS(visited: &visited, i: i+1, j: j, k: k) + _movingDFS(visited: &visited, i: i, j: j+1, k: k)
    }
    
    static func _sum(_ number: Int) -> Int {
        var sum = 0
        var x = number
        while x != 0 {
            sum += (x % 10)
            x = x / 10
        }
        
        return sum
    }
}
