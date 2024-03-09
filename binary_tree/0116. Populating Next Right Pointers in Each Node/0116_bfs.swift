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
        var queue = [root]

        while(!queue.isEmpty) {
            let size = queue.count
            print(size)
            for i in 0..<size {
                guard let ele = queue.removeFirst() else { break }
                if let left = ele.left { queue.append(left) }
                if let right = ele.right { queue.append(right) }

                if i < size-1 { ele.next = queue.first! }
            }
        }
        return root
    }
}
