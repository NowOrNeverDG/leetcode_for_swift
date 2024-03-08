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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        return traverse(root, key)
    }

    func traverse(_ node: TreeNode?,_ key: Int) -> TreeNode? {
        guard var node = node else { return node }

        if node.val == key {
            if node.left == nil { return node.right }
            if node.right == nil { return node.left }

            let minNode = getMinNode(node.right!)
            node.right = traverse(node.right, minNode.val)

            minNode.left = node.left
            minNode.right = node.right
            node = minNode
        } else if node.val > key {
            node.left = traverse(node.left, key)
        } else if node.val < key {
            node.right = traverse(node.right, key)
        }
        return node
    }

    func getMinNode(_ node: TreeNode) -> TreeNode {
        guard let newNode = node.left else { return node }
        return getMinNode(newNode)
    }
}
