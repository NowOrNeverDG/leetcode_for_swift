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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return traverse(root, Int.min, Int.max)
    }

    func traverse(_ root: TreeNode?,_ low: Int,_ high: Int) -> Bool {
        guard let root = root else { return true }
        if let v = root.left?.val, (v >= root.val || v <= low) { return false }
        if let v = root.right?.val, (v <= root.val || v >= high) { return false }

        return traverse(root.right,root.val,high) && traverse(root.left,low,root.val)
    }
}
