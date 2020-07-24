//
//  SortAlgorithm.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/3.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class SortAlgorithm {
    // 选取一个位置作为基准，<=放左边，>放右边，再分别对左右subarray排序
    static func quickSort(array: inout [Int], low: Int, high: Int) {
        if low >= high {
            return
        }
        // l                           h
        // 10, 3, 5, 6, 2, 7, 1, 4, 8, 9
        var i = low
        var j = high
        let key = array[low]
        
        while true {
            while array[i] <= key {
                i += 1
                
                if i == high {
                    break
                }
            }
            
            while array[j] > key {
                j -= 1
                
                if j == low {
                    break
                }
            }
            
            if i >= j {
                break
            }
            
            // swap
            (array[i], array[j]) = (array[j], array[i])
        }
        
        // 把基准值插入到合适位置
        (array[low], array[j]) = (array[j], array[low])
        
        quickSort(array: &array, low: low, high: j-1)
        quickSort(array: &array, low: j+1, high: high)
    }
}
