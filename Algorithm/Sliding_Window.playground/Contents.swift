import UIKit
import Darwin
//1438. Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit
//Input: nums = [8,2,4,7], limit = 4
//Output: 2
func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
    var minDeque = [Int]()
    var maxDeque = [Int]()

    var head = 0
    var length = 0

    for tail in 0..<nums.count {
        while (!minDeque.isEmpty && nums[minDeque.last!] > nums[tail]) {
            minDeque.removeLast()
        }
        
        while (!maxDeque.isEmpty && nums[maxDeque.last!] < nums[tail]) {
            maxDeque.removeLast()
        }
        minDeque.append(tail)
        maxDeque.append(tail)
        
        while (!maxDeque.isEmpty && !minDeque.isEmpty && nums[maxDeque.first!] - nums[minDeque.first!] > limit ) {
            if maxDeque.first! == head {maxDeque.removeFirst()}
            if minDeque.first! == head {minDeque.removeFirst()}
            head += 1
        }
        length = max(length, tail-head+1)
    }
    return length
    }
longestSubarray([8,2,4,7], 4)
