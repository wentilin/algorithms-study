"""
https://leetcode-cn.com/problems/longest-common-prefix/solution/zui-chang-gong-gong-qian-zhui-by-leetcode-solution/

编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

示例 1:
输入: ["flower","flow","flight"]
输出: "fl"


示例 2:
输入: ["dog","racecar","car"]
输出: ""

解释: 输入不存在公共前缀。

说明:
所有输入只包含小写字母 a-z 。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/longest-common-prefix
"""


class Solution:
    def longestCommonPrefix(self, strs):
        def lcp(start, end):
            if start == end:
                return strs[start]

            mid = (start + end) // 2
            lcp_left, lcp_right = lcp(start, mid), lcp(mid + 1, end)
            min_len = min(len(lcp_left), len(lcp_right))
            for i in range(min_len):
                if lcp_left[i] != lcp_right[i]:
                    return lcp_left[:i]
            return lcp_left[:min_len]

        return "" if not strs else lcp(0, len(strs) - 1)


if __name__ == '__main__':
    print(Solution().longestCommonPrefix(["dog", "racecar", "car"]))
    print(Solution().longestCommonPrefix(["flower", "flow", "flight"]))