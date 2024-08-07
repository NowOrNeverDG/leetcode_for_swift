class Solution {
    func removeTrailingZeros(_ num: String) -> String {
        var num = num
        while(num.last == "0") {
            num.removeLast()
        }
        return num
    }
}
