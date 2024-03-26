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
    func findNearestRightNode(_ root: TreeNode?, _ u: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        guard let u = u else { return nil }

        var q: [TreeNode] = [root]

        while(!q.isEmpty) {
            let size = q.count
            var tempQ = [TreeNode]()
            for _ in 0..<size {
                let curNode = q.removeFirst()
                if curNode.val == u.val {
                    return q.isEmpty ? nil : q.first!
                }

                if curNode.left != nil { tempQ.append(curNode.left!)}
                if curNode.right != nil { tempQ.append(curNode.right!)}
            }
            q = tempQ
        }
        return nil
    }
}
