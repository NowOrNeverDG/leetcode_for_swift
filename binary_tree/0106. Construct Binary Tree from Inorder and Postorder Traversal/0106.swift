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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return build(inorder, 0, inorder.count-1, postorder, 0, postorder.count-1)
    }

    func build(_ inorder: [Int],_ inLow: Int,_ inHigh: Int,_ postorder: [Int],_ postLow: Int,_ postHigh: Int) -> TreeNode? {
        if postLow > postHigh { return nil }

        let rootVal = postorder[postHigh]
        var in_rootIndex = 0

        for i in inLow...inHigh {
            if inorder[i] == rootVal {
                in_rootIndex = i
                break
            }
        }

        let leftSize = in_rootIndex - inLow
        let root = TreeNode(rootVal)

        root.left = build(inorder, inLow, in_rootIndex-1, postorder, postLow, postLow + leftSize - 1)
        root.right = build(inorder, in_rootIndex + 1, inHigh, postorder, postLow + leftSize, postHigh - 1 )

        return root
    }
}
