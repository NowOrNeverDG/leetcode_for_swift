import UIKit

var greeting = "Hello, playground"

//351. Android Unlock Patterns
func numberOfPatterns(_ m: Int, _ n: Int) -> Int {
    var dir = Array(repeating: Array(repeating: "0", count: 10), count: 10)
    dir[1][3] = "2"
    dir[3][1] = "2"
    dir[1][7] = "4"
    dir[7][1] = "4"
    dir[3][9] = "6"
    dir[9][3] = "6"
    dir[9][7] = "8"
    dir[7][9] = "8"
    dir[4][6] = "5"
    dir[6][4] = "5"
    dir[2][8] = "5"
    dir[8][2] = "5"
    dir[1][9] = "5"
    dir[9][1] = "5"
    dir[3][7] = "5"
    dir[7][3] = "5"
    var result = 0
    for i in 1...9 {
        backtracking(combination: String(i), result: &result)
    }
    
    func backtracking(combination:String,result:inout Int) {
        if combination.count == n {
            result += 1
            return
        } else if combination.count >= m, combination.count < n {
            result += 1
        }
        
        if let lastChar = combination.last, let lastInt = Int(String(lastChar)) {
            var combination = combination
            for i in "123456789" {
                if combination.contains(i) { continue }
                if dir[lastInt][Int(String(i))!] != "0" && !combination.contains(dir[lastInt][Int(String(i))!]) { continue }
                combination = combination + String(i)
                backtracking(combination: combination, result: &result)
                combination.removeLast()
            }
        }
    }
    print(result)
    return result
}
