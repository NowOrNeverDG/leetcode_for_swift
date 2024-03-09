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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var q:[TreeNode] = [root]
        var res = [[Int]]()
        while(!q.isEmpty) {
            let c = q.count

            var temp = [Int]()
            for nd in q {
                temp.append(nd.val)
            }
            res.insert(temp, at: 0)

            for _ in 0..<c {
                let curNode = q.removeFirst()

                if curNode.left != nil {
                    q.append(curNode.left!)
                }

                if curNode.right != nil {
                    q.append(curNode.right!)
                }
            }

        }
        return res
    }
}
