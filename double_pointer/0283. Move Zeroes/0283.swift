class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var left = 0
        var right = 0

        while(right < nums.count) {
            if nums[right] != 0 {
                nums.swapAt(left, right)
                left += 1
            }
            right += 1
        }
    }
}
