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

 struct VNode {
    var row: Int
    var col: Int
    var node: TreeNode

    init(_ row: Int,_ col: Int,_ node: TreeNode) {
        self.row = row
        self.col = col
        self.node = node
    }
 }
 
class Solution {
    var vnodes = [VNode]()

    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        traverse(root, 0, 0)
        vnodes = vnodes.sorted { node1, node2 in
            if node1.col == node2.col && node1.row == node2.row {
                return node1.node.val < node2.node.val
            }
            if node1.col == node2.col {
                return node1.row < node2.row
            }
            return node1.col < node2.col
        }

        var res = [[Int]]()
        var curCol = Int.max
        for ele in vnodes {
            if curCol == ele.col {
                if res.last != nil {
                    res[res.count-1].append(ele.node.val)
                }
            } else {
                res.append([ele.node.val])
                curCol = ele.col
            }
        }
        return res
    }

    func traverse(_ root: TreeNode?,_ col: Int,_ row: Int) {
        guard let root = root else { return }
        vnodes.append(VNode(row, col, root))
        traverse(root.left, col - 1, row + 1)
        traverse(root.right, col + 1, row + 1)
    }
}
