class Solution {
    func maximumHappinessSum(_ happiness: [Int], _ k: Int) -> Int {
        var stk = happiness.sorted(by:>)
        stk = Array(stk.prefix(k))
        
        for i in 0..<k {
            stk[i] = stk[i] - i
            if stk[i] < 0 { stk[i] = 0 }
        }
        return stk.reduce(0) {$0+$1}
    }
}
