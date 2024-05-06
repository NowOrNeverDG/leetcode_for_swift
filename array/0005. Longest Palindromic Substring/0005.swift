class Solution {
    func longestPalindrome(_ s: String) -> String {
        var res = ""
        for i in 0..<s.count {
            let str1 = isPalidrome(s, i, i)
            let str2 = isPalidrome(s, i, i+1)

            res = res.count > str1.count ? res : str1
            res = res.count > str2.count ? res : str2
        }

        return res
    }

    func isPalidrome(_ s: String,_ left: Int,_ right: Int) -> String {
        let sArr = Array(s)
        var left = left
        var right = right
        while(left >= 0 && right < sArr.count && sArr[left] == sArr[right]) {
            left -= 1
            right += 1
        }

        return String(sArr[(left+1)..<right])
    }
}
