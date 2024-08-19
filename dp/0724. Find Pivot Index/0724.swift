class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let n = nums.count
        var dpLeft = Array(repeating: Int.min, count: n)
        for i in 0..<n {
            if i == 0 { dpLeft[i] = nums[0] }
            else {
                dpLeft[i] = dpLeft[i-1] + nums[i]

            }
        }

        var dpRigt = Array(repeating: Int.min, count: n)
        for i in (0..<n).reversed() {
            if i == n - 1 { dpRigt[i] = nums[i] }
            else {
                dpRigt[i] = dpRigt[i+1] + nums[i]
            }
        }
        
        for i in 0..<n {
            if dpLeft[i] == dpRigt[i] {
                return i
            }
        }
        return -1
    }
}
