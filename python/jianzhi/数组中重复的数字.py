# -*- coding:utf-8 -*-
"""
题目描述
在一个长度为n的数组里的所有数字都在0到n-1的范围内。 数组中某些数字是重复的，但不知道有几个数字是重复的。也不知道每个数字重复几次。
请找出数组中任意一个重复的数字。 例如，如果输入长度为7的数组{2,3,1,0,2,5,3}，那么对应的输出是第一个重复的数字2。
"""


class Solution1:
    # 这里要特别注意~找到任意重复的一个值并赋值到duplication[0]
    # 函数返回True/False
    # 方法：遍历 + 哈希
    # time: O(n)
    # space: O(n)
    def duplicate(self, numbers, duplication):
        no_dup_dict = {}
        for number in numbers:
            if number in no_dup_dict:
                # python 2: duplication[0] = number
                duplication.append(number)
                return True
            else:
                no_dup_dict[number] = 1
        return False


class Solution2:
    # 这里要特别注意~找到任意重复的一个值并赋值到duplication[0]
    # 函数返回True/False
    # 方法: 数组长度为n，数字范围为0-(n-1), 如果不重复的话，每个数字i都可以放在数组下标为i的位置上
    # time: O(n)
    # space: O(1)
    def duplicate(self, numbers, duplication):
        for i, number in enumerate(numbers):
            while numbers[i] != i:
                if numbers[numbers[i]] == numbers[i]:
                    # python 2: duplication[0] = number
                    duplication.append(numbers[i])
                    return True
                else:
                    numbers[numbers[i]], numbers[i] = numbers[i], numbers[numbers[i]]
        return False


if __name__ == '__main__':
    numbers = [2, 1, 3, 1, 4]
    dup = []
    sol = Solution2()
    has_dup = sol.duplicate(numbers, dup)
    if has_dup and len(dup) == 0:
        print("Error: has dup but return none")
    if not has_dup and len(dup) != 0:
        print("Error: no dup but return a number")
    if has_dup:
        print("Dup: {}".format(dup[0]))
    else:
        print("No dup")
