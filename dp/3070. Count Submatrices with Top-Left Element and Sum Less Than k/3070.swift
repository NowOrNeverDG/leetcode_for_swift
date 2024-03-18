class Solution {
    func countSubmatrices(_ grid: [[Int]], _ k: Int) -> Int {
        if grid[0][0] > k { return 0 }
        let r = grid.count
        let c = grid[0].count
        var res = 0

        var memo = Array(repeating: Array(repeating:0, count: c), count: r)
        memo[0][0] = grid[0][0]
        for i in 0..<r {
            for j in 0..<c {
                if i == 0 && j == 0 {}
                else if i == 0 { memo[i][j] = memo[i][j-1] + grid[i][j] }
                else if j == 0 { memo[i][j] = memo[i-1][j] + grid[i][j] }
                else {
                    memo[i][j] = memo[i][j-1] + memo[i-1][j] + grid[i][j] - memo[i-1][j-1]
                }

                if memo[i][j] <= k {
                    res += 1
                } else {
                    break
                }
            }
        }
        return res
    }
}
