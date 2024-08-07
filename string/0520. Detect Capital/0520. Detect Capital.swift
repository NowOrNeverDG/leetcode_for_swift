class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        if word.count == 1 { return true }
        var wordArr = Array(word)
        var n = wordArr.count

        if word.allSatisfy { $0.isLowercase } {
            return true
        }
        else if word.allSatisfy { $0.isUppercase } {
            return true
        }
        else if word.first!.isUppercase {
           if word.dropFirst().allSatisfy { $0.isLowercase } { return true }
        }
        return false
    }
}
