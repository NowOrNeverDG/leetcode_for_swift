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

//Input: root = [1,2,3]
//Output: 6
//Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.
func maxPathSum(_ root: TreeNode?) -> Int {
    var pathMax = Int.min
    
    func dfs(_ root: TreeNode?) -> Int {
        guard let element = root else { return 0 }
        
        let leftMax = dfs(element.left)
        let rightMax = dfs(element.right)
        
        pathMax = max(pathMax, leftMax + rightMax + element.val)
        
        return max(max(leftMax, rightMax)+element.val, 0)
    }
    
    dfs(root)
    return pathMax
}

//110. Balanced Binary Tree
//Input: root = [3,9,20,null,null,15,7]
//Output: true
func isBalanced(_ root: TreeNode?) -> Bool {
    if root == nil { return true }
    return abs(height(root?.left) - height(root?.right)) <= 1 && isBalanced(root?.right) && isBalanced(root?.left)
}

func height(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
    
    let left = height(root?.left)
    let right = height(root?.right)
    
    return 1+max(left, right)

}




//104. Maximum Depth of Binary Tree
//Input: root = [3,9,20,null,null,15,7]
//Output: 3
func maxDepth(_ root: TreeNode?) -> Int {
    guard let node = root else { return 0 }
    
    let leftNum = maxDepth(node.left)
    let rightNum = maxDepth(node.right)
    
    if leftNum > rightNum{
        return leftNum + 1
    }else{
        return rightNum + 1
    }
}

