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
    var res = Int.max
    var gap = Double.infinity
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root = root else { return 0 }
        traverse(root, target)
        return res
    }

    func traverse(_ root: TreeNode?,_ target: Double) {
        guard let root = root else { return }
        let curGap: Double = abs(Double(root.val)-target)

        if curGap == 0.0 {
            res = root.val
            return
        }
        else if curGap < gap {
            res = root.val
            gap = curGap
        }
        else if curGap == gap {
            res = min(res,root.val)
        }

        if Double(root.val) > target {
            traverse(root.left, target)
        } else if Double(root.val) < target {
            traverse(root.right, target)
        }
    }
}
