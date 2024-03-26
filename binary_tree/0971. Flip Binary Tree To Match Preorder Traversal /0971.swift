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
    var idx = 0
    var canFlip = true
    var res = [Int]()

    func flipMatchVoyage(_ root: TreeNode?, _ voyage: [Int]) -> [Int] {

        traverse(root, voyage)
        return canFlip ? res : [-1]
    }

    func traverse(_ root: TreeNode?,_ voyage: [Int]) {
        guard let root = root else { return }

        if root.val != voyage[idx] {
            canFlip = false
            return
        }

        idx += 1
        if let lft = root.left, lft.val != voyage[idx] {
            let tmp = root.left
            root.left = root.right
            root.right = tmp
            res.append(root.val)
        }

        traverse(root.left, voyage)
        traverse(root.right, voyage)
    }
}
