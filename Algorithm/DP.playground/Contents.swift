import UIKit
import Darwin//123 139
//650. 2 Keys Keyboard
//Input: n = 3
//Output: 3
func minSteps(_ n: Int) -> Int {
    if n == 0 { return 0 }
    var dp = Array(repeating: 0, count: n+1)
    let base = Int(sqrt(Double(n)))
    for i in 2...n {
        dp[i] = i
        for j in 2...base {
            if i % j == 0 {
                dp[i] = dp[j] + dp[i/j]
                break
            }
        }
    }
    return dp[n]
}



//72. Edit Distance
//Input: word1 = "horse", word2 = "ros"
//Output: 3
func minDistance(_ word1: String, _ word2: String) -> Int {
    
    let m = word1.count
    let n = word2.count
    let word1Arr = Array(word1)
    let word2Arr = Array(word2)
    var dp = Array(repeating: Array(repeating: Int.max, count: n+1), count: m+1)
    
    for i in 0...m {dp[i][0] = i}
    for i in 0...n {dp[0][i] = i}
    
    for i in 0...m {
        for j in 0...n {
            if word1Arr[i] == word2Arr[j] {
                dp[i][j] = dp[i-1][j-1]
            } else {
                
            }
        }
    }
    
}

//583. Delete Operation for Two Strings
//Input: word1 = "sea", word2 = "eat"
//Output: 2
func minDistance583(_ word1: String, _ word2: String) -> Int {
    let m = word1.count
    let n = word2.count
    let word1Arr = Array(word1)
    let word2Arr = Array(word2)
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    
    for i in 1...m {
        for j in 1...n {
            if word2Arr[j-1] != word1Arr[i-1] {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            } else {
                dp[i][j] = dp[i-1][j-1]+1
            }
        }
    }
    let shortest = dp[m][n]
    return (m-shortest) + (n-shortest)
}
//122. Best Time to Buy and Sell Stock II
//Input: prices = [7,1,5,3,6,4]
//Output: 7
func maxProfit10(_ prices: [Int]) -> Int {
    let len = prices.count
    
    var dp = Array(repeating: Array(repeating: 0, count: 2), count: len+1)
    
    dp[0][0] = 0
    dp[0][1] = Int.min
    
    for i in 1...len {
        dp[i][0] = max(dp[i-1][0], dp[i-1][1]+prices[i-1])
        dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i-1])
    }
    return dp[len][0]
}
maxProfit10([7,1,5,3,6,4])


//188. Best Time to Buy and Sell Stock IV
//Input: k = 2, prices = [2,4,1]
//Output: 2
func maxProfit10(_ k: Int, _ prices: [Int]) -> Int {
    let len = prices.count
    guard len > 1 && k > 0 else {return 0}

    var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: k+1), count: len+1)
    
    for nk in 0...k {
        dp[0][nk][0] = 0
        dp[0][nk][1] = Int.min
    }
    
    for i in 1...len {
        for nk in 1...k {
            dp[i][nk][0] = max(dp[i-1][nk][0], dp[i-1][nk-1][1]+prices[i-1])
            dp[i][nk][1] = max(dp[i-1][nk][1], dp[i-1][nk][0]-prices[i-1])
        }
    }
    return dp[len][k][0]
}



//123. Best Time to Buy and Sell Stock III？
//Input: prices = [3,3,5,0,0,3,1,4]
//Output: 6
func maxProfit(_ prices: [Int]) -> Int {
    let len = prices.count
    
    var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: 3), count: len+1)
    

    for nk in 0...2 {
        dp[0][nk][0] = 0
        dp[0][nk][1] = Int.min
    }
    for i in 1...len {
        for nk in 1...2 {
            dp[i][nk][0] = max(dp[i-1][nk][0], dp[i-1][nk][1]+prices[i-1])
            dp[i][nk][1] = max(dp[i-1][nk][1], dp[i-1][nk-1][0]-prices[i-1])
        }
    }
    return dp[len][2][0]
}


