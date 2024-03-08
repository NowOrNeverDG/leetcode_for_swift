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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return traverse(nums, 0, nums.count-1)
    }

    func traverse(_ nums: [Int],_ lo: Int,_ hi: Int) -> TreeNode? {
        if lo > hi { return nil }

        var index = -1
        var maxVal = Int.min
        for i in  lo...hi {
            if maxVal < nums[i] {
                index = i
                maxVal = nums[i]
            }
        }

        var root = TreeNode(maxVal)
        root.left = traverse(nums, lo, index-1)
        root.right = traverse(nums, index+1, hi)

        return root
    }
}
