"""
3. 无重复字符的最长子串
难度
中等

给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

示例 1:
输入: "abcabcbb"
输出: 3
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

示例 2:
输入: "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。

示例 3:
输入: "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
"""


class Solution:
    # 方法：滑动窗口(left, i为双指针)，用队列保存截止当前位置的最长字符串(如果s[i]和deque[i]重复，我们要从deque[i+1:]+s[i]考虑)
    # 用set才能达到O(1)的查询时间，因为其是用dict实现的
    # deque是双向链表, 查询O(n)；list也是O(n)
    # 时间：O(n)
    # 空间：O(n)
    def lengthOfLongestSubstring(self, s: str) -> int:
        if not s:
            return 0
        max_len, cur_len = 0, 0
        lookup = set()
        left = 0
        for i in range(len(s)):
            cur_len += 1
            while s[i] in lookup:  # O(1)
                lookup.remove(s[left])
                left += 1
                cur_len -= 1
            if cur_len > max_len:
                max_len = cur_len

            lookup.add(s[i])  # 要放在最后，不然会把它自己也remove掉

        return max_len


if __name__ == '__main__':
    print(Solution().lengthOfLongestSubstring("abcabcbb"))


