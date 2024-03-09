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

class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil { return false }
        return traverse(root, targetSum, 0)
    }

    func traverse(_ root: TreeNode?,_ targetSum: Int,_ sum: Int) -> Bool{
        guard let root = root else { return false }
        let curVal = root.val + sum

        if root.left == nil && root.right == nil {
            if curVal == targetSum {
                return true
            }
        }
        return traverse(root.left, targetSum, curVal) || traverse(root.right, targetSum, curVal)
    }
}
