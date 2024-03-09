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
    var size = 0
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        traverse(root, [Int:Int]())
        return size
    }

    func traverse(_ root: TreeNode?,_ tempDic: [Int:Int]) {
        guard let root = root else { return }
        var tempDic = tempDic
        tempDic[root.val, default: 0] += 1

        if root.left == nil && root.right == nil {
            if isPseudoPalindromic(tempDic) {
                size += 1
            }
            return
        }

        traverse(root.left, tempDic)
        traverse(root.right, tempDic)
    }

    func isPseudoPalindromic(_ dic:[Int:Int]) -> Bool {
        var oddCount = 0
        for i in dic {
            if i.value % 2 != 0 { oddCount += 1 }
            if oddCount > 1 { return false }
        }
        return true
    }
}
