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

//51. N-Queens
//Input: n = 4
//Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
func solveNQueens(_ n: Int) -> [[String]] {
    var result:[[String]] = Array()
    var board:[[Character]] = Array(repeating: Array(repeating: ".", count: n), count: n)
    backtracking(col: 0, n: n, board: &board, result: &result)
    
    func backtracking(col:Int, n:Int, board:inout [[Character]],result:inout [[String]]) {
        if col == n {
            result.append(board.map{ String($0)})
            return
        }
        
        for row in 0..<n {
            if validate(board: board, row: row, col: col) {
                board[row][col] = "Q"
                backtracking(col: col + 1, n: n, board: &board, result: &result)
                board[row][col] = "."
            }
        }
    }
    
    func validate(board:[[Character]], row:Int, col:Int) -> Bool {
        for i in 0..<board.count {
            if board[i][col] == "Q" {return false}
        }
        for i in 0..<board[0].count {
            if board[row][i] == "Q" {return false}
        }
        
        var x = 1
        while (row+x < board.count && col-x >= 0){
//                print("\(row)////\(col)")
            if board[row+x][col-x] == "Q" {return false}
            x += 1
        }
        
        while(row-x >= 0 && col+x < board.count) {
//                print("\(row)////\(col)")
            if board[row-x][col+x] == "Q" {return false}
            x += 1
        }
        
        while(row+x < board.count && col+x < board[0].count) {
            if board[row+x][col+x] == "Q" {return false}
            x += 1
        }
        
        while(row-x >= 0 && col-x >= 0) {
            if board[row-x][col-x] == "Q" {return false}
            x += 1
        }
        return true
    }
    return result
}

//37. Sudoku Solver
//Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
//Output: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
func solveSudoku(_ board: inout [[Character]]) {
       backtracking()

       func backtracking() -> Bool{
           for m in 0..<board.count {
               for n in 0..<board[0].count {
                   if board[m][n] == "." {
                       for i in "123456789" {
                           if check(board: board, row: m, column: n, val: i) {
                               board[m][n] = i
                               if backtracking() {return true}
                               board[m][n] = "."
                           }
                       }
                       return false
                   }
               }
           }
           return true
       }

       func check(board:[[Character]],row:Int,column:Int,val:Character) -> Bool {
           for i in 0..<9 {
               if board[row][i] == val {return false}
               if board[i][column] == val {return false}
               if board[(row/3)*3+i/3][(column/3)*3+i%3] == val {return false}
           }
           return true
       }
   }


//131. Palindrome Partitioning
//Input: s = "aab"
//Output: [["a","a","b"],["aa","b"]]
func partition(_ s: String) -> [[String]] {
    var result:[[String]] = Array()
    var current:[String] = Array()
    var characters:[Character] = Array()
    for ele in s {
        characters.append(ele)
    }
    backtracking(start: 0, characters:characters, current: &current, result: &result)
    
    func backtracking(start:Int, characters:[Character],current:inout [String], result:inout [[String]]) {
        if start == characters.count {
            result.append(current)
            return
        }
        
        for i in start..<characters.count {
            if !isPalidrome(characters: characters, low: start, high: i) {continue}
            current.append(String(characters[start...i]))
            backtracking(start: i+1, characters: characters, current: &current, result: &result)
            current.removeLast()
        }
    }
    
    func isPalidrome(characters:[Character], low:Int, high:Int) -> Bool {
        var low = low
        var high = high
        while low <= high {
            if characters[low] != characters[high] {return false}
            low += 1
            high -= 1
        }
        return true
    }
    
    return result
}


//?90. Subsets II
//Input: nums = [1,2,2]
//Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var current:[Int] = Array()
    var result:[[Int]] = Array()
    var visited:[Bool] = Array(repeating: false, count: nums.count)
    backtracking(nums: nums, index:0, visited:&visited, current:&current, result:&result)
    
    func backtracking(nums:[Int], index:Int, visited:inout [Bool], current:inout [Int], result:inout [[Int]]) {
        if visited[index] == true { return }
        visited[index] = true
        
        
        for i in index..<nums.count {
            backtracking(nums: nums, index: i+1, visited: &visited, current: &current, result: &result)
            visited[i] == false
            current.removeLast()
        }
    }
    return result
}

//78. Subsets
//Input: nums = [1,2,3]
//Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
func subsets(_ nums: [Int]) -> [[Int]] {
    var current:[Int] = Array()
    var result:[[Int]] = [[]]
    backtracking(num: nums, index: 0, current: &current, result: &result)
    
    func backtracking(num:[Int],  index:Int, current:inout [Int], result:inout [[Int]]) {
        for i in index..<nums.count  {
            current.append(num[i])
            result.append(current)
            backtracking(num: num, index: i+1, current: &current, result: &result)
            current.removeLast()
        }
    }
    
    return result
}







