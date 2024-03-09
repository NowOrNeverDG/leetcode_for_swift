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


//DFS solution - preorder with public variable
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

