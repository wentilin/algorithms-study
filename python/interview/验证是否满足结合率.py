
seq = []
res = True
try:
    for i in range(4):
        number = int(input())
        seq.append(number)
except ValueError:
    "Not a number"
check = {0: {0: seq[0], 1: seq[1]}, 1: {0: seq[2], 1: seq[3]}}
value = [0, 1]
for i in value:
    for j in value:
        for k in value:
            if check[check[i][j]][k] != check[i][check[j][k]]:
                res = False

print('Yes') if res else print("No")

# seq = []
# try:
#     numbers = input()
#     seq = numbers.split()
# except ValueError:
#     "Not a number"
#
# total = 0
# for i, _ in enumerate(seq):
#     for j in range(i + 1, len(seq)):
#         total += int(seq[i]) * int(seq[j])
# print(total)