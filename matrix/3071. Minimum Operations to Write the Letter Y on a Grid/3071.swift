class Solution {
    func minimumOperationsToWriteY(_ grid: [[Int]]) -> Int {
        let r = grid.count
        let c = grid[0].count
        let center = grid.count / 2

        var yDic = [Int:Int]()
        var elseDic = [Int:Int]()
        for i in 0..<r {
            for j in 0..<c {
                if (i < center && (j == i || j == (c-1-i))) || (j == center && i >= center) {
                    yDic[grid[i][j], default: 0] += 1
                } else {
                    elseDic[grid[i][j], default: 0] += 1
                }
            }
        }

        var m = 0
        for yele in yDic {
            for eele in elseDic {
                if yele.key == eele.key { continue }
                m = max(m, yele.value+eele.value)
            }
        }

        let yCount = (center)*2 + c - center
        let eCount = r * c - yCount
        if m == 0 { m = max(yCount, eCount) }

        return r*c - m
    }
}
