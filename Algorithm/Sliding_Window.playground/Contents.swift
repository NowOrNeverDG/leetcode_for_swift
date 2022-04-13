import UIKit
import Darwin
//1438. Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit
//Input: nums = [8,2,4,7], limit = 4
//Output: 2
func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
    if nums.count == 0 {return 0}
    var head = 0
    var tail = 1
    
    var minV = -1
    var maxV = -1
    var length = 0
    while (head < nums.count && tail < nums.count) {
        if abs(nums[head] - nums[tail]) > 4 {
            tail += 1
            head = tail-1
        } else {
            if tail-1 == head {
                maxV = max[nums[head],nums[tail]
                minV = min[nums[head],nums[tail]
                tail += 1
            }
                           minV = min(minV,nums[tail])
                           maxV = max(maxV, nums[tail])
                           length = tail - head
                           tail += 1
        }
    }
    return length
}
longestSubarray([8,2,4,7], 4)
