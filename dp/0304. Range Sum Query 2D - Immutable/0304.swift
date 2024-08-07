class NumMatrix {
    var dp = [[Int]]()
    var matrix = [[Int]]()

    init(_ matrix: [[Int]]) {
        self.matrix = matrix
        dp = Array(repeating: Array(repeating: 0, count:matrix[0].count+1), count: matrix.count+1)
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                    dp[i+1][j+1] = dp[i+1][j] + dp[i][j+1] - dp[i][j] + matrix[i][j]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return dp[row2+1][col2+1] - dp[row1][col2+1] - dp[row2+1][col1] + dp[row1][col1]
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
