"""
题目描述
输入一个复杂链表（每个节点中有节点值，以及两个指针，一个指向下一个节点，另一个特殊指针random指向一个随机节点），
请对此链表进行深拷贝，并返回拷贝后的头结点。（注意，输出结果中请不要返回参数中的节点引用，否则判题程序会直接返回空）
"""


# -*- coding:utf-8 -*-
class RandomListNode:
    def __init__(self, x):
        self.label = x
        self.next = None
        self.random = None


class Solution1:
    # 方法: 深度优先遍历
    # time: O(n)
    # space: O(n)
    def Clone(self, pHead):
        def dfs(head):
            if not head:
                return None

            if head in visited:
                return visited[head]

            copy = RandomListNode(head.label)
            visited[head] = copy  # 保存的是copy的地址, 最后不能返回visited[pHead]
            copy.next = dfs(head.next)
            copy.random = dfs(head.random)
            return copy

        visited = {}
        return dfs(pHead)


import collections


class Solution2:
    # 方法: 广度优先遍历
    # time: O(n)
    # space: O(n)
    def Clone(self, pHead):

        visited = {}

        def bfs(head):
            if not head:
                return None
            root = RandomListNode(head.label)
            visited[head] = root
            queue = collections.deque()
            queue.append(head)
            while len(queue) > 0:
                cur = queue.popleft()
                if cur.next and cur.next not in visited:
                    visited[cur.next] = RandomListNode(cur.next.label)
                    queue.append(cur.next)
                if cur.random and cur.random not in visited:
                    visited[cur.random] = RandomListNode(cur.random.label)
                    queue.append(cur.random)
                # 如果cur.next为None, 用visited[cur.next]将有keyError, 而get可以返回None
                visited[cur].next = visited.get(cur.next)
                visited[cur].random = visited.get(cur.random)
            return root

        return bfs(pHead)
