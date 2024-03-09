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
    var res = [[Int]]()
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        traverse(root, 0)

        var mxArr = [Int]()
        for arr in res {
            mxArr.append(arr.max()!)
        }
        return mxArr
    }

    func traverse(_ root: TreeNode?,_ height: Int) {
        guard let root = root else { return }
        if height >= res.count {
            res.append([Int]())
        }
        
        res[height].append(root.val)
        traverse(root.left,height+1)
        traverse(root.right,height+1)
    }
}
