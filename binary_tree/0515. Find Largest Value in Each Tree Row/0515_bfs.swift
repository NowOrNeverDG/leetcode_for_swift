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
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var res = [Int]()
        var q = [root]
        
        while(!q.isEmpty) {
            let c = q.count

            var mx = Int.min
            for _ in 0..<c {
                let node = q.removeFirst()
                mx = max(mx, node.val)
                if node.left != nil {
                    q.append(node.left!)
                }

                if node.right != nil {
                    q.append(node.right!)
                }
            }
            res.append(mx)
        }
        return res
    }
}