//39. Combination Sum
//Input: candidates = [2,3,6,7], target = 7
//Output: [[2,2,3],[7]]
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var current:[Int] = Array()
    var result:[[Int]] = Array()
    backtracking(candidates: candidates, target: target, pos:0, current: &current, result: &result)
    
    func backtracking(candidates:[Int], target:Int, pos:Int, current:inout [Int], result:inout [[Int]]) {
        var sum = 0
        for ele in current { sum += ele }
        if sum == target {
            result.append(current)
            return
        } else if sum > target {return}
        
        for i in pos..<candidates.count {
            current.append(candidates[i])
            backtracking(candidates: candidates, target: target, pos: i, current: &current, result: &result)
            current.removeLast()
        }
    }
    return result
}

//Input: candidates = [10,1,2,7,6,1,5], target = 8
//Output:[[1,1,6],[1,2,5],[1,7],[2,6]]
func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    guard !candidates.isEmpty else { return [] }
    var result = [[Int]]()
    let candidatesCount = candidates.count
    backtracing(candidates: candidates.sorted(), result: &result, remain: target, index: 0, currArr: [])
    
    func backtracing(candidates: [Int], result: inout [[Int]], remain: Int, index: Int,currArr:[Int] ) {
        if remain == 0 {
            result.append(currArr)
            return
        }

        var tempCurrArr = currArr
        for i in index..<candidatesCount {
            guard remain >= candidates[i] else { return }
             
            if i != index && candidates[i] == candidates[i-1] { continue }
            tempCurrArr.append(candidates[i])
            backtracing(candidates: candidates, result: &result, remain: remain-candidates[i], index: i+1, currArr: tempCurrArr)
            tempCurrArr.removeLast()
        }
    }
    return result

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

//216. Combination Sum III
//Input: k = 3, n = 7
//Output: [[1,2,4]]
func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    var current:[Int] = Array()
    var result:[[Int]] = Array()
    var visited:[Bool] = Array(repeating: false, count: 10)
    backtracking(k: k, n: n, remain: n, count:0, pos:0, current: &current, visited: &visited, result: &result)

    func backtracking(k:Int, n:Int, remain:Int, count:Int, pos:Int,current:inout [Int], visited:inout [Bool], result:inout [[Int]]) {
        if remain == 0 && count == k{
            result.append(current)
            return
        } else if count > k || remain < 0 { return }
        
        for i in pos...8 {
            if visited[i] == true {continue}
            visited[i] = true
            current.append(i+1)
            backtracking(k: k, n: n, remain: remain-i-1, count:count+1, pos:i, current: &current, visited: &visited, result: &result)
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

//Input: s = "25525511135"
//Output: ["255.255.11.135","255.255.111.35"]
func restoreIpAddressesBFS(_ s: String) -> [String] {
    if s.count < 4 || s.count > 12 { return [] }
    
    let sArr = Array(s)
    var result = [String]()
    backtracking(sArr: sArr, pos: 0, remain: "", group: 1, result: &result)
    
    func backtracking(sArr:[Character], pos:Int, remain:String, group:Int, result: inout [String]) {
        if group > 4 { return }
        if group == 4 && pos == sArr.count {
            result.append(remain)
        }
        
        for i in 0...2 {
            if pos + i >= s.count {break}
            let temp = String(sArr[pos...(pos+i)])
            if (temp.first == "0" && temp.count > 1) || Int(temp) ?? 255 > 255 {continue}
            var remain = remain + "." + temp
            backtracking(sArr: sArr, pos: pos+1, remain: remain, group: group+1, result: &result)
        }
    }
    return result
}
restoreIpAddressesBFS("25525511135")


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
        print(current)
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

func letterCombinationsBFS(_ digits: String) -> [String] {
    if digits.count == 0 { return [] }
    let keyMaps:[Character:[String]] = ["2":["a","b","c"],"3":["d","e","f"],"4":["g","h","i"],"5":["j","k","l"],"6":["m","n","o"],"7":["p","q","r","s"],"8":["t","u","v"],"9":["w","x","y","z"]]
    
    var digitsArr = Array(digits)
    
    var queue = keyMaps[digitsArr[0]] ?? []
    digitsArr.removeFirst()
    while (!digitsArr.isEmpty) {
        let digit = keyMaps[digitsArr.removeFirst()] ?? []
        var temp = [String]()
        for i in queue {
            for j in digit {
                temp.append(i+j)
            }
        }
        queue = temp
    }
    return queue
}
letterCombinationsBFS("234")

//60. Permutation Sequence
//Input: n = 3, k = 3
//Output: "213"
func getPermutation(_ n: Int, _ k: Int) -> String {
    var noArr  = Array(repeating: 0, count: n)
    for i in 1...n {//1
        noArr[i-1] = i
    }
    
    func factorialOfValue(value:Int) -> Int {
        if value == 0 { return 1 }
    
        var product = 1
        for i in 1...value {
            product = product*i
        }
        return product
    }
    
    func backtracking(remianK: Int, currNo: Int, currIndex: Int) -> Int {
        if currIndex == n { return currNo }
        let factorialVal = factorialOfValue(value: n-currIndex-1)

        var digit = remianK / factorialVal
        var currNo = currNo*10 + noArr[digit]
        print("digit: \(digit), remainK: \(remianK), currNo: \(currNo), noArr: \(noArr), ")
        noArr.remove(at: digit)
        return backtracking(remianK: remianK % factorialVal, currNo: currNo, currIndex: currIndex+1)
    }
    return String(backtracking(remianK: k-1, currNo: 0, currIndex: 0))
}

//140. Word Break II
//Input: s = "pineapplepenapple", wordDict = ["apple","pen","applepen","pine","pineapple"]
//Output: ["pine apple pen apple","pineapple pen apple","pine applepen apple"]
func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
    var result = [String]()
    backtracking(currS: s, currString: "", result: &result)
    func sameWord(currS:String, word: String, count: Int) -> Bool {
        let currSWord = String(currS.prefix(count))
        if currSWord != word { return false }
        return true
    }
    
    func backtracking(currS: String, currString: String, result: inout [String]) {
        guard currS.count != 0 else {
            result.append(currString)
            return
        }
        
        let firstChar = currS.first
        for i in 0..<wordDict.count {
            if sameWord(currS: currS, word: wordDict[i], count: wordDict[i].count) {
                var currString = currString
                if currString.count == 0 {
                    currString = currString + wordDict[i]
                }else {
                    currString = currString + " " + wordDict[i]
                }
                var currS = currS
                currS = String(currS.dropFirst(wordDict[i].count))
                print("currS:\(currS), currString:\(currString)")
                backtracking(currS: currS, currString: currString, result: &result)
                
            }
        }
    }
    return result
}

//254. Factor Combinations
//Input: n = 12
//Output: [[2,6],[3,4],[2,2,3]]
func getFactors(_ n: Int) -> [[Int]] {
    guard n >= 3 else { return [] }
    var deliverList = [Int]()
    var result = [[Int]]()
    for i in 2..<n {
        if n % i == 0 {
            deliverList.append(i)
        }
    }
    backtracking(remainN: n, currArr: [], deliverList: deliverList, listIndex: 0, result: &result)
    
    func backtracking(remainN: Int, currArr:[Int], deliverList:[Int], listIndex:Int, result: inout [[Int]]) {
        if remainN == 1 {
            result.append(currArr)
            return
        }
        
        for i in listIndex..<deliverList.count {
            if remainN % deliverList[i] != 0 {continue}
            
            var currArr = currArr
            currArr.append(deliverList[i])
            backtracking(remainN: remainN/deliverList[i], currArr: currArr, deliverList: deliverList, listIndex: i, result: &result)
            currArr.removeLast()
        }
                  
    }
    return result
}

//207. Course Schedule
//Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
//Output: false
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var courseDic = [Int:[Int]]()
    var visited = Array(repeating: 0, count: numCourses)
    for i in prerequisites {
        courseDic[i[0], default: []].append(i[1])
    }
    
    for i in 0..<numCourses {
        print("course is: \(i)")
        if !backtracking(courseDic: courseDic, visited: &visited, index: i) { return false }
    }
    
    func backtracking(courseDic: [Int:[Int]], visited: inout [Int], index: Int) -> Bool {

        if visited[index] == 1 { return false }
        if visited[index] == 2 { return true }
        guard courseDic[index] != nil else { return true}
        print("visited: \(visited)")
        visited[index] = 1
        for i in courseDic[index]! {
            print("now check course: \(i)")
            if !backtracking(courseDic: courseDic, visited: &visited, index: i) { return false }
        }
        visited[index] = 2
        return true
    }
    return true
}

