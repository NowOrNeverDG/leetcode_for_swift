import UIKit

func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
    guard dungeon.count > 0 else {
        return 1
    }
    
    let rows = dungeon.count
    let columns = dungeon[0].count
    
    var dp = Array(repeating: Array(repeating: 0, count: columns), count: rows)

    // Setup min value to enter before princess (P) Cell
    dp[rows-1][columns-1] = max(1 - dungeon[rows-1][columns-1], 1)
    
    // Setting last column value
    for i in (0...rows-2).reversed() {
        dp[i][columns-1] = max(dp[i+1][columns-1] - dungeon[i][columns-1], 1)
    }

    // Setting last rows value
    for j in (0...columns-2).reversed() {
        dp[rows-1][j] = max(dp[rows-1][j+1] - dungeon[rows-1][j], 1)
    }

    // Setting remaining cells
    for i in (0...rows-2).reversed() {
        for j in (0...columns-2).reversed() {
            dp[i][j] = max(min(dp[i+1][j],dp[i][j+1]) - dungeon[i][j], 1)
        }
    }
    return dp.first!.first!
}
calculateMinimumHP([[-2,-3,3],[-5,-10,1],[10,30,-5]]) // 7


