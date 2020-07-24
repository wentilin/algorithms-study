//
//  TriangleMinPath.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/1.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

/* 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上
    [
         [2],
        [3,4],
       [6,5,7],
      [4,1,8,3]
    ]
    
    自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）
 思路：自底向上，res[i][j] = min(res[i+1][j], res[i+1][j+1]) + triangle[i][j]
*/

class TriangleMinPath {
    static func minuteTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else { return -1 }
        
        let row = triangle.count - 1
        var result: [[Int]] = triangle
        
        var i = row - 1
        while i >= 0 {
            for j in 0...i {
                result[i][j] = min(result[i+1][j], result[i+1][j+1]) + result[i][j]
            }
            
            i -= 1
        }
        
        return result[0][0]
    }
}
