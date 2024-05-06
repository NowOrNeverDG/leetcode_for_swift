class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var left = 0
        var right = 0
        while (right < nums.count) {
            if nums[left] != nums[right] {
                left += 1
                nums.swapAt(left, right)
            }
            right += 1
        }
        return left + 1
    }
}

