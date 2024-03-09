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
    func sumNumbers(_ root: TreeNode?) -> Int {
        traverse(root, 0)
        return sum
    }

    func traverse(_ root: TreeNode?,_ tempSum: Int) {
        guard let root = root else { return }

        var tempSum = tempSum * 10 + root.val

        if root.left == nil && root.right == nil {
            sum += tempSum
            return
        }

        traverse(root.left, tempSum)
        traverse(root.right, tempSum)
    }
}
