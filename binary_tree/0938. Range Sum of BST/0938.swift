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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        return traverse(root, low, high)
    }

    func traverse(_ root: TreeNode?,_ low: Int,_ high: Int) -> Int {
        guard let root = root else { return 0 }
        var lft = 0
        var rgt = 0

        if root.val > high {
            lft = traverse(root.left, low, high)
        } else if root.val < low {
            rgt = traverse(root.right, low, high)
        } else {
            lft = traverse(root.left, low, high)
            rgt = traverse(root.right, low, high)
        }

        if root.val >= low && root.val <= high {
            return lft + rgt + root.val
        }

        return lft + rgt
    }
}
