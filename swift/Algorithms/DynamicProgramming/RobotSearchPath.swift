//
//  RobotSearchPath.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/1.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class RobotSearchPath {
    /**
     *  一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
     *  机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）*   。
     *  问总共有多少条不同的路径？
     *
     *  思路：第i个格子可能来自于上或左：f(i, j) = f(i - 1,j) + f(i, j - 1)，上边界只能左边过来，左边界只能上边过来
     */
    static func pathKindsOfRobot(m: Int, n: Int) -> Int {
        // 构建mxn path矩阵
        var matrixPath: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
        
        // 上边界的不同路劲
        for i in 0..<n {
            matrixPath[0][i] = 1
        }
        
        // 左边界
        for i in 0..<m {
            matrixPath[i][0] = 1
        }
        
        for i in 1..<m {
            for j in 1..<n {
                matrixPath[i][j] = matrixPath[i-1][j] + matrixPath[i][j-1]
            }
        }
        
        return matrixPath[m-1][n-1]
    }
}
