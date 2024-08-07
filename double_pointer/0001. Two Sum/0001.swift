class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numsIdx = [[Int]]()
        for i in 0..<nums.count {
            numsIdx.append([i,nums[i]])
        }
        numsIdx = numsIdx.sorted { $0[1] < $1[1] }

        var lft = 0
        var rgt = nums.count - 1

        while(lft < rgt) {
            if numsIdx[lft][1] + numsIdx[rgt][1] < target {
                lft += 1
            }
            else if numsIdx[lft][1] + numsIdx[rgt][1] > target {
                rgt -= 1
            }
            else {
                return [numsIdx[lft][0], numsIdx[rgt][0]]
            }
        }
        return []
    }
}
