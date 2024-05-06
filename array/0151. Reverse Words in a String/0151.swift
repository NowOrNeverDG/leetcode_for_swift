
class Solution {
    func reverseWords(_ s: String) -> String {
        var sArr = s.split(separator: " ").joined(separator: " ").reversed().map{ String($0) }
        var size = sArr.count

        var p1 = 0
        var p2 = 0
        while(p1<size && p2<size) {
            while(p1 < size && sArr[p1] == " ") {
                p1 += 1
            }
            p2 = p1

            while(p2 < size && sArr[p2] != " ") {
                p2 += 1
            }
            reverseString(&sArr, p1, p2-1)
            p1 = p2
        }

        return sArr.joined()
    }

    func reverseString(_ sArr: inout [String],_ p1:Int,_ p2:Int){
        var p1 = p1
        var p2 = p2
        while(p1<p2) {
            var temp = sArr[p1]
            sArr[p1] = sArr[p2]
            sArr[p2] = temp

            p1 += 1
            p2 -= 1
        }
    }
}
