/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var sb = ""

        serialize(root, &sb)
        return sb
    }

    private func serialize(_ root: TreeNode?,_ sb: inout String) {
        guard let root = root else {
            sb += "nil,"
            return
        }
        sb += "\(root.val),"
        serialize(root.left, &sb)
        serialize(root.right, &sb)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var arr = data.split(separator: ",").map(String.init)
        return deserialize(&arr)
    }

    func deserialize(_ data: inout [String]) -> TreeNode? {
        if data.isEmpty { return nil }

        let first = data.removeFirst()
        if first == "nil" { return nil }
        
        let root = TreeNode(Int(first)!)
        root.left = deserialize(&data)
        root.right = deserialize(&data)

        return root
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
