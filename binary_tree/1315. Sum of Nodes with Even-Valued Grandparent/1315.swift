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
    var sum = 0
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        traverse(root, parent: nil, grandParant: nil)
        return sum
    }

    func traverse(_ root: TreeNode?, parent: TreeNode?, grandParant: TreeNode?) {
        guard let root = root else { return }

        if grandParant != nil && grandParant!.val % 2 == 0 {
            sum += root.val
        }
        traverse(root.left, parent: root, grandParant: parent)
        traverse(root.right, parent: root, grandParant: parent)
    }
}
