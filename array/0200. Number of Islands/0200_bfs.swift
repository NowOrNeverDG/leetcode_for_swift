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
        var q : [(Int,Int)] = [(row,col)]
        while(!q.isEmpty) {
            let c = q.count
            let curNode = q.removeFirst()

            for dir in dirs {
                let r = curNode.0 + dir[0]
                let c = curNode.1 + dir[1]

                if r >= 0 && r < grid.count && c >= 0 && c < grid[0].count && visited[r][c] == false && grid[r][c] == "1" {
                    visited[r][c] = true
                    q.append((r,c))
                }
            }
        }
    }
}
