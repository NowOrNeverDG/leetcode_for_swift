import UIKit


//2657. Find the Prefix Common Array of Two Arrays
//Input: A = [1,3,2,4], B = [3,1,2,4]
//Output: [0,2,3,4]
func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        
    var size = A.count
    var result = Array(repeating: 0, count: size)
    var aux = Array(repeating: 0, count: size+1)

    var cmn = 0
    for i in 0..<size {
        aux[A[i]] += 1
        if aux[A[i]] == 2 { cmn += 1 }
        aux[B[i]] += 1
        if aux[B[i]] == 2 { cmn += 1}
        result[i] = cmn
    }
    return result
}

//13. Roman to Integer
//Input: s = "III"
//Output: 3
func romanToInt(_ s: String) -> Int {
    let dic:[String:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
    let matchUp = ["CM":900,"CD":400,"XC":90,"XL":40,"IX":9,"IV":4]
    
    var result = 0
    let n = s.count
    var p = 0
    while(p < n) {
        if p < n-1 {
            let starterIndex = s.index(s.startIndex, offsetBy: p)
            let subStr = s[starterIndex...s.index(after: starterIndex)]
            if let no = matchUp[String(subStr) ] {
                result += no
                p += 2
                continue
            }
        }
        let index = s.index(s.startIndex, offsetBy: p)
        result += dic[String(s[index])]!
        p += 1
    }
    return result
}


//58. Length of Last Word
//Input: s = "Hello World"
//Output: 5
func lengthOfLastWord(_ s: String) -> Int {
    var res = 0
    var sArr = Array(s)
    let n = s.count
    var signal = 0
    for i in (0..<n).reversed() {
        if signal == 1 && sArr[i] == " " {
            return res
        }
        if sArr[i] != " " {
            signal = 1
            res += 1
        }
    }
    return res
}

//14. Longest Common Prefix
//Input: strs = ["flower","flow","flight"]
//Output: "fl"
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 { return "" }
    if strs.count == 1 { return strs[0] }
    var minLength = Int.max
    for i in 0..<strs.count {
        minLength = min(minLength, strs[i].count)
    }
    
    var result = ""
    for i in 0..<minLength {
        let moban = strs[0]
        
        let index = moban.index(moban.startIndex, offsetBy: i)
        let prefix = moban[index]
        for j in 1..<strs.count {
            let index = strs[j].index(strs[j].startIndex, offsetBy: i)
            if strs[j][index] != prefix { return result }
        }
        result += String(prefix)
    }
    return result
}
