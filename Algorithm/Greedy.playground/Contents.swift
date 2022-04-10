import UIKit
import Darwin
//134. Gas Station
//Input: gas = [1,2,3,4,5], cost = [3,4,5,1,2]
//Output: 3


//763. Partition Labels
//Input: s = "ababcbacadefegdehijhklij"
//Output: [9,7,8]
func partitionLabels(_ S: String) -> [Int] {
    if S.count == 0 {return []}
    
    let arr:[Character] = Array(S)
    let endElementDic:[Character:Int] = [:]
    let startElementDic:[Character:Int] = [:]

    for i in 0..<arr.count {
        if startElementDic[arr[i]] == nil {
            startElementDic[arr[i]] == i
        } else {
            endElementDic[arr[i]] == i
        }
    }
    
    var _:[Int] = Array()
    return []
}

//53. Maximum Subarray
//Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
//Output: 6
func maxSubArray(_ nums: [Int]) -> Int {
    var result = nums[0]
    var preSum = nums[0]
    for i in 1..<nums.count {
            preSum = max(preSum+nums[i], nums[i])
            result = max(preSum, result)
    }
    return result
}


//665. Non-decreasing Array
//Input: nums = [4,2,3]
//Output: true
func checkPossibility(_ nums: [Int]) -> Bool {
    var nums = nums
    var result = 0
    for i in 1..<nums.count {
        if nums[i] >= nums[i-1] {continue}
        
        result += 1
        if i-2>=0 && nums[i-2] > nums[i] {
            nums[i] = nums[i-1]//4.5.3
        } else {
            nums[i-1] = nums[i]//4.2.5
        }
    }
    return result <= 1
}


//392. Is Subsequence
//Input: s = "abc", t = "ahbgdc"
//Output: true
func isSubsequence(_ s: String, _ t: String) -> Bool {
    var t = t
    var s = s
    for i in s {
        for _ in s {
            let tmp = t.removeFirst()
            if tmp == i {
                s.removeFirst()
                break
            }
        }
    }
    return s.count == 0
}


//?605. Can Place Flowers
//Input: flowerbed = [1,0,0,0,1], n = 1
//Output: true
func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var input = flowerbed
    var result = 0
    if input.count == 1 { return input[0] == n ? false : true}
    if input.count == 2 {
        if input.contains(1) { return n == 0}
    }
    
    for i in 0..<input.count {
        if i==0 {
            if input[0] == 0 && input[1] == 0 {
                result += 1
                input[i] == 1
            } else if i == input.count-1 {
                if input[i] == 0 && input[i-1] == 0 {
                    result += 1
                    input[i] = 1
                }
            } else {
                if input[i] == 0 && input[i-1] == 0 && input[i+1] == 0 {
                    result += 1
                    input[i] = 1
                }
            }
        }
    }
    print(result)
    return result == n
}

//122. Best Time to Buy and Sell Stock II
//Input: prices = [7,1,5,3,6,4]
//Output: 7
func maxProfitII(_ prices: [Int]) -> Int {
    if prices.count == 0 {return 0}
    
    var profit = 0
    for i in 1..<prices.count {
        if prices[i] < prices[i-1] {continue}
        profit += (prices[i] - prices[i-1])
    }
    return profit
}



//121. Best Time to Buy and Sell Stock
//Input: prices = [7,1,5,3,6,4]
//Output: 5
func maxProfit(_ prices: [Int]) -> Int {
    if prices.count == 0 {return 0}
    
    var base = Int.max
    var profit = Int.min
    
    for i in prices {
        base = min(base, i)
        profit = max(profit, i - base)
    }
    return profit
}


//406. Queue Reconstruction by Height
//Input:[[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]
//Output:[[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
    if people.count == 0 {return people}
    
    let input = people.sorted { x, y in
        if x[0] == y[0]  {return x[1] < y[1]}
        return x[0] > y[0]
    }
    var result:[[Int]] = Array()
    for i in 0..<input.count {
        result.insert(input[i], at: input[i][1])
    }
    return result
}

//452. Minimum Number of Arrows to Burst Balloons
//Input: points = [[10,16],[2,8],[1,6],[7,12]]
//Output: 2
func findMinArrowShots(_ points: [[Int]]) -> Int {
    if points.count == 0 {return 0}
     
    let input = points.sorted { x, y in
        return x[1] < y[1]
    }
    
    var result = 1
    var end = input[0][1]
    for i in 0..<input.count {
        if input[i][0] <= end {continue}
        end = input[i][1]
        result += 1
    }
    return input.count - result
}


//435. Non-overlapping Intervals
//Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
//Output: 1
func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    if intervals.count == 0 {return 0}
    
    let input = intervals.sorted { x, y in
        return x[1] < y[1]
    }
    
    var result = 1
    var end = input[0][1]
    for i in 0..<input.count {
        if input[i][0] < end { continue }
        end = input[i][1]
        result += 1
    }
    return input.count - result
}

//455. Assign Cookies
//Input: g = [1,2,3], s = [1,1]
//Output: 1
func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    if g.count == 0 || s.count == 0 { return 0 }
    let children = g.sorted()
    let cookies = s.sorted()
    
    var contendChildren = 0
    var consumeCookies = 0
    while (contendChildren < g.count && consumeCookies < s.count) {
        if children[contendChildren] <= cookies[consumeCookies] {
            contendChildren += 1
        }
        consumeCookies += 1
    }
    return contendChildren
}
