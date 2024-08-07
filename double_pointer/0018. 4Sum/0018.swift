class Solution {
    var res = [[Int]]()
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 { return [] }
        var nums = nums.sorted()
        for i in 0..<nums.count-3 {
            // Skip duplicate elements for i
            if i > 0 && nums[i] == nums[i - 1] { continue }
            for j in i+1..<nums.count-2 {
                // Skip duplicate elements for j
                if j > i + 1 && nums[j] == nums[j - 1] { continue }
                twoSum(nums, i, j, target-nums[i]-nums[j])
            }
        }
        return res
    }

    func twoSum(_ nums: [Int],_ fstIdx: Int,_ sndIdx: Int,_ target: Int) {
        var lft = sndIdx + 1
        var rgt = nums.count - 1

        while(lft < rgt) {
            if nums[lft] + nums[rgt] == target {
                res.append([nums[fstIdx], nums[sndIdx], nums[lft], nums[rgt]])
                // Skip duplicate elements for lft and rgt
                repeat { lft += 1 } while lft < rgt && nums[lft] == nums[lft - 1]
                repeat { rgt -= 1 } while lft < rgt && nums[rgt] == nums[rgt + 1]
            }
            else if nums[lft] + nums[rgt] < target {
                lft += 1
            }
            else {
                rgt -= 1
            }
        }
    }
}

