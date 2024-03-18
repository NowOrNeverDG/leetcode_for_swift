class Solution {
    func isSubstringPresent(_ s: String) -> Bool {
        var arr = Array(s)
        var dic = [[Character]: Bool]()
        
        for i in 0..<arr.count-1 {
            let subArr = [arr[i+1],arr[i]]
            if arr[i+1] == arr[i] { return true }
            if dic[subArr] == false { return true }
            dic[[arr[i],arr[i+1]], default: false] = false
        }

        return false
    }
}
