import UIKit

//input 1
//for loop how many 1 in input & how many 2 in input
//combine count of 1 and "1" + count of 2 and 2
//append combine into a array
// In mathematics, the look-and-say sequence is the sequence of integers beginning as follows:
// 1, 11, 21, 1211, 111221, 312211 ...

// To generate a member of the sequence from the previous member, read off the digits of the previous member, counting the number of digits in groups of the same digit. For example:
// 1 is read off as "one 1" or 11.
// 11 is read off as "two 1s" or 21.
// 21 is read off as "one 2, then one 1" or 1211.
// 1211 is read off as "one 1, then one 2, then two 1s" or 111221.
// 111221 is read off as "three 1s, then two 2s, then one 1" or 312211.

// Write a function getLines, which takes an integer "n" as parameter, and returns a comma separated list of the first "n" terms of the sequence. For 0, negative, or NaN parameters, -1 shall be returned.

// Example:
// n=4; output: “1, 11, 21, 1211”
// n=2; output: “1, 11”
// n=1; output: “1”

func gernerateSeq(input:Int) -> [String] {
    var result:[String] = ["1"]
    var input = input
    var tmp = "1"
    while (input != 1){
        var str = ""
        input -= 1
        while (tmp.count != 0) {
            var tmpLast = tmp.removeLast()
            var count = 1
            while (tmp.last != nil && tmp.last == tmpLast) {
                count += 1
                tmpLast = tmp.removeLast()
            }
            str = "\(count)" + String(describing: tmpLast) + str
            print(str)
        }
        result.append(str)
        tmp = str
    }
    return result
}
