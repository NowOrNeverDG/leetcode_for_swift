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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return build(preorder, 0, preorder.count-1, inorder, 0, inorder.count-1)
    }

    func build(_ preorder: [Int],_ preLow: Int,_ preHigh: Int,_ inorder: [Int],_ inLow: Int,_ inHigh: Int) -> TreeNode? {
        if preLow > preHigh { return nil }

        let rootVal = preorder[preLow]
        var in_rootIndex = 0

        for i in inLow...inHigh {
            if inorder[i] == rootVal { in_rootIndex = i }
        }

        let leftSize = in_rootIndex - inLow

        let root = TreeNode(rootVal)

        root.left = build(preorder, preLow+1, preLow+leftSize, inorder, inLow, in_rootIndex-1)
        root.right = build(preorder, preLow+leftSize+1, preHigh, inorder, in_rootIndex+1, inHigh)

        return root
    }
}
