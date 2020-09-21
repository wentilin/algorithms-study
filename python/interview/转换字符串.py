"""
腾讯微保
 [["s1","s2"], ["s2","s3"], ["s4","s5"]]
 二维数组（代表关系：s1-> s2-> s3，s s5）
 输入字符串s。输出：替换后字符串，要求时间复杂度为O(n)

 s2=>s3

"""


def trans(input, char):
    mapping = {}
    for i in input:
        mapping[i[0]] = i[1]

    while char in mapping:
        tmp = mapping[char]
        char = tmp

    return char


if __name__ == '__main__':
    test = [["s1", "s2"], ["s2", "s3"], ["s3", "s6"], ["s4", "s5"]]
    print(trans(test, "s2"))
    print(trans(test, "s6"))
    print(trans(test, "s1"))