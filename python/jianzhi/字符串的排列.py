"""
题目描述
输入一个字符串,按字典序打印出该字符串中字符的所有排列。例如输入字符串abc,
则按字典序打印出由字符a,b,c所能排列出来的所有字符串abc,acb,bac,bca,cab和cba。

输入描述:
输入一个字符串,长度不超过9(可能有字符重复),字符只包括大小写字母。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法: 递归
    # time: O(n!)
    # space: O(n^2)[全排列的递归深度为O(n); 辅助的set存储的字符数量最多为n+(n-1)+(n-2)+...+1=O(n^2)]
    def Permutation(self, ss):
        c, res = list(ss), []

        def dfs(x):
            if x == len(c) - 1:
                res.append(''.join(c))

            dic = set()  # 防止字符串有重复
            for i in range(x, len(c)):  # 把不同元素放在第x位(重复的不考虑)，然后递归得到x+1之后的排列
                if c[i] in dic:
                    continue
                dic.add(c[i])

                c[i], c[x] = c[x], c[i]  # 把不同元素放在第x位(重复的不考虑)
                dfs(x + 1)  # 固定[:x+1]的元素，递归[x+1:len(c)]
                c[i], c[x] = c[x], c[i]  # 恢复原状， 因为需要把c[x+1]放在第x位

        if not ss:
            return res
        dfs(0)
        return sorted(res)






    # def Permutation(self, ss):
    #     c, res = list(ss), []
    #
    #     def dfs(x):
    #         if x == len(c) - 1:
    #             res.append(''.join(c))  # 添加排列方案
    #             return
    #         dic = set()
    #         for i in range(x, len(c)):
    #             if c[i] in dic:
    #                 continue  # 重复，因此剪枝
    #             dic.add(c[i])
    #             c[i], c[x] = c[x], c[i]  # 交换，将 c[i] 固定在第 x 位
    #             dfs(x + 1)  # 开启固定第 x + 1 位字符
    #             c[i], c[x] = c[x], c[i]  # 恢复交换
    #
    #     dfs(0)
    #     return res


if __name__ == '__main__':
    print(Solution().Permutation("abc"))
    print(Solution().Permutation("aa"))