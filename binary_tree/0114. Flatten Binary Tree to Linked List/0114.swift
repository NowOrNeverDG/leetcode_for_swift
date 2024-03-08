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
    func flatten(_ root: TreeNode?) {
        traverse(root)
    }

    func traverse(_ root: TreeNode?) {
        guard let root = root else { return }

        traverse(root.left)
        traverse(root.right)

        //store left & right node of root
        let rootRight = root.right
        let rootLeft = root.left

        //put root‘s left node to right & reset left part as well
        root.right = rootLeft
        root.left = nil

        //find out the end of the node on root right
        var node = root
        while node.right != nil {
            node = node.right!
        }

        //joint original right of root next
        node.right = rootRight
    }
}
