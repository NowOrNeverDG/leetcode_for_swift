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
    var res = 0
    func goodNodes(_ root: TreeNode?) -> Int {
        traverse(root, Int.min)
        return res
    }

    func traverse(_ root: TreeNode?,_ max: Int) {
        guard let root = root else { return }
        var max = max
        if root.val >= max {
            res += 1
            max = root.val
        }

        traverse(root.left, max)
        traverse(root.right, max)
    }
}
