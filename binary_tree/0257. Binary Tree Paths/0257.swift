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
    var res = [String]()
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        traverse(root,"")
        return res
    }

    func traverse(_ root: TreeNode?,_ path: String) {
        var path = path
        guard let root = root else {
            return
        }
        path = path + "\(root.val)->"
        if root.left==nil && root.right == nil {
            path.removeLast()
            path.removeLast()
            res.append(path)
            return
        }

        traverse(root.left,path)
        traverse(root.right,path)
    }
}
