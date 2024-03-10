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
    var sum = 0
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        traverse(root)
        return sum
    }

    func traverse(_ root: TreeNode?) {
        guard let root = root else { return }

        if root.left != nil && root.left!.left == nil && root.left!.right == nil {
            sum += root.left!.val
        }

        traverse(root.left)
        traverse(root.right)
    }
}
