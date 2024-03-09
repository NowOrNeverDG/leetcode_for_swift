class Solution {
    var visited = [[Bool]]()
    var dirs = [[0,1],[0,-1],[1,0],[-1,0]]

    func numIslands(_ grid: [[Character]]) -> Int {
        var res = 0
        visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == "1" && visited[i][j] == false {
                    res += 1
                    traverse(grid, i, j)
                }
            }
        }
        return res
    }

    func traverse(_ grid: [[Character]],_ row: Int,_ col: Int) {
        if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count || visited[row][col] == true || grid[row][col] == "0" { return }
        visited[row][col] = true

        for dir in dirs {
            traverse(grid, row+dir[0], col+dir[1])
        }
    }
}
