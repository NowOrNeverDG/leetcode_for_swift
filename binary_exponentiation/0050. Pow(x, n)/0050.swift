class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var ans = 1.0
        var n = n
        var x = x

        if n < 0 {
            n = -n
            x = 1 / x
        }

        while ( n != 0 ) {
            if n & 1 == 1 {
                ans *= x
            }

            x *= x
            n >>= 1
        }
        return ans
    }
}

