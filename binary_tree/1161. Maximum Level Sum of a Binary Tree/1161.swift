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
    func maxLevelSum(_ root: TreeNode?) -> Int {
        var q: [TreeNode] = [root!]
        var resData: (Int, Int) = (root!.val,1)
        var curData: (Int, Int) = (0,0)
        while(!q.isEmpty) {
            let count = q.count
            curData.0 = 0
            for _ in 0..<count {
                let curNode = q.removeFirst()
                curData.0 += curNode.val

                if curNode.left != nil {
                    q.append(curNode.left!)
                }

                if curNode.right != nil {
                    q.append(curNode.right!)
                }
            }
            curData.1 += 1
            if curData.0 > resData.0 {
                resData = curData
            }
        }
        return resData.1
    }
}
