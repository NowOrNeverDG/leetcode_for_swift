class Solution {
    func matrixBlockSum(_ mat: [[Int]], _ k: Int) -> [[Int]] {
        let row = mat.count
        let col = mat[0].count
        var dp = Array(repeating: Array(repeating: 0, count: col+1),count:row+1)
        //set up prefix sum matrix
        for i in 0..<row {
            for j in 0..<col {
                dp[i+1][j+1] = mat[i][j] + dp[i][j+1] + dp[i+1][j] - dp[i][j]
            }
        }

        var res = Array(repeating: Array(repeating: 0, count: col),count:row)
        for i in 0..<row {
            for j in 0..<col {
                let leftR = i-k>=0 ? i-k : 0
                let leftC = j - k >= 0 ? j - k : 0
                let rightR = i + k < row ? i + k : row - 1
                let rightC = j + k < col ? j + k : col - 1

                res[i][j] = dp[rightR+1][rightC+1] - dp[rightR+1][leftC] - dp[leftR][rightC+1] + dp[leftR][leftC]
            }
        }
        return res
    }
}
