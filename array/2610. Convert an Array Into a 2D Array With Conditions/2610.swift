class Solution {
    func findMatrix(_ nums: [Int]) -> [[Int]] {
        if nums.count <= 1 { return [nums] }
        var freq = [Int:Int]()
        var ans = [[Int]]()
        
        for i in 0..<nums.count {
            let current = freq[nums[i], default: .zero]

            if current == ans.count {
                ans.append([])
            }
            ans[current].append(nums[i])
            freq[nums[i]] = current + 1
        }
        return ans
    }
}
