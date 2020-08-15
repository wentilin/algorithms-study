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
