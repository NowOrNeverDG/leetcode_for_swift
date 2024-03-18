class Solution {
    func minimumDeletions(_ word: String, _ k: Int) -> Int {
        var frequencyCount = [Character: Int]()

        word.forEach { frequencyCount[$0, default: 0] += 1 }
        let sortedFreq = frequencyCount.values.sorted(by: <)

        var res = Int.max
        for i in 0..<sortedFreq.count {
            var deletion = (0..<i).reduce(0){ $0 + sortedFreq[$1]}
            for f in i..<sortedFreq.count {
                if abs(sortedFreq[f]-sortedFreq[i]) < k { continue }
                deletion += abs(sortedFreq[i]+k-sortedFreq[f])
            }
            res = min(res, deletion)
        }

        return res
    }
}
