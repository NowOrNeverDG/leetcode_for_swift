/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *       public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        traverse(root?.left, root?.right)
        return root
    }

    func traverse(_ node1: Node?,_ node2: Node?) {
        guard let node1 = node1, let node2 = node2 else { return }

        node1.next = node2
        traverse(node1.left, node1.right)
        traverse(node2.left, node2.right)
        traverse(node1.right, node2.left)
    }
}
