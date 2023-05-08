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
