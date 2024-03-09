class Solution {
    var res = [Int]()
    func getRow(_ rowIndex: Int) -> [Int] {
        traverse(rowIndex, 0, [1])
        return res
    }

    func traverse(_ rowIndex: Int,_ currRow: Int,_ arr: [Int]) {
        var curArr = [Int](repeating: 1, count: currRow+1)
        if currRow > 1 {
            for i in 0..<arr.count-1 {
                curArr[i+1] = arr[i] + arr[i+1]
            }
        }

        if rowIndex == currRow {
            res = curArr
            return
        }
        traverse(rowIndex , currRow+1, curArr)
    }
}

