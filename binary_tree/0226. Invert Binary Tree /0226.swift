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

//Preorder
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        traverse(root)
        return root
    }

    func traverse(_ root: TreeNode?) {
        guard let root = root else { return }

        traverse(root.left)
        traverse(root.right)

        let left = root.left
        let right = root.right
        root.left = right
        root.right = left
    }
}

//Postorder
class Solution1 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        traverse(root)
        return root
    }

    func traverse(_ root: TreeNode?) {
        guard let root = root else { return }

        traverse(root.left)
        traverse(root.right)

        let left = root.left
        let right = root.right
        root.left = right
        root.right = left
    }
}
