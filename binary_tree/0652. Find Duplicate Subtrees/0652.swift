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
    var memo = [String : Int]()
    var res = [TreeNode?]()
    
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        traverse(root)
        return res
    }

    func traverse(_ root: TreeNode?) -> String {
        if root == nil { return "" }

        let lft = traverse(root!.left)
        let rgt = traverse(root!.right)

        var subTree = "\(lft)+\(rgt)+\(root?.val)"

        if memo[subTree] == 1 {
            res.append(root)
        }
        memo[subTree, default: 0] += 1
        return subTree
    }
}
