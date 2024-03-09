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
    func longestConsecutive(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        traverse(root, root.val-1, 0)
        return res
    }

    func traverse(_ root: TreeNode?,_ parentVal: Int,_ sq: Int) {
        guard let root = root else { return }
        var sq = sq

        if root.val == parentVal+1 {
            sq += 1
        } else {
            sq = 1
        }
        res = max(res, sq)

        traverse(root.left, root.val, sq)
        traverse(root.right, root.val, sq)
    }
}
