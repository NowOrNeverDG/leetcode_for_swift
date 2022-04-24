import UIKit
import Darwin

//91. Decode Ways
//Input: s = "12"
//Output: 2
func numDecodings(_ s: String) -> Int {
    let sArr = Array(s)
    var memo = Array(repeating: 0, count: sArr.count+1)
    memo[1] = 1
    
    for i in 2..<memo.count {
        if sArr[i-1] == "1" || sArr[i-1] == "2"{
            memo[i] = memo[i-1]+2
        }else {
            memo[i] = memo[i-1]+1
        }
    }
    return memo.last!
}
numDecodings("226")
//303. Range Sum Query
//Input:["NumArray", "sumRange", "sumRange", "sumRange"],[[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
//Output: [null, 1, -1, -3]


//279. Perfect Squares
//Input: n = 12
//Output: 3

//343. Integer Break
//Input: n = 2
//Output: 1
func integerBreak1(_ n: Int) -> Int {
    var memo = Array(repeating: 0, count: n+1)
    memo[1] = 1
    for i in 2...n {
        for j in 1..<i {
            memo[i] = max((i-j)*j,memo[i-j]*j,(i-j)*memo[j], memo[i-j]*memo[j],memo[i])
        }
    }
    return memo[n]
}
func integerBreak(_ n: Int) -> Int {
    var dic = [Int:Int]()
    dic[1] = 1

    func backtracking(no:Int) -> Int {
        if let val = dic[n] { return val }
        
        var result = 0
        for i in 0..<no {
            result = max(backtracking(no: i), result )
        }
        dic[no] = result
        return result
    }
    
    return backtracking(no: n)
}

//70. Climbing Stairs
//Input: n = 2
//Output: 2
func climbStairs(_ n: Int) -> Int {
    if n == 1 {return 1}
    if n == 2 {return 2}
    
    var memo = Array(repeating: 0, count: n)
    memo[0] = 1
    memo[1] = 2
    for i in 2..<n {
        memo[i] = memo[i-1] + memo[i-2]
    }
    return memo.last!
}

//198. House Robber
//Input: nums = [1,2,3,1]
//Output: 4
func rob(_ nums: [Int]) -> Int {
    let n = nums.count
    if nums.count == 1 {return nums[0]}
    if nums.count == 2 {return max(nums[0], nums[1])}
    var memo = Array(repeating: 0, count: n)
    memo[0] = nums[0]
    memo[1] = max(nums[0], nums[1])
    for i in 2..<n {
        memo[i] = max(memo[i-1], memo[i-2]+nums[i])
    }
    print(memo)
    return memo.last!
}

//213. House Robber II
//Input: nums = [2,3,2]
//Output: 3
func rob2(_ nums: [Int]) -> Int {
    let n = nums.count
    if nums.count == 1 {return nums[0]}
    if nums.count == 2 {return max(nums[0], nums[1])}
    if nums.count == 3 {return max(nums[0], nums[1],nums[2])}
    var memo1 = Array(repeating: 0, count: n-1)
    memo1[0] = nums[1]
    memo1[1] = max(nums[1], nums[2])
    var memo2 = Array(repeating: 0, count: n-1)
    memo2[0] = nums[0]
    memo2[1] = max(nums[0], nums[1])
    
    for i in 2..<n-1 {
        memo1[i] = max(memo1[i-1], memo1[i-2] + nums[i+1])
        memo2[i] = max(memo2[i-1], memo2[i-2] + nums[i])
    }
    return max(memo1.last!, memo2.last!)
}

/// GRID
//64. Minimum Path Sum
//Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
//Output: 7
func minPathSum(_ grid: [[Int]]) -> Int {
    let rows = grid.count
    let columns = grid[0].count
    var memo = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)

    for i in (0..<rows).reversed() {
        for j in (0..<columns).reversed() {
            if i == rows-1 && j == columns-1 {
                memo[i][j] = grid[i][j]
                continue
            }
            else if i == rows - 1 {
                memo[i][j] = grid[i][j] + memo[i][j+1]
            }
            else if j == columns - 1 {
                memo[i][j] = grid[i][j] + memo[i+1][j]
            } else {
                memo[i][j] = grid[i][j] + min(memo[i+1][j], memo[i][j+1])
            }
        }
    }
    return memo[0][0]
}
minPathSum([[1,3,1],[1,5,1],[4,2,1]])

//62. Unique Paths
//Input: m = 3, n = 7
//Output: 28
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var memo = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in (0..<m).reversed() {
        for j in (0..<n).reversed() {
            if i == m-1 || j == n-1 {
                memo[i][j] = 1
            } else {
                memo[i][j] = memo[i+1][j] + memo[i][j+1]
            }
        }
    }
    return memo[0][0]
}

//413. Arithmetic Slices
//Input: nums = [1,2,3,4]
//Output: 3
func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
    let n = nums.count
    if n <= 2 {return 0}
    var memo = Array(repeating: 0, count: n)
    var total = 0
    for i in 2..<n {
        if nums[i] - nums[i-1] == nums[i-1] - nums[i-2] {
            memo[i] = memo[i-1] + 1
            total += memo[i]

        }
    }
    return total
}

//174. Dungeon Game
//Input: dungeon = [[-2,-3,3],[-5,-10,1],[10,30,-5]]
//Output: 7
func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
    let rows  = dungeon.count
    let columns = dungeon[0].count
    var memo = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    
    for i in (0..<rows).reversed() {
        for j in (0..<columns).reversed() {
            var tmp = 0
            if i == rows - 1 && j == columns - 1 {
                tmp = 1 - dungeon[i][j]
            } else if i == rows - 1 {
                tmp = memo[i][j+1] - dungeon[i][j]
            } else if j == columns - 1 {
                tmp = memo[i+1][j] - dungeon[i][j]
            } else {
                tmp = min(memo[i][j+1], memo[i+1][j]) - dungeon[i][j]
            }
            if tmp <= 0 {tmp = 1}
            memo[i][j] = tmp
        }
    }
    return memo[0][0]
}
