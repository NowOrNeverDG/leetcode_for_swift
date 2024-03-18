class Solution {
    func shortestSubstrings(_ arr: [String]) -> [String] {
        var answer = Array(repeating: "", count: arr.count)

        for (i, string) in arr.enumerated() {
            var substrings: [String] = []

            //iterate over all posibilities of substring
            for start in 0..<string.count {
                for end in (start+1)...string.count {
                    let startIndex = string.index(string.startIndex, offsetBy: start)
                    let endIndex = string.index(string.startIndex, offsetBy: end)
                    substrings.append(String(string[startIndex..<endIndex]))
                }
            }

            // Sort substrings by length and then lexicographically
            substrings.sort { $0.count < $1.count || ($0.count == $1.count && $0 < $1) }

            // Find the first unique substring
            for substring in substrings {
                if isUniqueSubstring(substring: substring, inArr: arr, excludeIndex: i) {
                    answer[i] = substring
                    break
                }
            }
        }

        return answer
    }
    
    func isUniqueSubstring(substring: String, inArr: [String], excludeIndex: Int) -> Bool {
        for (index, string) in inArr.enumerated() {
            if index == excludeIndex { continue }
            if string.contains(substring) {
                            return false
            }
        }
        return true
    }
}
