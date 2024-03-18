class Solution {
    func resultArray(_ nums: [Int]) -> [Int] {
        var arr1 = [Int]()
        var arr2 = [Int]()
        var res1 = [Int]()
        var res2 = [Int]()
        arr1.append(nums[0])
        arr2.append(nums[1])
        res1.append(nums[0])
        res2.append(nums[1])

        for i in 2..<nums.count {
            let gc1 = greaterCount(arr1, nums[i])
            let gc2 = greaterCount(arr2, nums[i])
            if gc1 > gc2 || (gc1 == gc2 && arr1.count <= arr2.count) {
                let idx = binarySearch(arr1, nums[i])
                arr1.insert(nums[i], at: idx)
                res1.append(nums[i])
            }
            else {
                let idx = binarySearch(arr2, nums[i])
                arr2.insert(nums[i], at: idx)
                res2.append(nums[i])
            }
        }
        return res1 + res2
    }

    func greaterCount(_ arr: [Int],_ k: Int) -> Int {
        var arr = arr
        var res = 0

        return arr.count - binarySearch(arr, k)
    }

    func binarySearch(_ arr: [Int],_ t: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        var res = arr.count

        while(left <= right) {
            let mid = (left+right) / 2
            if arr[mid] > t {
                res = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return res
    }
}
