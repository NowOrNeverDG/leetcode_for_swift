import UIKit

//684. Redundant Connection
//Input: edges = [[1,2],[1,3],[2,3]]
//Output: [2,3]
func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    var dic:[Int:Int] = [:]

    for i in 1...edges.count {
        dic[i] = i
    }
    
    func findParent(node:Int) -> Int{
        if dic[node] == node {return node}
        let parent = findParent(node: dic[node]!)
        return parent
    }
        
    
    for edge in edges {
        let node1 = edge[0]
        let node2 = edge[1]
        
        let root1 = findParent(node: node1)
        let root2 = findParent(node: node2)
        
        if root1 == root2 {return edge}
        dic[root2] = root1
    }
    
    return [-1,-1]
}

//algorithm:set list array queue stack hastable binary tree
//pronlem solving；high level question and problem

//logical and mantainable
//architech deep depth: how you can describe a system to somebody else

//situation task action and resolve
//activate caring
//study and dram inspiration from culture and tech: 得到外在知识并用于自己 并举一反三
//articlate possible and move fast make it real: 保持不断改善的激情
//image the invent before they ask：
//be customer obseess: 从客户视角出发为客户考虑

