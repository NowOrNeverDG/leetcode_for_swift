import UIKit

//17. Letter Combinations of a Phone Number
//Input: digits = "23"
//Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
func letterCombinations(_ digits: String) -> [String] {
    let keyMaps:[Character:String] = ["2":"abc","3":"def","4":"ghi","5":"jki","6":"mno","7":"pqrs","8":"tuv","9":"wxyz"]
    
    var value = [String]()
    for nu in digits {
        if let s = keyMaps[nu] {
            value.append(s)
        }
    }
    
    var result = [String]()
    
    
    return result
}
    
    
