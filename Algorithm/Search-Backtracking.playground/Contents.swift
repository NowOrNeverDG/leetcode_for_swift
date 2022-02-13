import UIKit
import Darwin
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
//39. Combination Sum
//Input: candidates = [2,3,6,7], target = 7
//Output: [[2,2,3],[7]]
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    
    return [[]]
}

//77. Combinations
//Input: n = 4, k = 2
//Output:[[2,4],[3,4],[2,3],[1,2],[1,3],[1,4],]
func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var current:[Int] = Array()
    var result:[[Int]] = Array()
    backtracking(n:n, k:k, pos: 1, current: &current, result: &result)
    
    func backtracking(n:Int, k:Int, pos:Int, current:inout [Int], result:inout [[Int]]) {
        if current.count == k {
            result.append(current)
            return
        }
        
        for i in pos...n {
            if current.contains(i) {continue}
            current.append(i)
            backtracking(n: n, k: k, pos: i, current: &current, result: &result)
            current.removeLast()
        }
    }
    return result
}

//47. Permutations II
//Input: nums = [1,1,2]
//Output:
//[[1,1,2],[1,2,1],[2,1,1]]
func permuteUnique(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 {return []}
    if nums.count == 1 {return [nums]}
    var visited:[Bool] = Array(repeating: false, count: nums.count)
    var result = Set<[Int]>()
    var current:[Int] = Array()
    
    backtracking(nums: nums, visited: &visited, current: &current,result: &result)
    
    func backtracking(nums:[Int], visited:inout [Bool], current: inout [Int],result: inout Set<[Int]>) {
        if current.count == nums.count {
            result.insert(current)
            return
        }
        for i in 0..<nums.count {
            if visited[i] == true {continue}
            
            current.append(nums[i])
            visited[i] = true
            backtracking(nums: nums, visited: &visited, current: &current, result: &result)
            current.removeLast()
            visited[i] = false
        }
    }
    return Array(result)
}

//46. Permutations
//Input: nums = [1,2,3]
//Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
func permute(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 {return []}
    if nums.count == 1 {return [nums]}
    var visited:[Bool] = Array(repeating: false, count: nums.count)
    var result:[[Int]] = Array()
    var current:[Int] = Array()
    
    backtracking(nums: nums, visited: &visited, current: &current,result: &result)
    
    func backtracking(nums:[Int], visited:inout [Bool], current: inout [Int],result: inout [[Int]]) {
        if current.count == nums.count {
            result.append(current)
            return
        }
        
        for i in 0..<nums.count {
            if visited[i] == true {continue}
            
            current.append(nums[i])
            visited[i] = true
            backtracking(nums: nums, visited: &visited, current: &current, result: &result)
            current.removeLast()
            visited[i] = false
        }
    }
    return result
}
    

//257. Binary Tree Paths
//Input: root = [1,2,3,null,5]
//Output: ["1->2->5","1->3"]
func binaryTreePaths(_ root: TreeNode?) -> [String] {
    if root == nil {return []}
    if root?.left == nil && root?.right == nil {return ["\(root!.val)"]}
    
    var res:[String] = []
    backtracking(currNode: root!, res: &res, tmpString: "\(root!.val)")
    
    func backtracking(currNode:TreeNode, res:inout [String],tmpString:String) {
        if currNode.left == nil && currNode.right == nil {
            res.append(tmpString)
        }
        if currNode.left != nil {
            backtracking(currNode: currNode.left!, res: &res,tmpString: tmpString+"->"+"\(currNode.left!.val)")
        }
        if currNode.right != nil {
            backtracking(currNode: currNode.right!, res: &res, tmpString: tmpString+"->"+"\(currNode.right!.val)")
        }
    }
    return res
}


//79. Word Search
//Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
//Output: true
func exist(_ board: [[Character]], _ word: String) -> Bool {
    if word.count == 0 {return true}
    if board.count == 0 || board[0].count == 0 {return false}
    
    let directions = [[0,-1],[0,1],[1,0],[-1,0]]
    var visited:[[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    let charsArr = Array(word)
    
    
    for m in 0..<board.count {
        for n in 0..<board[0].count {
            if backtracking(board:board, charsArr:charsArr, currIndex:0, visited:&visited, row:m, column:n) { return true }
        }
    }
    
    func backtracking(board:[[Character]], charsArr:[Character], currIndex:Int, visited:inout [[Bool]], row:Int, column:Int) -> Bool {
        if currIndex == charsArr.count {return true}
        
        if row < 0 || row >= board.count || column < 0 || column >= board[0].count || board[row][column] != charsArr[currIndex] || visited[row][column] {return false}
        
        visited[row][column] = true
        for dir in directions {
            if backtracking(board:board, charsArr:charsArr, currIndex:currIndex+1, visited:&visited, row:row+dir[0], column:column+dir[1]) {
                return true
            }
        }
        visited[row][column] = false
        return false
    }
    return false
}

//93. Restore IP Addresses
//Input: s = "25525511135"
//Output: ["255.255.11.135","255.255.111.35"]
func restoreIpAddresses(_ s: String) -> [String] {
    var sChar:[Character] = Array()
    for char in s { sChar.append(char) }
    if sChar.count < 4 || sChar.count > 12 { return [] }
    
    var result:[String] = []
    backtracking(sChar: sChar, pos: 0,remain: "", group: 0, result: &result)
    
    func backtracking(sChar:[Character], pos:Int, remain: String, group:Int, result:inout [String]) {
        if group > 4 {return}
        if group == 4 && pos == sChar.count {
            result.append(remain)
            return
        }
        
        for i in 1...3 {
            if pos + i > s.count {break}
            let temp = String(sChar[pos...(pos+i-1)])
            if (temp.first == "0" && temp.count > 1) || (i == 3 && (Int(temp)!) > 255) { continue }
            let remain = remain + temp + (group == 3 ? "" : ".")
            backtracking(sChar: sChar, pos: pos+i, remain: remain, group: group+1, result: &result)
        }
    }
    
    return result
}


//17. Letter Combinations of a Phone Number
//Input: digits = "23"
//Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 {return []}
    
    
    let keyMaps:[Character:String] = ["2":"abc","3":"def","4":"ghi","5":"jkl","6":"mno","7":"pqrs","8":"tuv","9":"wxyz"]
    var result = [String]()
    var combinations = [String]()
    
    for char in digits {
        if let string = keyMaps[char] { combinations.append(string)}
    }
    backtracking(current: "",combinations:combinations, index:0,result: &result)
    
    func backtracking(current:String,combinations:[String],index:Int,result: inout [String]) {
        if current.count == combinations.count {
            result.append(current)
            return
        }
        for char in combinations[index] {
            backtracking(current: current+String(char), combinations: combinations, index: index+1, result: &result)
        }
    }
    return result
}


    
    
