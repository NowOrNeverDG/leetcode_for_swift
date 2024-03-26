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
    var targetDepth = -1
    var tragetNode: TreeNode? = nil

    func findNearestRightNode(_ root: TreeNode?, _ u: TreeNode?) -> TreeNode? {
        guard let u = u else { return nil }
        traverse(root, u, 0)
        return tragetNode
    }

    func traverse(_ root: TreeNode?,_ u: TreeNode,_ depth: Int) {
        guard let root = root else { return }
        if tragetNode != nil { return }
        if root.val == u.val {
            targetDepth = depth
        }

        else if depth == targetDepth {
            tragetNode = root
            return
        }

        traverse(root.left, u, depth+1)
        traverse(root.right, u, depth+1)
    }
}
