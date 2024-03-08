class Solution {
    var memo = [[Int]]()

    func numTrees(_ n: Int) -> Int {
        memo = Array(repeating: Array(repeating: 0,count: n+1) ,count: n+1)
        return count(1, n)
    }

    func count(_ lo: Int,_ hi: Int) -> Int {
        if (lo > hi) { return 1 }
        if memo[lo][hi] != 0 { return memo[lo][hi] }

        var res = 0
        for i in lo...hi {
            var left = count(lo, i-1)
            var right = count(i+1, hi)
            res += left * right
        }
        memo[lo][hi] = res
        return res
    }
}
