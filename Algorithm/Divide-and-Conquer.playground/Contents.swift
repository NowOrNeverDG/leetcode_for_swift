import UIKit
public class Node {
    public var val: Bool
    public var isLeaf: Bool
    public var topLeft: Node?
    public var topRight: Node?
    public var bottomLeft: Node?
    public var bottomRight: Node?
    public init(_ val: Bool, _ isLeaf: Bool) {
        self.val = val
        self.isLeaf = isLeaf
        self.topLeft = nil
        self.topRight = nil
        self.bottomLeft = nil
        self.bottomRight = nil
    }
}

//427. Construct Quad Tree
//Input: grid = [[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0]]
//Output: [[0,1],[1,1],[0,1],[1,1],[1,0],null,null,null,null,[1,0],[1,0],[1,1],[1,1]]
func construct(_ grid: [[Int]]) -> Node? {
    func constructor(grid:[[Int]], left:Int, right:Int, up:Int, down:Int) -> Node {
        if isSame(grid: grid, left: left, right: right, up: up, down: down) {
            return Node(grid[up][left] == 1, true)
        }
        
        let node = Node(grid[up][left] == 1, false)
        node.topLeft = constructor(grid: grid, left: left, right: (left+right)/2, up: up, down: (up+down)/2)
        node.topRight = constructor(grid: grid, left: (left+right)/2+1, right: right, up: up, down: (up+down)/2)
        node.bottomLeft = constructor(grid: grid, left: left, right: (left+right)/2, up: (up+down)/2+1, down: down)
        node.bottomRight = constructor(grid: grid, left: (left+right)/2+1, right: right, up: (up+down)/2+1, down: down)
        return node
    }
    
    func isSame(grid:[[Int]], left:Int, right:Int, up:Int, down:Int) -> Bool {
        var val = -1
        for i in up...down {
            for j in left...right {
                if val == -1 {val = grid[i][j]}
                else if val != grid[i][j] {return false}
            }
        }
        return true
    }
    return constructor(grid: grid, left: 0, right: grid.count-1, up: 0, down: grid[0].count-1)
}

//241. Different Ways to Add Parentheses
//Input: expression = "2-1-1"
//Output: [0,2]
func diffWaysToCompute(_ expression: String) -> [Int] {
    if expression.count == 1 {return [Int(expression)!]}
    var characters:[Character] = Array()
    var result:[Int] = Array()
    for ele in expression {
        characters.append(ele)
    }
    
    for i in 0..<characters.count {
        if characters[i] == "+" || characters[i] == "-" || characters[i] == "*" {
            let part1 = String(characters[0...(i - 1)])
            let part2 = String(characters[(i + 1)...(characters.count - 1)])
            let result1 = diffWaysToCompute(part1)
            let result2 = diffWaysToCompute(part2)
            
            for p1 in result1 {
                for p2 in result2 {
                    var sum = 0
                    if characters[i] == "+" {sum = p1 + p2}
                    if characters[i] == "*" {sum = p1 * p2}
                    if characters[i] == "-" {sum = p1 - p2}
                    result.append(sum)
                }
            }
        }
    }
    
    return result.count == 0 ? [Int(expression)!] : result
}





