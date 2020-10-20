//
//  main.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/4.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

let cache = _LRUCache<Int, Int>(2)

print("LURCace start")
print(cache.get(2) ?? -1)
print(cache.get(2) ?? -1)

cache.put(2, 6)
print(cache.get(1) ?? -1)
cache.put(1, 5)
cache.put(1, 2)
print(cache.get(1) ?? -1)
print(cache.get(2) ?? -1)

print(cache)

print("LURCace end")

print("find index in nxm array-----------start")
var arr: [[Int]] = []

for i in 0..<4 {
    arr.append([])
    for j in i..<(i+7) {
        arr[i].append(j)
    }
}

print(arr)

print(search_nxm(arr, number: 4))
print(indexOfArryNxM(arr, target: 4))

print("find index in nxm array-----------end")

print("minNumberInRotateArray:\(minNumberInRotateArray([3, 4, 2, 3]))")

let moneyMaps: [MoneyMap] = [.init(kind: 1, count: 5),
                             .init(kind: 5, count: 2),
                             .init(kind: 10, count: 2),
                             .init(kind: 50, count: 3),
                             .init(kind: 100, count: 5)]
print("GreedyMoney:\(SomeAlgorithms.greedyMoney(money: 456, moneyMaps: moneyMaps))")

let triangle = [[2],
               [3,4],
              [6,5,7],
             [4,1,8,3]]
print("TriangleMinPath:\(TriangleMinPath.minuteTotal(triangle))")
                     
print("MaxSumOfSubArray:\(MaxSumOfSubArray.solve(arr: [-2,1,-3,4,-1,2,1,-5,4]) ?? Int.min)")

print("RobotSearchPath:\(RobotSearchPath.pathKindsOfRobot(m: 7, n: 3))")

print("BinarySearch: \(SearchAlgorithm.binarySearch(array: [1,2,3,4,5,6,7,8,9,10], target: 8))")

var arrayToSort: [Int] = [10, 3, 5, 6, 2, 7, 1, 4, 8, 9]
SortAlgorithm.quickSort(array: &arrayToSort, low: 0, high: arrayToSort.count-1)
print("QuickSort: \(arrayToSort)")

print("DuplicateNumber: \(ArrayAlgorithm.duplicateNumber(at: [0, 3, 2, 4, 1, 2]) ?? -1)")

let base: Double = -2
let exponent: Int = -3
print("PowAlgorithm.pow(\(base), \(exponent))=\(NumberAlgorithm.pow(base: base, exponent: exponent))")


ListNodeTests.startTest()

_TreeTests.testHasSubtree()

_TreeTests.testMirror()

StackAlgorithm.testMinStack()

_TreeTests.testBreathVisit()

QueueTest.testPriorityQueue()

_TreeTests.testVerifySquenceOfBST()

_TreeTests.testFindPath()

_TreeTests.testDepth()

ListNodeTests.testCloneRandomListNode()

print("Add(5, 70)=\(NumberAlgorithm.add(5, 70))")


let numbers = [123, 42, 123, 56, 42, 89, 56, 100]
let res = ArrayAlgorithm.findNumsAppearOnce(numbers: numbers)
print("findNumsAppearOnce<\(numbers)>: \(res)")

print("multiply:\(ArrayAlgorithm.multiply(A: [1, 2, 3, 4, 5]))")

print("cut rope(10): \(SomeAlgorithms.cutRope(target: 10))")

var num1 = 234
var num2 = 564
print("swap \(num1) \(num2):")
NumberAlgorithm.swap(num1: &num1, num2: &num2)
print("\(num1), \(num2)")

print(StackAlgorithm.isPopOrder(pushOrders: [1, 2, 3, 4, 5], popOrders: [4, 3, 5, 1, 2]))

