class NumArray {
    private var sol = [Int]()
    init(_ nums: [Int]) {
        self.sol = Array(repeating: Int.min, count:nums.count)
        sol[0] = nums[0]
        for i in 1..<sol.count {
            sol[i] = nums[i] + sol[i-1]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        if left == 0 {
            return sol[right]
        }
        else {
            return sol[right] - sol[left-1]
        }
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
