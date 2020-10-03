# 1


def preOrder(node):
    stack = []                        # 辅助栈，存储遍历操作的结点
    output = []                       # 存储最后的输出，也可直接打印。输出形式不重要
    while node or stack:              # 当前结点为空"且"辅助栈也为空时循环结束
        while node:                   # 如果node结点存在，继续向左遍历下去，直到为空节点（即没有左节点）
            stack.append(node)
            output.append(node.value)
            node = node.left
        tem = stack.pop()
        node = tem.right
    return output


def inOrder(node):
    stack = []
    output = []
    while node or stack:
        while node:
            stack.append(node)
            node = node.left
        tem = stack.pop()
        output.append(tem.value)   # 中序遍历在左节点为空时输出根节点
        node = tem.right
    return output


def post_order(head):
    '''
    后序遍历二叉树非递归 后序遍历是 左-右-中
    反过来就是 中-右-左 其实就是先序遍历镜像二叉树(即左右互换)
    :param head: 头节点
    :return: result[::-1] 逆序
    '''
    if not head:
        return []
    stack, result = [], []
    stack.append(head)
    while len(stack) != 0:
        node = stack.pop() # 先序 遇到就先输出
        result.append(node.val)
        # 先压栈左节点再压右节点 所以输出就是先右后左
        if node.left:
            stack.append(node.left)
        if node.right:
            stack.append(node.right)
    return result[::-1] # 将 中-右-左 逆序变为 左-右-中