print("\(StringAlgorithm.isNumeric(of: ""))")
print(".1:\(StringAlgorithm.isNumeric(of: ".1"))")
print("+.1:\(StringAlgorithm.isNumeric(of: "+.1"))")
print("+100:\(StringAlgorithm.isNumeric(of: "+100"))")
print("5e2:\(StringAlgorithm.isNumeric(of: "5e2"))")
print("-123:\(StringAlgorithm.isNumeric(of: "-123"))")
print("3.14159:\(StringAlgorithm.isNumeric(of: "3.14159"))")
print("-1E-16:\(StringAlgorithm.isNumeric(of: "-1E-16"))")
print("12e:\(StringAlgorithm.isNumeric(of: "12e"))")
print("1a3.14:\(StringAlgorithm.isNumeric(of: "1a3.14"))")
print("+-5:\(StringAlgorithm.isNumeric(of: "+-5"))")
print("12e+4.3:\(StringAlgorithm.isNumeric(of: "12e+4.3"))")

let tree = TreeAlgorithm.reConstructBinaryTree(preOrders: [1, 2, 4, 7, 3, 5, 6, 8], inOrders: [4, 7, 2, 1, 5, 3, 8, 6])
print(tree!)

ArrayAlgorithm.findAppearCount(of: 3, inSortedArray: [3])

ArrayAlgorithm.twoNumbersWith(sum: 15, inSortedArray: [1, 2, 4, 7, 11, 15])

ListNodeAlgorithm.lastRemaining(n: 0, m: 0)

print(ArrayAlgorithm.isContinuous([1, 3, 2, 6, 4]))

print("leftRotate<abcd, 2>: \(StringAlgorithm.leftRotateString("abcd", n: 2))")

print(ArrayAlgorithm.moreThanHalfItemIn(array: [1, 2, 2, 4, 5, 3, 2, 2, 2, 2]))

print(NumberAlgorithm.findContinuousSequence(for: 100))

print(ArrayAlgorithm.findGreatestSumOfSubArray(array: [6, -3, -2, 7, -15, 1, 2, 2]))

_TreeTests.testIsSymmetric()

_TreeTests.testConvert()

print(NumberAlgorithm.numberOf1ToBinary(n: -2313))

ListNodeTests.testDeleteDuplicateNodeInSortedLinkedList()

print(StringAlgorithm.permutation(ofString: "abcd"))

print(ArrayAlgorithm.getKLeastNumbers(array: [4, 5, 1, 6, 2, 7, 3, 8], k: 4))

print(StringAlgorithm.firstNotRepeatingChar(str: "abcdacd"))

print(ArrayAlgorithm.printMinConbinatedNumber(numbers: [3, 32, 321]))

print(NumberAlgorithm.getUglyNumber(index: 6))

print(StringAlgorithm.reverseSentence(str: "  "))

print(StringAlgorithm.stringToInt(str: "1234"))

_TreeTests.testSerialize()

_TreeTests.testKthNodeOfBinarySearchTree()

print(ArrayAlgorithm.maxNumbersOfWindows(numbers: [2, 3, 4, 2, 6, 2, 5, 1], windowSize: 3))

_TreeTests.testPrintZStyle()


SearchAlgorithmTest.testStringExist()

SearchAlgorithmTest.testMovingCount()

print(ArrayAlgorithm.spiralOrder(matrix: [[1, 2, 3, 4],
                                          [5, 6, 7, 8],
                                          [9, 10, 11, 12],
                                          [13, 14, 15, 16]]))

print(ArrayAlgorithm.inversePairs(of: [1, 2, 4, 3, 0]))


print(DynamicAlgorithm.coinChange(coins: [1, 2, 5], amount: 11))

print(DynamicAlgorithm.findTargetSumWays(nums: [1, 1, 1, 1, 1], target: 3))

let dic = LWHDictionary()
dic.insert("Hello" as NSObjectProtocol, forKey: "asdfsdf" as NSObjectProtocol)
dic.insert("gogo" as NSObjectProtocol, forKey: "asdfsdf" as NSObjectProtocol)
dic.insert("lala" as NSObjectProtocol, forKey: "hahaha" as NSObjectProtocol)
print(dic.getObjectWith("asdfsdf" as NSObjectProtocol))
print(dic.getObjectWith("hahaha" as NSObjectProtocol))


_TreeTests.testTrieTree()
