import UIKit
//167. Two Sum II - Input Array Is Sorted
//Input: numbers = [2,7,11,15], target = 9
//Output: [1,2]
func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var head = 0
    var tail = 1
    while (head < numbers.count) {
        if tail >= numbers.count || target < numbers[head] + numbers[tail] {
            head += 1
            tail = head + 1
            continue
        }
        if target == numbers[head] + numbers[tail] {
            return [head+1,tail+1]
        }
        tail += 1
    }
    return []
}

//633. Sum of Square Numbers
//Input: c = 5
//Output: true
//Explanation: 1 * 1 + 2 * 2 = 5
func judgeSquareSum(_ c: Int) -> Bool {
   
}



