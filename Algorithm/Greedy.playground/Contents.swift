import UIKit
import Darwin

//Input: points = [[10,16],[2,8],[1,6],[7,12]]
//Output: 2

func findMinArrowShots(_ points: [[Int]]) -> Int {
        
}


//435. Non-overlapping Intervals
//Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
//Output: 1
func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    if intervals.count == 0 {return 0}
    
    let input = intervals.sorted { x, y in
        return x[1] < y[1]
    }
    
    var result = 1
    var end = input[0][1]
    for i in 0..<input.count {
        if input[i][0] < end { continue }
        end = input[i][1]
        result += 1
    }
    return input.count - result
}

//455. Assign Cookies
//Input: g = [1,2,3], s = [1,1]
//Output: 1
func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    if g.count == 0 || s.count == 0 { return 0 }
    let children = g.sorted()
    let cookies = s.sorted()
    
    var contendChildren = 0
    var consumeCookies = 0
    while (contendChildren < g.count && consumeCookies < s.count) {
        if children[contendChildren] <= cookies[consumeCookies] {
            contendChildren += 1
        }
        consumeCookies += 1
    }
    return contendChildren
}
