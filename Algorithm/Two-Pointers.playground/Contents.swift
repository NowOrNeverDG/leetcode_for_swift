import UIKit
import Darwin
//345. Reverse Vowels of a String
//Input: s = "hello"
//Output: "holle"
func reverseVowels(_ s: String) -> String {
    var sArr = Array(s)
    var head = 0
    var tail = sArr.count-1
    
    while (head < tail) {
        if "aeiouAEIOU".contains(sArr[head]) {
            while (!"aeiouAEIOU".contains(sArr[tail]) && head < tail) {
                tail -= 1
            }
            
            sArr.swapAt(head, tail)
            tail -= 1
        }
        head += 1
    }
    return sArr.reduce("") { partialResult, char in
        return partialResult + String(char)
    }
}

//633. Sum of Square Numbers
//Input: c = 5
//Output: true
//Explanation: 1 * 1 + 2 * 2 = 5
func judgeSquareSum(_ c: Int) -> Bool {
    var head = 0
    var tail = Int(Double(c).squareRoot())
    
    while (head <= tail) {
        if c > head*head + tail*tail {
            head += 1
        } else if c < head*head + tail*tail {
            tail -= 1
        } else {
            return true
        }
    }
    return false
}

//167. Two Sum II - Input Array Is Sorted
//Input: numbers = [2,7,11,15], target = 9
//Output: [1,2]
func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var head = 0
    var tail = numbers.count - 1
    
    while(head < tail) {
        if target > numbers[head] + numbers[tail] {
            head += 1
        } else if target < numbers[head] + numbers[tail] {
            tail -= 1
        } else {
            return [head+1,tail+1]
        }
    }
    return []
}




