/// DP
class Solution {
    func lengthAfterTransformations(_ s: String, _ t: Int) -> Int {
        let MOD = Int(1e9 + 7)

        var count = [Int](repeating: 0, count: 26)
        let asciiA = Character("a").asciiValue!
        for c in s {
            let id = Int(c.asciiValue! - asciiA)
            count[id] += 1
        }

        for _ in 0..<t {
            var newCount = [Int](repeating: 0, count: 26)
            for i in (0..<26) {
                if i == 25 {
                    newCount[0] = count[25]
                    newCount[1] = (count[25] + newCount[1]) % MOD
                } else {
                    newCount[i+1] = count[i]
                }
            }
            count = newCount
        }

        var total = 0
        for num in count {
            total = (total + num) % MOD
        }

        return total
    }
}

///Binary exponentiation
class Solution {
    let MOD = 1_000_000_007
    func lengthAfterTransformations(_ s: String, _ t: Int) -> Int {
        let n = 26
        var vec = [Int](repeating: 0, count: n)
        let aAscii = Character("a").asciiValue!
        for c in s {
            guard let cAscii = c.asciiValue else { continue }
            let index = Int(cAscii - aAscii)
            vec[index] += 1
        }

        var transMat = Array(repeating: Array(repeating: 0, count: n), count: n)

        // set up rule
        for i in 0..<25 {
            transMat[i+1][i] = 1
        }
        transMat[0][25] = 1
        transMat[1][25] = 1

        //calculation
        let mat = matrixPower(transMat, t)
        let result = multiplyMatrix(mat, vec)

        var ans = 0
        for x in result {
            ans = (ans + x) % MOD
        }
        return ans
    }

    /// Matrix multiplication calculation
    private func multiply(_ A: [[Int]],_ B: [[Int]]) -> [[Int]] {
        var n = A.count
        var res = Array(repeating: Array(repeating: 0, count: 26), count: 26)
        for i in 0..<n {
            for j in 0..<n {
                if A[i][j] != 0 {
                    for k in 0..<n {
                        res[i][k] = (res[i][k] + A[i][j] * B[j][k]) % MOD
                    }
                }
            }
        }
        return res
    }

    /// Matrix power calculation
    private func matrixPower(_ base: [[Int]],_ exp: Int) -> [[Int]] {
        var n = base.count
        var base = base
        var exp = exp

        var res = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0..<n {
            res[i][i] = 1
        }

        while( exp > 0 ) {
            if ((exp & 1) == 1) {
                res = multiply(res, base)
            }
            base = multiply(base, base)
            exp >>= 1
        }
        return res
    }

    private func multiplyMatrix(_ mat: [[Int]],_ vec: [Int]) -> [Int] {
        var n = mat.count
        var res = Array(repeating: 0, count: n)

        for i in 0..<n {
            for j in 0..<n {
                res[i] = (res[i] + mat[i][j] * vec[j]) % MOD
            }
        }
        return res
    }
}
