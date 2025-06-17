class Solution {
    func mySqrt(_ x: Int) -> Int {
        var lft = 0
        var rgt = x + 1

        while(lft + 1 < rgt) {
            var m = (lft + rgt) / 2
            if m * m <= x {
                lft = m
            } else {
                rgt = m
            }
        }
        return lft
    }
}
