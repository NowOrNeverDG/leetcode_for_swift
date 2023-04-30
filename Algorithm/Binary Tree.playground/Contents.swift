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

//144. Binary Tree Preorder Traversal
//Input: root = [1,null,2,3]
//Output: [1,2,3]
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var result = [Int]()
    if root.left == nil && root.right == nil { return [root.val] }
    dfs(node: root)
    
    func dfs(node: TreeNode?) {
        guard let node = node else { return }
        
        result.append(node.val)
        dfs(node: node.left)
        dfs(node: node.right)
    }
    return result
}

//94. Binary Tree Inorder Traversal
//Input: root = [1,null,2,3]
//Output: [1,3,2]
func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        dfs(node: root)
        
        func dfs(node:TreeNode?) {
            guard let node = node else { return }
            
            dfs(node: node.left)
            result.append(node.val)
            dfs(node: node.right)
        }
        
        return result
            
    }

//145. Binary Tree Postorder Traversal
//Input: root = [1,null,2,3]
//Output: [3,2,1]
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    dfs(node: root)
    
    func dfs(node:TreeNode?) {
        guard let node = node else { return }
        
        dfs(node: node.left)
        dfs(node: node.right)
        result.append(node.val)
    }
    return result
}

//102. Binary Tree Level Order Traversal
//Input: root = [3,9,20,null,null,15,7]
//Output: [[3],[9,20],[15,7]]
func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result = [[Int]]()
        var sequence = [root]
        while(sequence.count > 0) {
            var tempRes = [Int]()
            let count = sequence.count
            for _ in 0..<count {
                let node = sequence.removeFirst()
                tempRes.append(node.val)
                if node.left != nil {
                    sequence.append(node.left!)
                }
                if node.right != nil {
                    sequence.append(node.right!)
                }
            }
            result.append(tempRes)
        }
        return result
    }


//103. Binary Tree Zigzag Level Order Traversal
//Input: root = [3,9,20,null,null,15,7]
//Output: [[3],[20,9],[15,7]]
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    var result = [[Int]]()
    guard let root = root else { return [] }
    
    var leftToRight = false
    var queue = [TreeNode]()
    queue.append(root)
    
    while(!queue.isEmpty) {
        var level = [Int]()
        let count = queue.count
        
        for _ in 0..<count {
            let node = queue.removeFirst()
            level.append(node.val)
            if let right = node.right { queue.append(right)}
            if let left = node.left {queue.append(left)}
        }
        
        result.append(leftToRight ? level : level.reversed() )
        leftToRight = !leftToRight
    }
    
    return result
}
