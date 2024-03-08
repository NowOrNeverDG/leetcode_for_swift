/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

//DFS solution 1 - postorder with backtracking
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        
        let leftNum = maxDepth(node.left)
        let rightNum = maxDepth(node.right)
        
        let res = max(leftNum,rightNum) + 1
        return res
    }
}

//DFS solution 2 - preorder with public variable
class Solution1 {
    var res = 0
    func maxDepth1(_ root: TreeNode?) -> Int {
        traverse(root, 1)
        return res
    }

    func traverse(_ root: TreeNode?,_ depth: Int) {
        guard let root = root else { return }

        res = max(res,depth)
        traverse(root.left, depth+1)
        traverse(root.right, depth+1)
    }
}

//BFS solution
class Solution2 {
    var depth = 0
    var stk = [TreeNode]()
    func maxDepth(_ root: TreeNode?) -> Int {
        iteration(root)
        return depth
    }

    func iteration(_ p: TreeNode?) {
        //inorder position
        var visited = TreeNode(-1)
        pushLeftBranch(p)

        while(!stk.isEmpty) {
            var p = stk.removeFirst()

            if (p.left == nil || p.left.val == visited.val) && p.right.val != visited.val {
                //inorder position
                pushLeftBranch(vis)
            }

            if p.right == nil || p.right == visited {
                //postorder position
                depth += 1
                visited = stk.removeFirst()
            }
        }
    }

    func pushLeftBranch(_ p: TreeNode?) {
        while(p != nil) {
            stk.append(p!)
            p = p?.left
        }
    }
}


