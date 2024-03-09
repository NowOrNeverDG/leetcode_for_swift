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
    var arr = [Int]()
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        traverse(root,"")
        return arr.reduce(0) { $0 + $1 }
    }

    func traverse(_ root: TreeNode?,_ sum: String) {
        guard let root = root else { return }
        let sum = sum + "\(root.val)"

        if root.left == nil && root.right == nil {
            let no = Int(sum, radix: 2)!
            arr.append(no)
            return
        }
        
        traverse(root.left, sum)
        traverse(root.right, sum)
    }
}
