import UIKit
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

//549. Binary Tree Longest Consecutive Sequence II
//Input: root = [1,2,3]
//Output: 2
//Explanation: The longest consecutive path is [1, 2] or [2, 1].



//200. Number of Islands
//Input: grid = [["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]
//Output: 1
func numIslands(_ grid: [[Character]]) -> Int {
    if grid.count == 0 { return 0 }

    let directions:[[Int]] = [[0,1],[0,-1],[1,0],[-1,0]]
    var grid = grid
    var islandNo = 0
    for n in 0..<grid.count {
        for m in 0..<grid[0].count {
            if grid[n][m] != "0" {
                dfs(grid: &grid, row: n, column: m)
                islandNo += 1
            }
        }
    }

    func dfs(grid: inout [[Character]], row: Int, column: Int){
        if row < 0 || column < 0 || row >= grid.count || column >= grid[0].count || grid[row][column] == "0" { return }
        
        grid[row][column] = "0"
        for dir in directions {
            dfs(grid: &grid, row: row+dir[0], column: column+dir[1])
        }
    }
    return islandNo
}





//695. Max Area of Island
//Input: grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
//Output: 6
func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    if grid.count == 0 { return 0 }
    
    let directions:[[Int]] = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    var grid = grid
    var maxArea = 0
    for n in 0..<grid.count {
        for m in 0..<grid[0].count {
            maxArea = max(maxArea, dfs(grid:&grid,row:n,column:m))
        }
    }
    
    func dfs(grid:inout [[Int]], row:Int,column:Int) -> Int{
        
        if row < 0 || column < 0 || row >= grid.count || column >= grid[0].count || grid[row][column] == 0 { return 0 }
        
        grid[row][column] = 0
        var area = 1
        
        for dir in directions {
            area += dfs(grid: &grid, row: row+dir[0], column: column+dir[1])
        }
        return area
    }
    return maxArea
}
var grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
print(maxAreaOfIsland(grid))