//291. Word Pattern II
//Input: pattern = "abab", s = "redblueredblue"
//Output: true
func wordPatternMatch(_ pattern: String, _ s: String) -> Bool {
    if backtracking(pattern: pattern,s: s, mapDict: [Character:String]()) { return true }
    
    func backtracking(pattern: String,s: String, mapDict: [Character:String]) -> Bool {
        guard let mapChar = pattern.first, s.count != 0 else {
            return pattern.count == 0 && s.count == 0
        }
        
        if let existedPattern = mapDict[mapChar] {
            if s.hasPrefix(existedPattern) {
                return backtracking(pattern: String(pattern.suffix(pattern.count-1)), s: String(s.suffix(s.count-existedPattern.count)), mapDict: mapDict)
            } else {
                return false
            }
        }
        
        for i in 0..<s.count {
            if mapDict.values.contains(String(s.prefix(i+1))) { continue }
            var tmpDict = mapDict
            tmpDict[mapChar] = String(s.prefix(i+1))
            if backtracking(pattern: String(pattern.suffix(pattern.count-1)), s: String(s.suffix(s.count-i-1)), mapDict: tmpDict) { return true}
        }
        return false
    }
    
    return false
}

//294. Flip Game II
func canWin(_ currentState: String) -> Bool {
    if currentState.count < 2 { return false }
    let currArr = Array(currentState)
    if backtracking(currentState: currArr) { return true }
    
    func backtracking(currentState:[Character]) -> Bool {
        for i in 1..<currentState.count {
            var currentState = currentState
            if currentState[i-1] == "+" && currentState[i] == "+" {
                currentState[i-1] = "-"
                currentState[i] = "-"
                let win = !backtracking(currentState: currentState)
                currentState[i-1] = "+"
                currentState[i] = "+"
                if win { return true }
            }
        }
        return false
    }
    return false
}
