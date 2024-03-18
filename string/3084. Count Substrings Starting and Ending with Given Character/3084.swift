class Solution {
    func countSubstrings(_ s: String, _ c: Character) -> Int {
        let sArr = Array(s)
        var count = 0
        
        for i in 0..<sArr.count {
            if sArr[i] == c {
                count += 1
            }
        }
        
        if count == 0 { return 0 }
        return (1...count).reduce(0,+)
    }
}
