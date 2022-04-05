import UIKit
import Foundation
import Darwin
func sum(_ str: String,num1:Int,num2:Int) -> Int {
    var result = num1;
    if str == "+" {
        result = num1 + num2;
    }else if str == "-" {
        result = num1 - num2;
    }
    return result;
}

func sum1(from:Int,array:Array<Character>) -> Int {
     
     var num1 = 0;
     var num2 = 0;
     var ff = "";
     
     let listArr :NSMutableArray = NSMutableArray.init();
     
     for i in from..<array.count {
         let str:String = String(array[i])
         if str == "(" {
             listArr.add(["num":num1,"sign":ff]);
             num1 = 0;
             ff = "";
         }else if str == ")" {
             num1 = sum(ff, num1:num1, num2:num2)
             num2 = 0;
             ff = "";
             if listArr.count > 0 {
                 let dict = listArr.lastObject;
                 listArr.removeLastObject();
                 let tResult = dict as![String:Any]
                 let num = tResult["num"];
                 let sign = tResult["sign"];
                 if sign as! String != "" {
                     num1 = sum(sign as! String, num1:num as! Int, num2:num1)
                 }
             }
         }else if str == "+" {
             if ff == "" {
                 ff = str;
                 continue;
             }
             num1 = sum(ff, num1:num1, num2:num2)
             num2 = 0;
             ff = str;
         }else if str == "-" {
             if ff == "" {
                 ff = str;
                 continue;
             }
             num1 = sum(ff, num1:num1, num2:num2)
             num2 = 0;
             ff = str;
         }else if str == " " {

         }else{
             if ff != "" {
                 num2 = num2*10 + (str as NSString).integerValue;
             }else{
                 num1 = num1*10 + (str as NSString).integerValue;
             }
         }
     }
     
     if ff != "" {
         num1 = sum(ff, num1:num1, num2:num2)
     }
     
     return num1;
 }

func calculate(_ str: String) -> Int {
     let array = str.map{$0};
     let result = sum1(from: 0, array: array)
     return result;
 }
calculate("(1+2)*3")



//127. Word Ladder
//Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
//Output: 5
func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    return 0
}

//815. Bus Routes
//Input: routes = [[1,2,7],[3,6,7]], source = 1, target = 6
//Output: 2
func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    var stationToBus = [Int: [Int]]()
    for (bus,stops) in routes.enumerated() {
        for stop in stops {
            stationToBus[stop, default: [Int]()].append(bus)
        }
    }
    print("TESTING: StationToBus = \(stationToBus.count)")
    var visitedBus = [Int]()
    var remainBus = [Int]()
    remainBus.append(contentsOf: stationToBus[source, default: []])
    var totalBuses = 0
    
    while (!remainBus.isEmpty) {
        totalBuses += 1
        var size = remainBus.count
        
        while (size != 0) {
            let currBus = remainBus.removeLast()
            if visitedBus.contains(currBus) {continue}
            visitedBus.append(currBus)
            
            for station in routes[currBus] {
                if station == target {return totalBuses}
                
                for bus in stationToBus[station,default: []] {
                    if remainBus.contains(bus) {continue}
                    remainBus.append(bus)
                }
            }
            size -= 1
        }
    }
    return -1
}
//numBusesToDestination([[1,2,7],[3,6,7]], 1, 6)
//numBusesToDestination([[7,12],[4,5,15],[6],[15,19],[9,12,13]], 15, 12)
numBusesToDestination([[0,1,6,16,22,23],[14,15,24,32],[4,10,12,20,24,28,33],[1,10,11,19,27,33],[11,23,25,28],[15,20,21,23,29],[29]], 4, 21)


//279. Perfect Squares
//Input: n = 12
//Output: 3
func numSquares(_ n: Int) -> Int {
    var squares:[Int] = []
    for i in 1...n {
        if i*i <= n { squares.append(i*i) }
    }
    
    if squares.last == n {return 1}
    
    var numCount = 0
    var queue = [n]
    while(!queue.isEmpty) {
        var tempQueue = [Int]()
        for target in queue {
            for square in squares {
                if square == target {return numCount}
                else if square < target {tempQueue.append(target-square)}
            }
        }
        queue = tempQueue
        numCount += 1
    }
    return numCount
}

//1091. Shortest Path in Binary Matrix
//Input: grid = [[0,1],[1,0]]
//Output: 2
func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
    let directions = [[0, 1], [0, -1], [1, 0], [-1, 0],[-1, -1], [1, -1], [-1, 1], [1, 1]]

    if grid[0][0] == 1 { return -1 }
    var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
    visited[0][0] = true
    var positionQ = [(row:0,col:0)]
    var path = 1
    
    while (!positionQ.isEmpty) {
        for _ in 0..<positionQ.count {
            let pos = positionQ.removeFirst()
            
            if pos.row == grid.count-1 && pos.col == grid[0].count-1 {return path}
            
            for dir in directions {
                let (nextRow,nextCol) = (pos.row+dir[0],pos.col+dir[1])
                
                if nextRow >= grid.count || nextCol >= grid[0].count || nextRow < 0 || nextCol < 0 || grid[nextRow][nextCol] == 1 || visited[nextRow][nextCol]  { continue }
                
                positionQ.append((nextRow,nextCol))
                visited[nextRow][nextCol] = true
            }
        }
        
        path += 1
    }
    return -1
}
shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]])


