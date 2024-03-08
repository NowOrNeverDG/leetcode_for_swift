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
    var maxSum = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        traverse(root)
        return maxSum
    }

    func traverse(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let lft = max(traverse(root.left),0)
        let rgt = max(traverse(root.right),0)

        let pathMaxSum = root.val + lft + rgt
        maxSum = max(pathMaxSum, maxSum)

        return max(lft, rgt) + root.val
    }
}
