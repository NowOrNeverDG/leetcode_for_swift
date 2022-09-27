import UIKit
import Foundation
import Darwin//127，364



//286. Walls and Gates
//Input: rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
//Output: [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
func wallsAndGates(_ rooms: inout [[Int]]) {
    var m = rooms.count
    var n = rooms[0].count
    var dirs = [[0,1],[-1,0],[1,0],[0,-1]]
        
    var queue = [[Int]]()
    for i in 0..<m {
        for j in 0..<n {
            if rooms[i][j] == 0 { queue.append([i,j])}
        }
    }
    
    while( !queue.isEmpty ) {
        let po = queue.removeFirst()
        for dir in dirs {
            let nxRow = po[0] + dir[0]
            let nxColumn = po[1] + dir[1]
            
            if nxRow < 0 || nxRow >= m || nxColumn < 0 || nxColumn >= n || rooms[nxRow][nxColumn] != 2147483647 { continue }
            
            rooms[nxRow][nxColumn] = rooms[po[0]][po[1]] + 1
            queue.append([nxRow,nxColumn])
        }
    }
}


//815. Bus Routes
//Input: routes = [[1,2,7],[3,6,7]], source = 1, target = 6
//Output: 2
func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    if source == target { return 0 }
    var stopToBuses = [Int: [Int]]()
    
    for (bus, stops) in routes.enumerated() {
        for stop in stops {
            stopToBuses[stop, default:[Int]()].append(bus)
        }
    }
    
    if stopToBuses[source] == nil || stopToBuses[target] == nil { return -1 }
    
    var queue = stopToBuses[source, default: []]
    var visited = Set(queue)
    let destBuses = Set(stopToBuses[target, default:[]])
    var totalBusses = 1
    
    while !queue.isEmpty {
        let count = queue.count
        
        for _ in 0..<count {
            let currBus = queue.removeFirst()
            
            if destBuses.contains(currBus) { return totalBusses }
            
            for stop in routes[currBus] {
                for nextBus in stopToBuses[stop, default: []] where !visited.contains(nextBus) {
                    visited.insert(nextBus)
                    queue.append(nextBus)
                }
            }
        }
        totalBusses += 1
    }
    return -1
}


//127. Word Ladder
//Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
//Output: 5
func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    if !wordList.contains(endWord) { return 0 }
    
    func isOneWordDiff(begin:String, end:String) -> Bool {
        var count = 0
        let beginWordArr = Array(begin)
        let endWordArr = Array(end)
        for i in 0..<beginWord.count {
            if beginWordArr[i] != endWordArr[i] {count+=1}
        }
        return count > 1 ? false : true
    }
    
    var queue = [beginWord]
    var count = 0
    var visited = Array(repeating: false, count: wordList.count)
    let wordCount = wordList.count
    while( !queue.isEmpty ) {
        count += 1
        var tempQueue:[String] = []
        for i in queue {
            if i==endWord {return count}
            for j in 0..<wordCount {
                if isOneWordDiff(begin: i, end: wordList[j]) && visited[j] == false {
                    visited[j] = true
                    tempQueue.append(wordList[j])
                }
            }
        }
        queue = tempQueue
    }
    return 0
}

//279. Perfect Squares
//Input: n = 12
//Output: 3
func numSquares(_ n: Int) -> Int {
    var squares:[Int] = []
    for i in 1...n {
        if i*i <= n { squares.append(i*i) }
    }
    
    if squares.last == n {return 1}
    
    var numCount = 0
    var queue = [n]
    while(!queue.isEmpty) {
        var tempQueue = [Int]()
        for target in queue {
            for square in squares {
                if square == target {return numCount}
                else if square < target {tempQueue.append(target-square)}
            }
        }
        queue = tempQueue
        numCount += 1
    }
    return numCount
}

//1091. Shortest Path in Binary Matrix
//Input: grid = [[0,1],[1,0]]
//Output: 2
func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
    let directions = [[0, 1], [0, -1], [1, 0], [-1, 0],[-1, -1], [1, -1], [-1, 1], [1, 1]]

    if grid[0][0] == 1 { return -1 }
    var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
    visited[0][0] = true
    var positionQ = [(row:0,col:0)]
    var path = 1
    
    while (!positionQ.isEmpty) {
        for _ in 0..<positionQ.count {
            let pos = positionQ.removeFirst()
            
            if pos.row == grid.count-1 && pos.col == grid[0].count-1 {return path}
            
            for dir in directions {
                let (nextRow,nextCol) = (pos.row+dir[0],pos.col+dir[1])
                
                if nextRow >= grid.count || nextCol >= grid[0].count || nextRow < 0 || nextCol < 0 || grid[nextRow][nextCol] == 1 || visited[nextRow][nextCol]  { continue }
                
                positionQ.append((nextRow,nextCol))
                visited[nextRow][nextCol] = true
            }
        }
        path += 1
    }
    return -1
}

func shortestPathBinaryMatrixDFS(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let directions = [[0,1],[1,0],[0,-1],[-1,0],[1,1],[-1,-1],[1,-1],[-1,1]]
    var visited = Array(repeating: Array(repeating: false, count: m), count: m)
    
    
    func dfs(directions:[[Int]], grid:[[Int]], visited: inout [[Bool]], row: Int, column: Int) -> Int {
        if row < 0 || column >= m || row >= m || column < 0 || grid[row][column] == 1 || visited[row][column] == true { return Int.max}
        if row == m-1 && column == m-1 {return 1}
        visited[row][column] = true
        var path = Int.max
        for dir in directions {
            path = min(path, dfs(directions: directions, grid: grid,visited: &visited, row: row+dir[0], column: column+dir[1]))
        }
        visited[row][column] = false
        
        if path != Int.max { return path+1 } else {return Int.max}
    }
    
    let res = dfs(directions: directions, grid: grid, visited: &visited, row: 0, column: 0)
    return res == Int.max ? -1 : res
}


