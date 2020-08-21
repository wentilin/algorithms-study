//
//  SomeAlgorithms.swift
//  Algorithms
//
//  Created by wentilin on 2020/7/18.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class SomeAlgorithms {
    static func add(_ num1: Int, _ num2: Int) -> Int {
        var n1 = num1
        var n2 = num2
        while n2 != 0 {
            let sum = n1 ^ n2 // 没有进位
            let carry = (n1 & n2) << 1 // 有进位，左移是进位后
            
            (n1, n2) = (sum, carry)
        }
        
        return n1
    }
}

extension SomeAlgorithms {
    /// 一个整型数组里除了两个数字之外，其他的数字都出现了两次。
    /// 请写程序找出这两个只出现一次的数字。
    /// 解法：1. 数组中相同的数异或(^)后会抵消，最后剩下的结果是两个不同数的异或
    ///      2. 找到第一个异或为1的位，按此换分为两个数组，改位置具有相同1的分到了一组，
    ///        都为0的分到了一组，组内元素分别异或最后的结果是两个不同的数
    static func findNumsAppearOnce(numbers: [Int]) -> (Int, Int) {
        precondition(numbers.count > 1)
        
        if numbers.count == 2 {
            return (numbers[0], numbers[1])
        }
        
        let bitRes = numbers.reduce(0, { $0 ^ $1 })
        let index = _first1(by: bitRes)
        var num1: Int = 0
        var num2: Int = 0
        for num in numbers {
            if _isBit1(target: num, index: index) {
                num1 ^= num
            } else {
                num2 ^= num
            }
        }
        
        return (num1, num2)
    }
    
    private static func _first1(by number: Int) -> Int {
        var index = 0
        var res = number
        while res & 1 == 0, index < 64 {
            res >>= 1
            index += 1
        }
        
        return index
    }
    
    private static func _isBit1(target: Int, index: Int) -> Bool {
        return ((target >> index) & 1) == 1
    }
}

extension SomeAlgorithms {
    /*
    给定一个数组A[0,1,...,n-1],请构建一个数组B[0,1,...,n-1],
    其中B中的元素B[i]=A[0]*A[1]*...*A[i-1]*A[i+1]*...*A[n-1]。
    不能使用除法。（注意：规定B[0] = A[1] * A[2] * ... * A[n-1]，
    B[n-1] = A[0] * A[1] * ... * A[n-2];）
    解法：
        左边：B[i] = A[0]*A[1]*...*A[i-1]
        右边：A[i+1]*A[i+2]*...*A[n-1]
    */
    public static func multiply(A: [Int]) -> [Int] {
        var B: [Int] = Array(repeating: 0, count: A.count);
        var res = 1;
        // 左边
        for i in 0..<A.count {
            B[i] = res;
            res *= A[i];
        }
        // 右边
        res = 1;
        for i in 0..<A.count {
            B[A.count-i-1] *= res;
            res *= A[A.count-i-1];
        }

        return B;
    }
}

extension SomeAlgorithms {
    /*
     给你一根长度为n的绳子，请把绳子剪成整数长的m段（m、n都是整数，n>1并且m>1，m<=n），
     每段绳子的长度记为k[1],...,k[m]。请问k[1]x...xk[m]可能的最大乘积是多少？
     例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。
     解法：
        n可以划分为2~n段，每段都先贪婪的选取ceil(target_remain/n_remain)
     */
    public static func cutRope(target: Int) -> Int {
        var res = 0
        for i in 2..<target {
            var temp = 1
            var remaind = target
            for j in 0..<i {
                let cur = Int(ceilf(Float(remaind)/Float(i-j)))
                temp *= cur;
                remaind -= cur;
            }

            res = max(res, temp);
        }

        return res;
    }
}

extension SomeAlgorithms {
    static func swap(num1: inout Int, num2: inout Int) {
        num1 = num1 ^ num2
        num2 = num1 ^ num2
        num1 = num1 ^ num2
    }
}

class MachineState: NSObject {
    let isAccepted: Bool
    private var transfers: [Character: MachineState] = [:]
    
    private var digitState: MachineState?
    
    init(isAccepted: Bool) {
        self.isAccepted = isAccepted
    }
    
    func transfer(with char: Character, to machineState: MachineState) {
        transfers[char] = machineState
    }
    
    func transferDigit(to machineState: MachineState) {
        digitState = machineState
    }
    
    func transfer(with char: Character) -> MachineState? {
        if let _ = Int(String(char)) {
            return digitState
        }
        
        return transfers[char]
    }
}

class ExpressionAlgorithms {
    /*
     请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。例如，字符串"+100","5e2","-123",
     "3.1416"和"-1E-16"都表示数值。 但是"12e","1a3.14","1.2.3","+-5"和"12e+4.3"都不是。
     解法：构建确定有限状态机DFA
     */
    static func isNumeric(of string: String) -> Bool {
        var machineState: MachineState? = _buildStateMachine()
        
        for ch in string {
            machineState = machineState?.transfer(with: ch)
            if machineState == nil {
                return false
            }
        }
        
        return machineState!.isAccepted
    }
    
