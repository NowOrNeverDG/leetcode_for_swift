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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        return traverse(root, val)
    }

    func traverse(_ node: TreeNode?,_ val: Int) -> TreeNode? {
        guard let node = node else { return TreeNode(val) }

        if val < node.val {
            node.left = traverse(node.left, val)
        } else if val > node.val {
            node.right = traverse(node.right, val)
        }
        return node
    }
}