//714. Best Time to Buy and Sell Stock with Transaction Fee
//Input: prices = [1,3,2,8,4,9], fee = 2
//Output: 8
func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
    let len = prices.count
    
    var dp = Array(repeating: Array(repeating: 0, count: 2), count: len+1)
    
    dp[0][0] = 0
    dp[0][1] = Int.min
    dp[1][0] = 0
    dp[1][1] = -prices[0]
    
    guard len > 1 else { return 0 }
    for i in 2...len {
        dp[i][0] = max(dp[i-1][0], dp[i-1][1]+prices[i-1]-fee)
        dp[i][1] = max(dp[i-1][1], dp[i-1][0]-prices[i-1])
    }
    return dp[len][0]
}


//309. Best Time to Buy and Sell Stock with Cooldown
//Input: prices = [1,2,3,0,2]
//Output: 3
func maxProfit(_ prices: [Int]) -> Int {
    let len = prices.count
    var dp = Array(repeating: Array(repeating: 0, count: 2), count: len+1)
    
    dp[0][0] = 0
    dp[0][1] = Int.min
    dp[1][0] = 0
    dp[1][1] = dp[0][0]-prices[0]
    guard len > 2 else {return dp[1][0]}
    
    for i in 2...len {
        dp[i][1] = max(dp[i-1][1], dp[i-2][0]-prices[i-1])
        dp[i][0] = max(dp[i-1][0], dp[i-1][1]+prices[i-1])
    }
    print(dp)
    return dp[len][0]
}
maxProfit([1,2,3,0,2])

//377. Combination Sum IV
//Input: nums = [1,2,3], target = 4
//Output: 7
//https://developer.apple.com/documentation/swift/int/&+=(_:_:)
func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
    let len = nums.count
    var dp = Array(repeating: 0, count: target+1)
    dp[0] = 1
    for i in 1...target {
        for j in 0..<len {
            guard nums[j] <= i else { continue }
            
            dp[i] &+= dp[i - nums[j]]
        }
    }
     return Int(dp[target])
}




//139. Word Break？
//Input: s = "leetcode", wordDict = ["leet","code"]
//Output: true
func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let len = s.count
    var dp = Array(repeating: false, count: len+1)
    
    for i in 1...len {
        for j in 0..<wordDict.count {
            let start = s.index(s.startIndex, offsetBy: i)
            let end = s.index(s.startIndex, offsetBy: i + wordDict[j].count)
            if wordDict[j].count <= i && wordDict[j] == s[start..<end] {
                dp[i] = dp[i] || dp[i-wordDict[j].count]
            }
        }
    }
    return dp[len]
}
wordBreak("leetcode", ["leet","code"])


//518. Coin Change 2
//Input: amount = 5, coins = [1,2,5]
//Output: 4
func change(_ amount: Int, _ coins: [Int]) -> Int {
    if amount == 0 || coins.count == 0 {return 0}
    
    var dp = Array(repeating: 0, count: amount+1)
    
    for coin in coins {
        if coin > amount {continue}
        for i in (coin...amount) {
            if i == coin {
                dp[i] = dp[i]+1
            } else if i > coin {
                dp[i] = dp[i] + dp[i-coin]
            }
        }
    }
    return dp[amount]
}

//322. Coin Change
//Input: coins = [1,2,5], amount = 11
//Output: 3
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    if coins.count == 0 || amount == 0 {return 0}
    var dp = Array(repeating: amount+1, count: amount+1)
    
    for coin in coins {
        for i in (coin...amount) {
            if i == coin { dp[i] = 1 }
            else if i > coin {
                dp[i] = min(dp[i], dp[i-coin]+1)
            }
        }
    }
    
    return dp[amount] == amount+1 ? -1 : dp[amount]
}
coinChange([1], 0)

//474. Ones and Zeroes
//Input: strs = ["10","0001","111001","1","0"], m = 5, n = 3
//Output: 4
func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
    let length = strs.count
    if length == 0 { return 0 }
    
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    
    for word in strs {
        let zeros = word.filter { char in
            char == "0"
        }.count
        let ones = word.filter { char in
            char == "1"
        }.count
        
        for i in (0..<m+1).reversed() {
            for j in (0..<n+1).reversed() {
                if i >= zeros && j >= ones {//[1,1]
                    dp[i][j] = max(dp[i][j], dp[i-zeros][j-ones]+1)
                }
            }
        }
    }
    return dp[m][n]
}
findMaxForm(["10","0001","111001","1","0"], 5, 3)

