class Solution {
    func findGCD(_ nums: [Int]) -> Int {
        var mi = Int.max
        var ma = Int.min
        for i in nums {
            ma = max(ma,i)
            mi = min(mi,i)
        }
        return gcd(mi,ma)
    }

    func gcd(_ miNo: Int,_ maNo: Int) -> Int {
        let remain = maNo % miNo
        return remain == 0 ? miNo: gcd(remain, miNo)
    }
}
