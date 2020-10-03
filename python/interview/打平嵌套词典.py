"""
腾讯微保
{'a1':
    {
        'b4':
            {
                'c0': 7
            },
        'b0': 2,
        'b1': 3,
        'b2': {
                'c0': 4
              },
        'b3': 6
    },
 'a0': 1,
 'a2': 5
}

打平为

{'a1.b4.c0': 7, 'a1.b3': 6, 'a1.b1': 3, 'a1.b0': 2, 'a1.b2.c0': 4, 'a0': 1, 'a2': 5}
"""

# 1


def flat(map):
    result = {}

    def dfs(map, k_str):
        if isinstance(map, int):
            result[k_str] = map
        if isinstance(map, dict):
            for index in map:
                dfs(map[index], k_str + '.' + index)

    if not map:
        return None
    for k in map:
        dfs(map[k], k)
    return result


if __name__ == '__main__':
    map = {'a1':
    {
        'b4':
            {
                'c0': 7
            },
        'b0': 2,
        'b1': 3,
        'b2': {
                'c0': 4
              },
        'b3': 6
    },
 'a0': 1,
 'a2': 5
}
    res = flat(map)
    print(res)