//494. Target Sum
//Input: nums = [1,1,1,1,1], target = 3
//Output: 5
func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    var total = 0
    for i in nums {
        total += i
    }
    if total >= abs(target) { return 0 }
    
    var count = nums.count
    var dp = Array(repeating: 0, count: total*2+1)
    var result = 0
    for i in 0..<count {
        for j in (0...total*2) {
            
        }
    }
    return result
}
findTargetSumWays([1,1,1,1,1], 3)


//416. Partition Equal Subset Sum
//Input: nums = [1,5,11,5]
//Output: true
func canPartition(_ nums: [Int]) -> Bool {
    var total = 0
    for i in nums {
        total += i
    }
    if total % 2 != 0 {return false}
    
    total = total/2
    var count = nums.count
    var dp = Array(repeating: 0, count: total+1)
    dp[0] = 0
    for i in 0..<count {
        for j in (1...total).reversed() {
            print(i)
            print(j)
            if j >= nums[i] {
                dp[j] = max(dp[j], dp[j-nums[i]]+nums[i])
            }
        }
    }
    return dp.last == total ? true : false
}
canPartition([1,5,11,5])

//1143. Longest Common Subsequence
//Input: text1 = "abcde", text2 = "ace"
//Output: 3
func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let n1 = text1.count
    let n2 = text2.count
    var dp = Array(repeating: Array(repeating: 0, count: n2+1), count: n1+1)
    let text1Arr:[Character] = Array(text1)
    let text2Arr:[Character] = Array(text2)
    
    for i in 1...n1 {
        for j in 1...n2 {
            if (text1Arr[i-1] == text2Arr[j-1]) {
                dp[i][j] = dp[i-1][j-1] + 1
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
    }
    return dp[n1][n2]
}

//376. Wiggle Subsequence
//Input: nums = [1,7,4,9,2,5]
//Output: 6
func wiggleMaxLength(_ nums: [Int]) -> Int {
    
    func caculator(nums:[Int], isUp:Bool) -> Int {
        var isUp = isUp
        var result = 1
        for i in 0..<nums.count-1 {
            if isUp && nums[i] > nums[i+1] {
                isUp = false
                result += 1
            } else if !isUp && nums[i] < nums[i+1] {
                isUp = true
                result += 1
            }
        }
        return result
    }
    return max(caculator(nums: nums, isUp: false), caculator(nums: nums, isUp: true))
}

wiggleMaxLength([1,2,3,4,5,6,7,8,9])

//646. Maximum Length of Pair Chain
//Input: pairs = [[1,2],[2,3],[3,4]]
//Output: 2
func findLongestChain(_ pairs: [[Int]]) -> Int {
    var dp = Array(repeating: 0, count: pairs.count)
    var sortedPairs = pairs.sorted { x, y in
        return x[1] < y[1]
    }
    
    for i in 0..<pairs.count {
        var mx = 1
        for j in 0...i {
            if sortedPairs[i][0] > sortedPairs[j][1] {
                mx = max(mx, dp[j] + 1)
            }
        }
        dp[i] = mx
    }
    
    var res = 0
    for i in dp {
        if i > res {
            res = i
        }
    }
    return res
}
findLongestChain([[1,2],[7,8],[4,5]])

//300. Longest Increasing Subsequence
//Input: nums = [10,9,2,5,3,7,101,18]
//Output: 4
func lengthOfLIS(_ nums: [Int]) -> Int {
    var dp = Array(repeating: 0, count: nums.count)

    for i in 0..<nums.count {
        var mx = 1
        for j in 0..<i {
            if nums[i] > nums[j] { mx = max(mx, dp[j]+1) }
        }
        dp[i] = mx
    }
    
    var res = 0
    for i in dp {
        if res < i { res = i }
    }
    
    return res
}
lengthOfLIS([10,9,2,5,3,7,101,18])


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

//303. Range Sum Query
//Input:["NumArray", "sumRange", "sumRange", "sumRange"],[[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
//Output: [null, 1, -1, -3]


//279. Perfect Squares
//Input: n = 12
//Output: 3
func numSquares(_ n: Int) -> Int {
    var dp = Array(repeating: Int.max, count: n+1)
    dp[0] = 0
    for i in 1...n {
        var j = 1
        while j*j <= i {
            dp[i] = min(dp[i], dp[i-j*j]+1)
            j += 1
        }
    }
    return dp[n]
}

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

//343. Integer Break

