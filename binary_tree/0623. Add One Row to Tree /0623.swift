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
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        let dump = TreeNode(Int.min)
        dump.left = root
        traverse(dump, 0, val, depth)
        return dump.left
    }

    func traverse(_ root: TreeNode?,_ depth: Int,_ targetVal: Int,_ targetDepth: Int) {
        guard let root = root else { return }

        if depth == targetDepth - 1 {
            let rootLeft = root.left
            let rootRight = root.right

            root.left = TreeNode(targetVal)
            root.right = TreeNode(targetVal)
            root.left!.left = rootLeft
            root.right!.right = rootRight
        }

        traverse(root.left, depth+1, targetVal, targetDepth)
        traverse(root.right, depth+1, targetVal, targetDepth)
    }
}