    static func _buildStateMachine() -> MachineState {
        let start = MachineState(isAccepted: false)
        
        let state1 = MachineState(isAccepted: false)
        let state3 = MachineState(isAccepted: true)
        
        start.transfer(with: "+", to: state1)
        start.transfer(with: "-", to: state1)
        start.transferDigit(to: state3)
        state3.transferDigit(to: state3)
        
        let state2 = MachineState(isAccepted: false)
        start.transfer(with: ".", to: state2)
        state1.transfer(with: ".", to: state2)
        
        let state4 = MachineState(isAccepted: true)
        state1.transferDigit(to: state4)
        state2.transferDigit(to: state4)
        
        state4.transferDigit(to: state4)
        
        let state5 = MachineState(isAccepted: false)
        state4.transfer(with: "e", to: state5)
        state4.transfer(with: "E", to: state5)
        state3.transfer(with: "e", to: state5)
        state3.transfer(with: "E", to: state5)
        
        let state6 = MachineState(isAccepted: true)
        state5.transferDigit(to: state6)
        state6.transferDigit(to: state6)
        
        let state7 = MachineState(isAccepted: false)
        state5.transfer(with: "+", to: state7)
        state5.transfer(with: "-", to: state7)
        
        let state8 = MachineState(isAccepted: true)
        state7.transferDigit(to: state8)
        state8.transferDigit(to: state8)
        
        let state9 = MachineState(isAccepted: false)
        state4.transfer(with: ".", to: state9)
        state3.transfer(with: ".", to: state9)
        
        let state10 = MachineState(isAccepted: true)
        state9.transferDigit(to: state10)
        state10.transferDigit(to: state10)
        state10.transfer(with: "e", to: state5)
        state10.transfer(with: "E", to: state5)
        
        return start
    }
}

extension SomeAlgorithms {
    /**
      题目：和为S的连续正数序列
      小明很喜欢数学,有一天他在做数学作业时,要求计算出9~16的和,他马上就写出了正确答案是100。
      但是他并不满足于此,他在想究竟有多少种连续的正数序列的和为100(至少包括两个数)。
      没多久,他就得到另一组连续正数和为100的序列:18,19,20,21,22。现在把问题交给你,
      你能不能也很快的找出所有和为S的连续正数序列? Good Luck!
      输出所有和为S的连续正数序列。序列内按照从小至大的顺序，序列间按照开始数字从小到大的顺序
      解法：从1开始穷举，累加至和为sum
     */
    static func findContinuousSequence(for sum: Int) -> [[Int]]{
        guard sum > 1 else { return [] }
        
        var results: [[Int]] = []
        for i in 1..<sum {
            var sequence: [Int] = []
            sequence.append(i)
            var tmp = i
            for j in i+1..<sum {
                if sum < j+tmp {
                    break
                }
                
                tmp += j
                sequence.append(j)
            }
            
            if tmp == sum {
                results.append(sequence)
            }
        }
        
        return results
    }
}

extension SomeAlgorithms {
    /**
     题目：整数中1出现的次数（从1到n整数中1出现的次数）
     描述：求出1~13的整数中1出现的次数,并算出100~1300的整数中1出现的次数？
          为此他特别数了一下1~13中包含1的数字有1、10、11、12、13因此共出现6次,
          但是对于后面问题他就没辙了。ACMer希望你们帮帮他,并把问题更加普遍化,可以
          很快的求出任意非负整数区间中1出现的次数（从1 到 n 中1出现的次数）。
     解法：N为x位数，表示为Nx Nx-1...Ni Ni-1...N1，i为当前位cur，Nx Nx-1...Ni+1为高位high， Ni-1...N1为低位low，
          digit为位数（如10表示十位）
          1. 当cur=0时，1的次数由高位决定：high * digit
          2. 当cur=1时，1的次数由高位和低位决定：high * digit + low + 1
          3. 当cur=2~9时，1的次数由高位决定：(high+1) * digit
     */
    static func numberOf1Between1AndN(_ n: Int) -> Int {
        var digit = 1
        var res = 0
        var high = n / 10
        var cur = n % 10
        var low = 0
        while high != 0 || cur != 0 {
            if cur == 0 {
                res += high * digit
            } else if cur == 1 {
                res += high * digit + low + 1
            } else {
                res += (high + 1) * digit
            }
            
            low += cur * digit
            cur = high % 10
            high /= 10
            digit *= 10
        }
        
        return res
    }
}

extension SomeAlgorithms {
    /**
     题目：二进制中1的个数
     描述：输入一个整数，输出该数32位二进制表示中1的个数，其中负数用补码表示
     解法：从右向左与1做与运算，结果为1则含有1
     */
    static func numberOf1ToBinary(n: Int) -> Int {
        var count: Int = 0
        var num = n
        if n < 0 {
            num = n & 0x7fffffff
            count = 1
        }
        while num != 0 {
            if num & 1 == 1 {
                count += 1
            }
            num = num >> 1
        }
        
        return count
    }
}

extension SomeAlgorithms {
    /**
     题目：丑数
     描述：把只包含质因子2、3和5的数称作丑数（Ugly Number）。例如6、8都是丑数，但14不是，因为它包含质因子7。 习惯上我们把1当做是第一个丑数。
          求按从小到大的顺序的第N个丑数。
     解法：用三个队列存储分别乘以2，3，5的丑数，每次将最新的丑数分别乘以队列最大的数，并取走三个队列中最小的数成为新的丑数
     */
    static func getUglyNumber(index: Int) -> Int {
        if index < 6 {
            return index
        }
        
        var res: [Int] = [1]
        var p0 = 0
        var p1 = 0
        var p2 = 0
        var number: Int = 1
        while res.count < index {
            number = min(res[p0] * 2, res[p1] * 3, res[p2] * 5)
            res.append(number)
            if res[p0] * 2 == number {
                p0 += 1
            }
            
            if res[p1] * 3 == number {
                p1 += 1
            }
            
            if res[p2] * 5 == number {
                p2 += 1
            }
        }
        
        return number
    }
}
