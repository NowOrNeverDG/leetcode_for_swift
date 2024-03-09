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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        return traverse(root, subRoot)
    }

    func traverse(_ root: TreeNode?,_ subRoot: TreeNode?) -> Bool {
        if root == nil { return subRoot == nil }

        if isSameTree(root, subRoot) { return true }

        return traverse(root!.left, subRoot) || traverse(root!.right, subRoot)
    }

    func isSameTree(_ root1: TreeNode?,_ root2: TreeNode?) -> Bool {
        if (root1 == nil && root2 != nil) || (root1 != nil && root2 == nil) { return false }
        else if root1 == nil && root2 == nil { return true }
        else if root1 != nil && root2 != nil && root1!.val != root2!.val { return false }

        return isSameTree(root1?.left, root2?.left) && isSameTree(root1?.right, root2?.right)
    }
}
