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
    var parentX: TreeNode? = nil
    var parentY: TreeNode? = nil
    var depthX = 0
    var depthY = 0
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        traverse(root, 0, nil, x, y)
        
        if depthX != depthY || (depthX == 0 && depthY == 0) { return false }
        if parentX?.val == parentY?.val { return false }
        return true
    }

    func traverse(_ root: TreeNode?,_ depth: Int,_ parent: TreeNode?,_ x: Int,_ y: Int)  {
        guard let root = root else { return }

        if root.val == x {
            parentX = parent
            depthX = depth
        }

        if root.val == y {
            parentY = parent
            depthY = depth
        }

        traverse(root.left, depth+1, root, x, y )
        traverse(root.right, depth+1, root, x, y)
    }
}
