//
//  ArrayAlgorithm.swift
//  Algorithms
//
//  Created by linwenhu on 2020/8/12.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class ArrayAlgorithm {
    /**
     统计一个数字再升序数组中出现的次数
     解法：先用二分法找到该数的位置，再左右分别递减找出相同的
     */
    static func findAppearCount(of number: Int, inSortedArray array: [Int]) -> Int {
        guard array.count > 0 else { return 0 }
        
        var lo = 0
        var hi = array.count - 1
        var mid = 0
        var index = -1
        while lo <= hi {
            mid = (hi - lo)/2 + lo
            if array[mid] == number {
                index = mid
                break
            } else if array[mid] < number {
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        
        if index == -1 {
            return 0
        }
        
        var appearCount = 1
        var left = index - 1
        while left >= 0, array[left] == array[index] {
            appearCount += 1
            left -= 1
        }
        
        var right = index + 1
        while right < array.count, array[right] == array[index] {
            appearCount += 1
            right += 1
        }
        
        return appearCount
    }
}

extension ArrayAlgorithm {
    /**
     的和正好是S，如果有多对数字的和等于S，输出两个数的乘积最小的。
     输出描述:
     对应每个测试案例，输出两个数，小的先输出。
     */
    static func twoNumbersWith(sum: Int, inSortedArray array: [Int]) -> (Int, Int)? {
        guard array.count > 1 else { return nil }

        var lo = 0
        var hi = array.count - 1
        var pair: (Int, Int)? = nil
        var multiRes = Int.min
        while lo < hi {
            let num = sum - array[lo]
            
            while array[hi] > num {
                hi -= 1
            }
            
            if array[hi] == num {
                let loNum = array[lo]
                let hiNum = array[hi]
                if pair == nil {
                    pair = (loNum, hiNum)
                }
                if (loNum * hiNum < multiRes) {
                    pair?.0 = lo
                    pair?.1 = hi

                    multiRes = loNum * hiNum
                }
                
                while array[lo] == array[lo+1] {
                    lo += 1
                }
                
                while array[hi] == array[hi-1] {
                    hi -= 1
                }
            }
            
            lo += 1
        }
        
        return pair
    }
}


extension ArrayAlgorithm {
    /**
      LL今天心情特别好,因为他去买了一副扑克牌,发现里面居然有2个大王,
      2个小王(一副牌原本是54张^_^)...他随机从中抽出了5张牌,
      想测测自己的手气,看看能不能抽到顺子,如果抽到的话,他决定去买体育彩票,
      嘿嘿！！“红心A,黑桃3,小王,大王,方片5”,“Oh My God!”不是顺子.....LL不高兴了,
      他想了想,决定大\小 王可以看成任何数字,并且A看作1,J为11,Q为12,K为13。
      上面的5张牌就可以变成“1,2,3,4,5”(大小王分别看作2和4),“So Lucky!”。LL决定去买体育彩票啦。
      现在,要求你使用这幅牌模拟上面的过程,然后告诉我们LL的运气如何， 如果牌能组成顺子就输出true，
      否则就输出false。为了方便起见,你可以认为大小王是0。
     
      解法：用一个长度14的数组记录number出现的次数，次数大于1返回false，用max和min记录数字中的最大最小值，
           max - min < 5
     */
    static func isContinuous(_ numbers: [Int]) -> Bool {
        assert(numbers.count == 5)
        
        var numberBucket: [Int] = Array(repeating: 0, count: 14)
        var min = 14
        var max = -1
        
        for number in numbers {
            numberBucket[number] += 1
            
            if number == 0 {
                continue
            }
            
            if numberBucket[number] > 1 {
                return false
            }
            
            if number > max {
                max = number
            }
            
            if number < min {
                min = number
            }
        }
        
        
        return max - min < 5;
    }
}

extension ArrayAlgorithm {
    /**
     题目：数组中出现次数超过一半的数字
     描述：数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。例如输入
          一个长度为9的数组{1,2,3,2,2,2,5,4,2}。由于数字2在数组中出现了5次，
          超过数组长度的一半，因此输出2。如果不存在则输出0。
     解法：从第一个数result开始，遇到下一个相同的则记录count+1，否则count-1，
          count为0时重置，result重置为当前数，计算该数是否满足超过一半要求
     */
    static func moreThanHalfItemIn(array: [Int]) -> Int? {
        guard array.count > 0 else { return nil }
        
        var result = array[0]
        var count = 1
        for i in 1..<array.count {
            if count == 0 {
                result = array[i]
                count = 1
            }
            
            if result == array[i] {
                count += 1
            } else {
                count -= 1
            }
        }
        
        count = 0
        for num in array {
            if num == result {
                count += 1
            }
        }
        
        return count > array.count/2 ? result : nil
    }
}

extension ArrayAlgorithm {
    /**
     题目：连续子数组的最大和
     描述：HZ偶尔会拿些专业问题来忽悠那些非计算机专业的同学。今天测试组开完会后,他又发话了:在古老的一维模式识别
          中,常常需要计算连续子向量的最大和,当向量全为正数的时候,问题很好解决。但是,如果向量中包含负数,是否应该包含某个
          负数,并期望旁边的正数会弥补它呢？例如:{6,-3,-2,7,-15,1,2,2},连续子向量的最大和为8(从第0个开始,到第3个为止)。给一
          个数组，返回它的最大连续子序列的和，你会不会被他忽悠住？(子向量的长度至少是1)
     解法：f(i) = max(f(i-1) + array[i], array[i])
     */
    static func findGreatestSumOfSubArray(array: [Int]) -> Int {
        guard array.count > 0 else { return Int.min }
        
        var f = array[0]
        var result = array[0]
        for i in 1..<array.count {
            f = max(f + array[i], array[i])
            result = max(result, f)
        }
        
        return result
    }
}

extension ArrayAlgorithm {
    /**
     题目：最小的K个数
     描述：输入n个整数，找出其中最小的K个数。例如输入4,5,1,6,2,7,3,8这8个数字，
          则最小的4个数字是1,2,3,4。
     解法：使用最小堆
     */
    static func getKLeastNumbers(array: [Int], k: Int) -> [Int] {
        guard array.count >= k else {
            return []
        }
        
        let queue = PriorityQueue()
        for number in array {
            queue.push(number)
        }
        
        var res: [Int] = []
        for _ in 0..<k {
            res.append(queue.pop())
        }
        
        return res
    }
}

extension ArrayAlgorithm {
    /**
     题目：把数组排成最小的数
     描述：输入一个正整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。
          例如输入数组{3，32，321}，则打印出这三个数字能排成的最小数字为321323。
     解法：将数组转为字符串数组，再排序
     */
    static func printMinConbinatedNumber(numbers: [Int]) -> String {
        if numbers.count == 0 {
            return ""
        }

        var strs: [String] = []
        for number in numbers {
            strs.append(String(number))
        }

        strs.sort { (s1, s2) -> Bool in
            let c1 = s1 + s2
            let c2 = s2 + s1
            return c1.compare(c2) == .orderedAscending
        }

        var res = ""
        for str in strs {
            res += str
        }

        return res
    }
}

extension ArrayAlgorithm {
    /**
     题目：滑动窗口的最大值
     描述：给定一个数组和滑动窗口的大小，找出所有滑动窗口里数值的最大值。例如，如果输入数组
          {2,3,4,2,6,2,5,1}及滑动窗口的大小3，那么一共存在6个滑动窗口，他们的最大值分别为{4,4,6,6,6,5}；
          针对数组{2,3,4,2,6,2,5,1}的滑动窗口有以下6个： {[2,3,4],2,6,2,5,1}， {2,[3,4,2],6,2,5,1}，
          {2,3,[4,2,6],2,5,1}， {2,3,4,[2,6,2],5,1}， {2,3,4,2,[6,2,5],1}， {2,3,4,2,6,[2,5,1]}。
          窗口大于数组长度的时候，返回空
     解法：使用双向链表记录当前窗口的索引，链表首位是当前窗口的最大值索引，每次移动窗口都会把尾部索引元素小于下一个元素的
          的索引移除
     */
    static func maxNumbersOfWindows(numbers: [Int], windowSize: Int) -> [Int] {
        if numbers.count < windowSize || windowSize == 0 {
            return []
        }
        
        // 数组模拟双向队列
        let deque: Deque = .init()
        
        // 初始化队列
        for i in 0..<windowSize {
            // 从后移除比当前数小的索引
            while !deque.isEmpty && numbers[i] > numbers[deque.last] {
                deque.popBack()
            }
            
            deque.pushBack(value: i)
        }
        var res: [Int] = [numbers[deque.first]]
        for i in windowSize..<numbers.count {
            // 队首元素小于等于当前索引则移除
            if !deque.isEmpty && deque.first <= i - windowSize {
                deque.popFront()
            }
            
            // 从后移除比当前数小的索引
            while !deque.isEmpty && numbers[i] > numbers[deque.last] {
                deque.popBack()
            }
            
            deque.pushBack(value: i)
            res.append(numbers[deque.first])
        }
        
        return res
    }
}

extension ArrayAlgorithm {
    /**
     题目：顺时针打印矩阵
     描述：输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字，例如，如果输入如下4 X 4矩阵：
          1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 则依次打印出数字1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10.
     解法：矩阵有四个边界左l，右r，上t，下b，遍历一圈边界收缩一圈，满足条件：
          从左到右：收缩后t+1，满足t  > b
          从上向下：收缩后r+1，满足l > r
          从右往左：收缩后b-1，满足t > b
          从下往上：收缩后l+1，满足l > r
     */
    static func spiralOrder(matrix: [[Int]]) -> [Int] {
        if matrix.count == 0 {
            return []
        }
        
        var l = 0
        var r = matrix[0].count - 1
        var t = 0
        var b = matrix.count - 1
        var res: [Int] = []
        while true {
            // left to right
            for i in l...r { res.append(matrix[t][i]) }
            t += 1
            if t > b { break }
            // top to bottom
            for i in t...b { res.append(matrix[i][r]) }
            r -= 1
            if l > r { break }
            // right to left
            for i in l...r { res.append(matrix[b][r-i+l]) }
            b -= 1
            if t > b { break }
            // bottom to top
            for i in t...b { res.append(matrix[b-i+t][l]) }
            l += 1
            if l > r { break }
        }
        
        return res
    }
}

extension ArrayAlgorithm {
    /**
     题目：数组中的逆序对
     描述：在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。
          输入一个数组,求出这个数组中的逆序对的总数P。
     解法：使用归并排序，右边元素归并回去时计算逆序对
     */
    static func inversePairs(of array: [Int]) -> Int {
        if array.count < 2 {
            return 0
        }
        
        var copy = array
        var temp = Array(repeating: 0, count: array.count)
        return _reversePairs(nums: &copy, left: 0, right: array.count - 1, temp: &temp)
    }
    
    private static func _reversePairs(nums: inout [Int], left: Int, right: Int, temp: inout [Int]) -> Int {
        if left == right {
            return 0
        }
        
        let mid = left + (right - left) / 2
        let leftPairs = _reversePairs(nums: &nums, left: left, right: mid, temp: &temp)
        let rightPairs = _reversePairs(nums: &nums, left: mid + 1, right: right, temp: &temp)
        
        let crossPairs = _mergeAndCount(nums: &nums, left: left, mid: mid, right: right, temp: &temp)
        return leftPairs + rightPairs + crossPairs
    }
    
    private static func _mergeAndCount(nums: inout [Int], left: Int, mid: Int, right: Int, temp: inout [Int]) -> Int {
        for i in left...right {
            temp[i] = nums[i]
        }
        
        var i = left
        var j = mid + 1
        var count = 0
        for k in left...right {
            if i == mid + 1 {
                nums[k] = temp[j]
                j += 1
            } else if j == right + 1 {
                nums[k] = temp[i]
                i += 1
            } else if temp[i] <= temp[j] {
                nums[k] = temp[i]
                i += 1
            } else {
                nums[k] = temp[j]
                j += 1
                
                // 比所有的到mid-i都大
                count += (mid - i + 1)
            }
        }
        
        return count
    }
}
