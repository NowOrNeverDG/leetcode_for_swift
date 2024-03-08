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
    var res = [Int]()
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        traverse(root)
        return res
    }

    func traverse(_ root: TreeNode?) {
        guard let root = root else { return }
        res.append(root.val)

        traverse(root.left)
        traverse(root.right)
    }
}
