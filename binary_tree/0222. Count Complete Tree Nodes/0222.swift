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
    func countNodes(_ root: TreeNode?) -> Int {
        var lft = root
        var rgt = root

        var lh = 0
        var rh = 0
        while (lft != nil) {
            lft = lft?.left
            lh += 1
        }
        while (rgt != nil) {
            rgt = rgt?.right
            rh += 1
        }

        if lh == rh {
            let res =  Int(pow(2, Double(lh)) - 1)
            return res
        }

        return traverse(root)
    }

    func traverse(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let lc = traverse(root.left)
        let rc = traverse(root.right)

        return 1 + lc + rc
    }
}
