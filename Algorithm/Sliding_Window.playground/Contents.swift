import UIKit
import Darwin
//1438. Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit
//Input: nums = [8,2,4,7], limit = 4
//Output: 2
func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
    if nums.count == 0 {return 0}
    var head = 0
    var tail = 0
    
    var minV = -1
    var maxV = -1
    var length = 0
    while (head < nums.count) {
        minV = min(minV, nums[head], nums[tail])
        maxV = max(maxV, nums[head], nums[tail])
        
        if maxV - minV > limit {
            head += 1
        } else {
            length = max(length, tail-head)
        }
        tail += 1
    }
    
    func absoluteValue(first: Int, second: Int) -> Int{
        let res = first - second
        return res < 0 ? -res : res
    }
    return length
}
longestSubarray([8,2,4,7], 4)
