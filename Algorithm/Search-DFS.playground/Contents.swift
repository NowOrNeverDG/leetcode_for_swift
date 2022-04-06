import Darwin
//212. Word Search II
//Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
//Output: ["eat","oath"]
func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    let directions: [[Int]] = [[0,1],[0,-1],[1,0],[-1,0]]
    var isVisited:[[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    var result = [String]()
    var testString = ""
    for str in words {
        dfs(board: board, row: 0, column: 0, word: str, testString: &testString, isVisited: &isVisited, result: &result)
    }
    
    func dfs (board:[[Character]], row: Int, column: Int, word:String, testString: inout String, isVisited: inout [[Bool]], result:inout [String]) {
        if row < 0 || row > board.count-1 || column < 0 || column > board[0].count-1 || isVisited[row][column] == true || !word.hasPrefix(testString) {return}
        if word == testString { result.append(word)}
        
        isVisited[row][column] = true
        for dir in directions {
            testString.append(board[row][column])
            dfs(board: board, row: row + dir[0], column: column + dir[1], word: word, testString: &testString, isVisited: &isVisited, result: &result)
        }
        isVisited[row][column] = false
        testString.removeLast()
    }
    return result
}
findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], ["oath","pea","eat","rain"])


//417. Pacific Atlantic Water Flow
//Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
//Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    if heights.count == 0 { return []}

    let directions:[[Int]] = [[0,1],[0,-1],[1,0],[-1,0]]
    var pacific:[[Bool]] = Array(repeating: Array(repeating: false, count: heights[0].count), count: heights.count)
    var atlantic:[[Bool]] = Array(repeating: Array(repeating: false, count: heights[0].count), count: heights.count)
    for m in 0..<heights.count {
        dfs(height: heights[m][0], row: m, column: 0, isVisited: &pacific)
        dfs(height: heights[m][heights[0].count-1], row: m, column: heights[0].count-1, isVisited: &atlantic)
    }
    
    for n in 0..<heights[0].count {
        dfs(height: heights[0][n], row: 0, column: n, isVisited: &pacific)
        dfs(height: heights[heights.count-1][n], row: heights.count-1, column: n, isVisited: &atlantic)
    }
    
    var result = [[Int]]()
    for m in 0..<heights.count {
        for n in 0..<heights[0].count {
            if pacific[m][n] == true && atlantic[m][n] == true {
                let arr = [m,n]
                result.append(arr)
            }
        }
    }

    func dfs(height:Int, row:Int, column:Int, isVisited: inout [[Bool]]) {
        if row < 0 || row >= heights.count || column < 0 || column >= heights[0].count || isVisited[row][column] || heights[row][column] < height { return }

        isVisited[row][column] = true
        for dir in directions {
            dfs(height: heights[row][column], row: row+dir[0], column: column+dir[1], isVisited: &isVisited)
        }
    }
    
    return result
}

//130. Surrounded Regions
//Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
//Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
func solve(_ board: inout [[Character]]) {
    if board.count == 0 { return }
    let directions:[[Int]] = [[0,1],[0,-1],[1,0],[-1,0]]
    for m in 0..<board.count {
        dfs(board: &board, row: m, column: 0)
        dfs(board: &board, row: m, column: board[0].count-1)
    }
    for n in 0..<board[0].count {
        dfs(board: &board, row: 0, column: n)
        dfs(board: &board, row: board.count-1, column: n)
    }
    for m in 0..<board.count {
        for n in 0..<board[0].count {
            if board[m][n] == "T" {board[m][n] = "O"}
            else if board[m][n] == "O" {board[m][n] = "X"}
        }
    }
    
    func dfs(board:inout [[Character]], row:Int, column:Int){
        if row < 0 || row >= board.count || column < 0 || column >= board[0].count || board[row][column] != "O" { return }
        
        board[row][column] = "T"
        for dir in directions {
            dfs(board: &board, row: row+dir[0], column: column+dir[1])
        }
    }
}


//547. Number of Provinces
//Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
//Output: 2
func findCircleNum(_ isConnected: [[Int]]) -> Int {
    if isConnected.count == 0 { return 0 }
    
    var isConnected = isConnected
    var circleNo = 0
    var visited:[Bool] = Array(repeating: false, count: isConnected.count)
    for n in 0..<isConnected.count {
        if visited[n] == false {
            dfs(isConnected: &isConnected, provinceNo: n)
            circleNo += 1
        }
    }
    
    func dfs(isConnected: inout [[Int]], provinceNo:Int) {
        for m in 0..<isConnected[provinceNo].count {
            if isConnected[provinceNo][m] == 1 && visited[m] == false {
                visited[m] = true
                dfs(isConnected: &isConnected, provinceNo:m)
            }
        }
    }
    return circleNo
}



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
