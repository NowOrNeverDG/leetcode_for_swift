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
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        return traverse(root, target)
    }

    func traverse(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        guard let root = root else { return nil }

        root.left = traverse(root.left, target)
        root.right = traverse(root.right, target)

        if root.left == nil && root.right == nil && root.val == target {
            return nil
        }
        
        return root
    }
}
