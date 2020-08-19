//
//  main.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/4.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

let cache = LRUCache(2)

print("LURCace start")
print(cache.get(2))
print(cache.get(2))

cache.put(2, 6)
print(cache.get(1))
cache.put(1, 5)
cache.put(1, 2)
print(cache.get(1))
print(cache.get(2))

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
print("GreedyMoney:\(GreedyMoney.solve(money: 456, moneyMaps: moneyMaps))")

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

print("DuplicateNumber: \(DuplicateNumber.duplicateNumber(at: [0, 3, 2, 4, 1, 2]) ?? -1)")

let base: Double = -2
let exponent: Int = -3
print("PowAlgorithm.pow(\(base), \(exponent))=\(PowAlgorithm.pow(base: base, exponent: exponent))")


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

print("Add(5, 70)=\(SomeAlgorithms.add(5, 70))")


let numbers = [123, 42, 123, 56, 42, 89, 56, 100]
let res = SomeAlgorithms.findNumsAppearOnce(numbers: numbers)
print("findNumsAppearOnce<\(numbers)>: \(res)")

print("multiply:\(SomeAlgorithms.multiply(A: [1, 2, 3, 4, 5]))")

print("cut rope(10): \(SomeAlgorithms.cutRope(target: 10))")

var num1 = 234
var num2 = 564
print("swap \(num1) \(num2):")
SomeAlgorithms.swap(num1: &num1, num2: &num2)
print("\(num1), \(num2)")

print(StackAlgorithm.isPopOrder(pushOrders: [1, 2, 3, 4, 5], popOrders: [4, 3, 5, 1, 2]))

print("\(ExpressionAlgorithms.isNumeric(of: ""))")
print(".1:\(ExpressionAlgorithms.isNumeric(of: ".1"))")
print("+.1:\(ExpressionAlgorithms.isNumeric(of: "+.1"))")
print("+100:\(ExpressionAlgorithms.isNumeric(of: "+100"))")
print("5e2:\(ExpressionAlgorithms.isNumeric(of: "5e2"))")
print("-123:\(ExpressionAlgorithms.isNumeric(of: "-123"))")
print("3.14159:\(ExpressionAlgorithms.isNumeric(of: "3.14159"))")
print("-1E-16:\(ExpressionAlgorithms.isNumeric(of: "-1E-16"))")
print("12e:\(ExpressionAlgorithms.isNumeric(of: "12e"))")
print("1a3.14:\(ExpressionAlgorithms.isNumeric(of: "1a3.14"))")
print("+-5:\(ExpressionAlgorithms.isNumeric(of: "+-5"))")
print("12e+4.3:\(ExpressionAlgorithms.isNumeric(of: "12e+4.3"))")

let tree = TreeAlgorithm.reConstructBinaryTree(preOrders: [1, 2, 4, 7, 3, 5, 6, 8], inOrders: [4, 7, 2, 1, 5, 3, 8, 6])
print(tree!)

ArrayAlgorithm.findAppearCount(of: 3, inSortedArray: [3])

ArrayAlgorithm.twoNumbersWith(sum: 15, inSortedArray: [1, 2, 4, 7, 11, 15])

ListNodeAlgorithm.lastRemaining(n: 0, m: 0)

print(ArrayAlgorithm.isContinuous([1, 3, 2, 6, 4]))

print("leftRotate<abcd, 2>: \(StringAlgorithm.leftRotateString("abcd", n: 2))")

print(ArrayAlgorithm.moreThanHalfItemIn(array: [1, 2, 2, 4, 5, 3, 2, 2, 2, 2]))

print(SomeAlgorithms.findContinuousSequence(for: 100))

print(ArrayAlgorithm.findGreatestSumOfSubArray(array: [6, -3, -2, 7, -15, 1, 2, 2]))

_TreeTests.testIsSymmetric()

_TreeTests.testConvert()

print(SomeAlgorithms.numberOf1ToBinary(n: -2313))

ListNodeTests.testDeleteDuplicateNodeInSortedLinkedList()

print(StringAlgorithm.permutation(ofString: "abcd"))

print(ArrayAlgorithm.getKLeastNumbers(array: [4, 5, 1, 6, 2, 7, 3, 8], k: 4))
