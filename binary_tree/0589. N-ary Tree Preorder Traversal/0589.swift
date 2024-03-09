/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    var res = [Int]()

    func preorder(_ root: Node?) -> [Int] {
        traverse(root)
        return res
    }

    func traverse(_ root: Node?) {
        guard let root = root else { return }
        res.append(root.val)

        for child in root.children {
            traverse(child)
        }
    }
}
