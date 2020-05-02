//
//  BinarySearch.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/2.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class SearchAlgorithm {
    static func binarySearch(array: [Int], target: Int) -> Int? {
        guard array.count > 0 else { return nil }
        
        var lo: Int = 0
        var hi: Int = array.count - 1
        var mid: Int
        
        while lo <= hi {
            mid = lo + (hi - lo) / 2
            let num = array[mid]
            if num == target {
                return mid
            } else if num < target {
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        
        return nil
    }
}
