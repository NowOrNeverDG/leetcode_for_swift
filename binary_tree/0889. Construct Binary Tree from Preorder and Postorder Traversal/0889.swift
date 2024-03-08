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
    var valToIndex = [Int:Int]()
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        for i in 0..<postorder.count {
            valToIndex[postorder[i]] = i
        }
        return build(preorder, 0, preorder.count-1, postorder, 0, postorder.count-1)
    }

    func build(_ preorder: [Int],_ preStart: Int,_ preEnd: Int,_ postorder: [Int],_ postStart: Int,_ postEnd: Int) -> TreeNode? {
        if preStart > preEnd { return nil }
        if preStart == preEnd { return TreeNode(preorder[preStart])}

        var rootVal = preorder[preStart]
        var leftRootVal = preorder[preStart + 1]
        var index = valToIndex[leftRootVal]!
        var leftSize = index - postStart + 1
        var root = TreeNode(rootVal)
        
        root.left = build(preorder, preStart+1, preStart+leftSize, postorder, postStart, index)
        root.right = build(preorder, preStart+leftSize+1, preEnd, postorder, index+1, postEnd-1)

        return root
    }
}
