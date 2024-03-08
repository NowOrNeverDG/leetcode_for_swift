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
    var maxDiameter = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        traverse(root)
        return maxDiameter
    }

    func traverse(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var lft = traverse(root?.left)
        var rgt = traverse(root?.right)
        maxDiameter = max(lft + rgt, maxDiameter)
        return (max(lft, rgt) + 1)
    }
}
