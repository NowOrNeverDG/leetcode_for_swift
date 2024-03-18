class Solution {
    func resultArray(_ nums: [Int]) -> [Int] {
        var arr1:[Int] = [nums[0]]
        var arr2:[Int] = [nums[1]]
        
        for i in 2..<nums.count {
            if arr1.last! > arr2.last! {
                arr1.append(nums[i])
            } else {
                arr2.append(nums[i])
            }
        }
        
        return arr1 + arr2
    }
}
