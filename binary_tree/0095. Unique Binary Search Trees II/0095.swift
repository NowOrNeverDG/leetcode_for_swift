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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 { return [TreeNode?]() }
        return traverse(1, n)
    }

    func traverse(_ lo: Int,_ hi: Int) -> [TreeNode?] {
        var res = [TreeNode?]()
        if lo > hi {
            res.append(nil)
            return res
        }

        for root in lo...hi {
            let lft = traverse(lo, root-1)
            let rgt = traverse(root+1, hi)

            for lftRoot in lft {
                for rgtRoot in rgt {
                    let rootNode = TreeNode(root)
                    rootNode.left = lftRoot
                    rootNode.right = rgtRoot
                    res.append(rootNode)
                }
            }
        }
        return res
    }
}
