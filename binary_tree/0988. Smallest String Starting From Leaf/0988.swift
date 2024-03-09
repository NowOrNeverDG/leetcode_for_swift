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
    var res = [26]
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        traverse(root, [])
        var str = String(res.compactMap { UnicodeScalar($0+97) }.map { Character($0) }).reversed()
        return String(str)
    }

    func traverse(_ root: TreeNode?,_ tempArr:[Int]) {
        guard let root = root else { return }
        var tempArr = tempArr
        tempArr.append(root.val)

        if root.left == nil && root.right == nil {
            let size = min(tempArr.count, res.count)

            for i in (0..<size) {
                let tempEle = tempArr[tempArr.count-i-1]
                let resEle = res[res.count-i-1]
                if tempEle == resEle { continue }
                else {
                    res = tempEle < resEle ? tempArr : res
                    return
                }
            }
            res = tempArr.count < res.count ? tempArr : res
            return
        }

        traverse(root.left, tempArr)
        traverse(root.right, tempArr)
    }
}
