import UIKit
//696. Count Binary Substrings
//Input: s = "00110011"
//Output: 6
func countBinarySubstrings(_ s: String) -> Int {
    var zeroCount = 0
    var oneCount = 0
    var totalCount = 0
    var lastChar: Character = "x"
    for char in s {
        if char == "0" {
            if lastChar == "1" { zeroCount = 0}
            if oneCount > 0 {
                totalCount += 1
                oneCount -= 1
            }
            zeroCount += 1
        }
        if char == "1" {
            if lastChar == "0" {oneCount = 0}
            if zeroCount > 0 {
                totalCount += 1
                zeroCount -= 1
            }
            oneCount += 1
        }
        lastChar = char
    }
    return totalCount
}

//9. Palindrome Number
//Input: x = 121
//Output: true
func isPalindrome(_ x: Int) -> Bool {
    if x == 0 { return true }
    if (x<0||x%10==0) { return false}
    
    var right = 0
    var origin = x
    while ( x == 0 ) {
        right = right * 10 + origin%10
        origin = origin/10
    }
    print(x)
    print(right)
    if right == x || right == x/10 {return true}
    return false
}


//647. Palindromic Substrings
//Input: s = "abc"
//Output: 3
//Explanation: Three palindromic strings: "a", "b", "c".
func countSubstrings(_ s: String) -> Int {
    var res = 0
    for i in 0..<s.count {
        res += 1 + countSubstringsHelper(s:Array(s), left:i-1, right: i+1)
        res += countSubstringsHelper(s: Array(s), left: i, right: i+1)
    }
    return res
}
func countSubstringsHelper(s:[String.Element], left: Int, right:Int) ->Int {
    var count = 0
    var left = left
    var right = right
    while left >= 0 && right < s.count {
        if s[left] == s[right] {
            count += 1
            left -= 1
            right += 1
        } else {
            break
        }
    }
    return count
}
func countSubstrings1(_ s: String) -> Int {
    guard s.count > 0 else{ return 0 }
       
    var count = 0
    let s = Array(s)
    var dp:[[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)

    for i in (0..<s.count).reversed() {
           for j in (i..<s.count).reversed() {
           if i == j {
               dp[i][j] = true
               count += 1
           } else if j == i + 1 && s[i] == s[j] {
               dp[i][j] = true
               count += 1
           } else if dp[i+1][j-1] && s[i] == s[j] {
               dp[i][j] = true
               count += 1
           }
       }
    }
    return count
}

//205. Isomorphic Strings (Easy)
//Input: s = "egg", t = "add"
//Output: true
func isIsomorphic(_ s: String, _ t: String) -> Bool {
    let arrS = Array(s)
    let arrT = Array(t)
    guard arrS.count > 0, arrT.count > 0, arrS.count == arrT.count else { return true }
    
    var arrDic:[Character:Character] = [:]
    
    for i in 0..<s.count {
        if !arrDic.keys.contains(arrS[i]) {
            if !arrDic.values.contains(arrT[i]) {
                arrDic[arrS[i]] = arrT[i]
            } else { return false }
        } else if arrDic[arrS[i]] != arrT[i] {return false}
    }
    return true
}

//409. Longest Palindrome
//Input : "abccccdd"
//Output : 7
func longestPalindrome(_ s: String) -> Int {
    var palidromeDic = [Character:Int]()
    var result = 0
    for ele in s {
        if palidromeDic[ele] == nil {
            palidromeDic[ele] = 1
        }else{
            palidromeDic[ele]! += 1
        }
    }
    var maxOddNo:Int = 0
    for (_, value) in palidromeDic {
        if value%2 == 0 {
            result += value
        } else {
            result += value-1
        }
    }
    
    if result == s.count {
        return result
    } else {
        return result + 1
    }
}

//242. Valid Anagram
//Input: s = "anagram", t = "nagaram"
//Output: true
func isAnagram(_ s: String, _ t: String) -> Bool {
    var originDic:[Character:Int] = [:]
    for char in s {
        if originDic[char] != nil {
            originDic[char]! += 1
        }else{
            originDic[char] = 1
        }
    }

    for char in t {
        if originDic[char] == nil {
            return false
        } else {
            originDic[char]! -= 1
        }
    }

    for (_, value) in originDic {
        if value != 0 {return false}
    }

    return true
}
func isAnagram1(_ s: String, _ t: String) -> Bool {
    var charArr = Array(repeating: 0, count: 52)
    
    for charCode in s.unicodeScalars {
        charArr[Int(charCode.value)] += 1
    }
    for charCode in t.unicodeScalars {
        charArr[Int(charCode.value)] -= 1
    }
    
    for i in charArr {
        if i != 0 {return false}
    }
    
    return true
}
isAnagram("anagram", "nagaram")
    
    
