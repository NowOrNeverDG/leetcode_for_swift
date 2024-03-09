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


//dfs solution with get all node when initialied.
class BSTIterator {
    var arr = [Int]()
    init(_ root: TreeNode?) {
        traverse(root)
    }

    func traverse(_ root: TreeNode?) {
        guard let root = root else { return }

        traverse(root.left)
        arr.append(root.val)
        traverse(root.right)
    }
    
    func next() -> Int {

        return arr.removeFirst()
    }
    
    func hasNext() -> Bool {
        return !arr.isEmpty
    }
}
