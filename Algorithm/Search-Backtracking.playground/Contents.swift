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

//46. Permutations
//Input: nums = [1,2,3]
//Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
func permute(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 {return []}
    if nums.count == 1 {return [nums]}
    var visited:[Bool] = Array(repeating: false, count: nums.count)
    var res:[[Int]] = Array()

    for ele in 0..<nums.count {
        var tmp:[Int] = []
        backtracking(nums: nums, visited: &visited, currIndex: ele, posCount: 0, tmpArr: &tmp)
    }
    
    func backtracking(nums:[Int], visited:inout [Bool], currIndex:Int, posCount:Int, tmpArr: inout [Int]) {
        if posCount == nums.count {
            res.append(tmpArr)
            return
        }
        if visited[currIndex] { return }
        
        visited[currIndex] = true
        var tmp = tmpArr
        tmp.append(nums[currIndex])
        for ele in 0..<nums.count {
            backtracking(nums: nums, visited: &visited, currIndex: ele, posCount: posCount+1, tmpArr: &tmp )
        }
        tmpArr.removeLast()
        visited[currIndex] = false
    }
    
    return res
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
    if board.count == 0 {return false}
    
    let directions = [[0,-1],[0,1],[1,0],[-1,0]]
    var isVisited:[[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    
    var wordArr:[Character] = Array()
    for char in word {
        wordArr.append(char)
    }
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if backtracking(board:board, wordArr:wordArr, pos:0, isVisited:&isVisited, row:i, column:j) { return true }
        }
    }
    
    func backtracking(board:[[Character]], wordArr:[Character], pos:Int, isVisited:inout [[Bool]], row:Int, column:Int) -> Bool {
        if pos == wordArr.count {return true}
        if row < 0 || row >= board.count || column < 0 || column >= board[0].count || board[row][column] != wordArr[pos] || isVisited[row][column] {return false}
        
        isVisited[row][column] = true
        for dir in directions {
            if backtracking(board:board, wordArr:wordArr, pos:pos+1, isVisited:&isVisited, row:row+dir[0], column:row+dir[1]) {
                print(board[row][column])
                return true
            }
        }
        isVisited[row][column] = false
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


    
    
