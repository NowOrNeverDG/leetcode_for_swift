
class Solution {
    func sortTransformedArray(_ nums: [Int], _ a: Int, _ b: Int, _ c: Int) -> [Int] {
        var p1 = 0
        var p2 = nums.count - 1
        var p = a > 0 ? nums.count - 1 : 0
        var res = Array(repeating: 0, count: nums.count)

        while(p1 <= p2) {
            let sum1 = f(nums[p1], a, b, c)
            let sum2 = f(nums[p2], a, b, c)

            if a > 0 {
                if  sum1 > sum2 {
                    res[p] = sum1
                    p1 += 1
                } else {
                    res[p] = sum2
                    p2 -= 1
                }
                p -= 1
            }
            else {
                if sum1 > sum2 {
                    res[p] = sum2
                    p2 -= 1
                } else {
                    res[p] = sum1
                    p1 += 1
                }
                p += 1
            }
        }
        return res
    }

    func f(_ no: Int,_ a: Int,_ b: Int,_ c: Int) -> Int {
        return a * no * no + b * no + c
    }
}
