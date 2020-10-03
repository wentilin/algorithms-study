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
    
    /**
     冒泡排序：通过不断交换把较大的数冒泡到右边
     */
    func bubbleSort(_ nums: inout [Int]) {
        var flag = false
        for i in 0..<nums.count {
            for j in 0..<nums.count-i-1 {
                if nums[j] > nums[j+1] {
                    (nums[j], nums[j+1]) = (nums[j+1], nums[j])
                    flag = false
                } else {
                    flag = true
                }
            }
            
            if flag {
                break
            }
        }
    }

    /**
     插入排序：左区间排好序，从右区间顺序插入数字到左区间
     */
    func insertSort(_ nums: inout [Int]) {
        if nums.count < 1 {
            return
        }
        for i in 1..<nums.count {
            var j = i - 1
            while j >= 0 {
                if nums[j+1] < nums[j] {
                    (nums[j], nums[j+1]) = (nums[j+1], nums[j])
                } else {
                    break
                }
                
                j -= 1
            }
        }
    }

    /**
     选择排序：右区间选择最小值插入到左区间边缘
     */
    func selectionSort(_ nums: inout [Int]) {
        for i in 0..<nums.count {
            var minValue = nums[i]
            var minIndex = i
            for j in i+1..<nums.count {
                if nums[j] < minValue {
                    minValue = nums[j]
                    minIndex = j
                }
            }
            
            (nums[i], nums[minIndex]) = (nums[minIndex], nums[i])
        }
    }
}
