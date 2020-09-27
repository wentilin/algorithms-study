"""
题目描述
假设你有一个数组，其中第i个元素是股票在第i天的价格。
你有一次买入和卖出的机会。（只有买入了股票以后才能卖出）。请你设计一个算法来计算可以获得的最大收益。

示例1:
输入: [7,1,5,3,6,4]
输出: 5
解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。


示例2:
输入: [7,6,4,3,1]
输出: 0
解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
"""


class Solution:
    # 方法：记录最小值和最大profit
    # 时间：O(n)
    # 空间：O(1)
    def maxProfit(self, prices):
        if not prices:
            return 0

        min_price, profit = prices[0], 0  # new min_price只有更小，才可能获得更大的profit，不然用old min_price买入即可
        for i in range(1, len(prices)):
            profit = max(prices[i] - min_price, profit)
            min_price = prices[i] if prices[i] < min_price else min_price
        return profit


if __name__ == '__main__':
    print(Solution().maxProfit([7, 1, 5, 3, 6, 4]))  # 5
    print(Solution().maxProfit([7, 6, 4, 3, 1]))  # 0
