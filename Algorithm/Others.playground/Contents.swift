import UIKit

//1560. Most Visited Sector in a Circular Track
//Input: n = 4, rounds = [1,3,1,2]
//Output: [1,2]
func mostVisited(_ n: Int, _ rounds: [Int]) -> [Int] {
    return rounds[rounds.count-1] > rounds[0] ? [Int](rounds[0]...rounds[rounds.count-1]) : [Int](rounds[rounds.count-1]...rounds[0])
}
print(mostVisited(4, [1,3,1,2]))

//1275. Find Winner on a Tic Tac Toe Game
//Input: moves = [[0,0],[2,0],[1,1],[2,1],[2,2]]
//Output: "A"
func tictactoe(_ moves: [[Int]]) -> String {
    
}
