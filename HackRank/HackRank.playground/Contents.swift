import UIKit
import Foundation
//input 1
//for loop how many 1 in input & how many 2 in input
//combine count of 1 and "1" + count of 2 and 2
//append combine into a array
// In mathematics, the look-and-say sequence is the sequence of integers beginning as follows:
// 1, 11, 21, 1211, 111221, 312211 ...

// To generate a member of the sequence from the previous member, read off the digits of the previous member, counting the number of digits in groups of the same digit. For example:
// 1 is read off as "one 1" or 11.
// 11 is read off as "two 1s" or 21.
// 21 is read off as "one 2, then one 1" or 1211.
// 1211 is read off as "one 1, then one 2, then two 1s" or 111221.
// 111221 is read off as "three 1s, then two 2s, then one 1" or 312211.

// Write a function getLines, which takes an integer "n" as parameter, and returns a comma separated list of the first "n" terms of the sequence. For 0, negative, or NaN parameters, -1 shall be returned.

// Example:
// n=4; output: “1, 11, 21, 1211”
// n=2; output: “1, 11”
// n=1; output: “1”
func gernerateSeq(input:Int) -> [String] {
    var result:[String] = ["1"]
    var input = input
    var tmp = "1"
    while (input != 1){
        var str = ""
        input -= 1
        while (tmp.count != 0) {
            var tmpLast = tmp.removeLast()
            var count = 1
            while (tmp.last != nil && tmp.last == tmpLast) {
                count += 1
                tmpLast = tmp.removeLast()
            }
            str = "\(count)" + String(describing: tmpLast) + str
            print(str)
        }
        result.append(str)
        tmp = str
    }
    return result
}

//Prime Order Priortization
//Amazon is planning to release a new order prioritization algorithm to optimize fulfilling Prime deliveries on time. All orders (Prime or otherwise) are given an alphanumeric ID code. However, Prime orders are given additional metadata that consists of a space-delimited list of lowercase English letters, whereas non-Prime orders are given metadata that consists only of a space-delimited string of positive integers. Each order is therefore defined as their alphanumeric id code, followed by a space, followed by their space-delimited metadata.
//You have been tasked with sorting a list of all orders in the order queue to assist in prioritization of fulfillment. They should be sorted according to the following order:
//1. The Prime orders should be returned first, sorted by lexicographic sort of the alphabetic metadata.
//2. Only in the case of ties, the identifier should be used as a backup sort.
//3. The remaining non-Prime orders must all come after, in the original order they were given in the input.
//Write a function or method to return a list of strings representing the correctlyprioritized orders according to this system.
//Output:Return a list of strings representing the correctly prioritized orders according to this system
//Constraints Os number of orders $ 103
//Note
//The order identifier consists of only lower case English characters and numbers. Sorting for tiebreaks should use ASCII value - as an example, the order identifier 'a1' should come before the order identifier 'aa'
//Examples
/*
Input: orderList=
[zld 93 12]
[fp kindle book]
[10a echo show]
[17g 12 25 6]
[ab1 kindle book]
[125 echo dot second generation]
*//*
Output;
[125 echo dot second generation]
[10a echo show]
[ab1 kindle book]
[fp kindle book]
[zld 93 12]
[17g 12 25 6]
*/
func primeOrderPriortization(input:[String]) -> [String] {
    //detect non-prime and move them to a specific array
    //sort remain element
    var input = input
    var nonPrimeArr:[String] = []
    for i in 0..<input.count {
        let splitInput = input.split(separator: " ")
        let scanner = Scanner(string: String(describing: splitInput[1]))
        if scanner.scanInt() != nil {
            nonPrimeArr.append(input.remove(at: i))
        }
    }
    return []
}

//Output: Return a list of pairs of integers representing the pairs of IDs of forward and return shipping routes that optimally utilize the given aircraft. If no route is possible, return a list with empty pair.
/*Example 1:
Input:
maxTravelDist = 7000
forwardRouteList = [[1,2000],[2, 4000],
[3,6000]]
returnRouteList=[1,2000]]
Output:
[2,1]
Explanation:
There are any, When amaratiaraFabbo,
6000, and 8000 miles, respectively. Since
6000 is the largest use that does not
exceed 7000, [2,1] is the only optimal pair.
*//*
Example 2:
Input:
maxTravelDist=10000
forwardRouteList = [1, 3000], [2, 5000], [3,
7000], [4, 10000]]
returnRouteList = [1, 2000], [2, 3000], [3,
4000], [4, 5000]]
Output: [2, 4], [3, 21]
Explanation:
There are two pairs of forward and return shipping routes possible that optimally utilizes the given aircraft. Shipping Route ID2 from the forwardShippingRouteList requires 5000 miles travelled, and Shipping Route ID#4 from returnShippingRouteList also requires 5000 miles travelled. Combined, they add up to 10000 miles travelled. Similarly, Shipping Route ID#3 from forwardShippingRouteList requires 7000 miles travelled, and Shipping Route ID#2 from returnShippingRouteList requires 3000 miles travelled. These also add up to 10000 miles travelled. Therefore, the pairs of forward and return shipping routes that optimally utilize the aircraft are [2, 4] and [3, 2].
*/



func predictDays(day: [Int], k: Int) -> [Int] {
    let n = day.count
    var left = Array(repeating: 0, count: n)
    var right = Array(repeating: 0, count: n)
    
    for i in 1..<n {
        if day[i] <= day[i-1] {
            left[i] = left[i-1]
        }else {
            left[i] = i
        }
    }
    
    right[n-1] = n-1
    
    for i in 0...n-2 {
        if day[n-2-i] <= day[n-2-i+1] {
                right[n-2-i] = right[n-2-i+1]
            }else {
                right[n-2-i] = n-2-i
            }
    }
    
    var result = [Int]()
    for i in k..<n-k {
        if i - left[i] >= k && right[i]-i >= k {
            result.append(i+1)
        }

    }
    return result
}
