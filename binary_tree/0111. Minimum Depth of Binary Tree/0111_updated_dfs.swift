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
    func minDepth(_ root: TreeNode?) -> Int {
        return traverse(root)
    }

    func traverse(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        if root.left != nil && root.right != nil {
            return min(traverse(root.left),traverse(root.right)) + 1
        }
        else if root.left != nil {
            return traverse(root.left) + 1
        }
        else {
            return traverse(root.right) + 1
        }
    }

    // var res = Int.max
    // func minDepth(_ root: TreeNode?) -> Int {
    //     if root == nil { return 0}
    //     traverse(root, 1)
    //     return res
    // }

    // func traverse(_ root: TreeNode?,_ depth: Int) {
    //     guard let root = root else { return }

    //     if root.left == nil && root.right == nil {
    //         res = min(res, depth)
    //     }

    //     traverse(root.left, depth+1)
    //     traverse(root.right, depth+1)
    // }

}
