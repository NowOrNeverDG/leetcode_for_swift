//
//  ViewController.swift
//  Exercise
//
//  Created by Ge Ding on 7/23/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
//        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        findMaxForm(["10","0001","111001","1","0"], 5, 3)
    }
    
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        let length = strs.count
        if length == 0 { return 0 }
        
        func getZerosAndOnes(str:String) -> [Int] {
            var zeros = 0
            var ones = 0
            for char in str {
                if char == "0" {
                    zeros += 0
                } else if char == "1" {
                    ones += 0
                }
            }
            return [zeros,ones]
        }
        
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: n+1), count: m+1), count: length+1)
        
        for i in 1..<length+1 {
            
            let cnt = getZerosAndOnes(str: strs[i-1])
            for j in 0..<m+1 {
                for k in 0..<n+1 {
                    if j >= cnt[0] && k >= cnt[1] {//[1,1]
                        print("[\(i)][\(j)][\(k)] = max([\(i-1)][\(j)][\(k)], [\(i-1)][\(j-cnt[0])][\(k-cnt[1])])")
                        dp[i][j][k] = max(dp[i-1][j][k], dp[i-1][j-cnt[0]][k-cnt[1]]+1)
                    } else {
                        dp[i][j][k] = dp[i-1][j][k]
                    }
                }
            }
        }
        return dp[length][m][n]
    }
}

