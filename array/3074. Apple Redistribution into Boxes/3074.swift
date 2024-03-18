class Solution {
    func minimumBoxes(_ apple: [Int], _ capacity: [Int]) -> Int {
        var apples = apple.reduce(0){ $0+$1 }
        var sortedCapacity = capacity.sorted(by:>)

        var res = 0
        for ele in sortedCapacity {
            apples -= ele
            res += 1
            if apples <= 0 { return res }
        }
        return -1
    }
}
