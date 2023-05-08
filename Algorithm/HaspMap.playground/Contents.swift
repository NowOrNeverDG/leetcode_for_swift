import UIKit

//169. Majority Element
//Input: nums = [3,2,3]
//Output: 3
func majorityElement(_ nums: [Int]) -> Int {
    var map = [Int: Int]()
    for i in nums {
        map[i, default: 0] += 1
    }
    
    var max = 0
    var result = -1
    for pair in map {
        if pair.value > max {
            max = pair.value
            result = pair.key
        }
    }
    return result
}
