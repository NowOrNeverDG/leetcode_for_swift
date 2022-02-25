import UIKit

//241. Different Ways to Add Parentheses
//Input: expression = "2-1-1"
//Output: [0,2]
func diffWaysToCompute(_ expression: String) -> [Int] {
    if expression.count == 1 {return [Int(expression)!]}
    var characters:[Character] = Array()
    var result:[Int] = Array()
    for ele in expression {
        characters.append(ele)
    }
    
    for i in 0..<characters.count {
        if characters[i] == "+" || characters[i] == "-" || characters[i] == "*" {
            let part1 = String(characters[0...(i - 1)])
            let part2 = String(characters[(i + 1)...(characters.count - 1)])
            let result1 = diffWaysToCompute(part1)
            let result2 = diffWaysToCompute(part2)
            
            for p1 in result1 {
                for p2 in result2 {
                    var sum = 0
                    if characters[i] == "+" {sum = p1 + p2}
                    if characters[i] == "*" {sum = p1 * p2}
                    if characters[i] == "-" {sum = p1 - p2}
                    result.append(sum)
                }
            }
        }
    }
    
    return result.count == 0 ? [Int(expression)!] : result
}





