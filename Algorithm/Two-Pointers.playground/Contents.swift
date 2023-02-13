import UIKit
import Darwin
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//524. Longest Word in Dictionary through Deleting
//Input: s = "abpcplea", dictionary = ["ale","apple","monkey","plea"]
//Output: "apple"
func findLongestWord(_ s: String, _ dictionary: [String]) -> String {
    var result = ""
    var sArr = Array(s)
    for ele in dictionary {
        var po1 = 0//for ele
        var po2 = 0//for sArr
        var eleArr = Array(s)
        while ( po2 < sArr.count) {
            if po1 < ele.count && sArr[po2] == eleArr[po1] {
                po1 += 1
                po2 += 1
            }else {
                po2 += 1
            }
        }
        if po1 == eleArr.count - 1 {
            result = result.count > eleArr.count ? result : eleArr.reduce("", { partialResult, char in
                return partialResult + String(char)
            })
        }
    }
    return result
}


//141.Linked List Cycle
//Input: head = [3,2,0,-4], pos = 1
//Output: true
func hasCycle(_ head: ListNode?) -> Bool {
    var node1 = head
    var node2 = head?.next
    
    while( node1 != nil && node2 != nil) {
        if node1 === node2 {return true}
        node1 = node1?.next
        node2 = node2?.next?.next
    }
    return false
}

//88. Merge Sorted Array
//Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
//Output: [1,2,2,3,5,6]
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var p1 = m - 1
    var p2 = n - 1
    var count = m + n - 1
    
    while (count >= 0 && p2 >= 0) {
        if p1 >= 0 && nums1[p1] > nums2[p2] {
            nums1[count] = nums1[p1]
            p1 -= 1
        }else {
            nums1[count] = nums2[p2]
            p2 -= 1
        }
        count -= 1
    }
}
var nums1:[Int] = [1,2,3,4,5,6]
var m = 5
var nums2:[Int] = []
var n = 0
merge(&nums1, m, nums2, n)
print(nums1)
//680.Valid Palindrome II
//Input: "abca"
//Output: True
func validPalindrome(_ s: String) -> Bool {
    let sArr = Array(s)
    var head = 0
    var tail = sArr.count - 1

    while(head < tail) {
        if sArr[head] == sArr[tail] {
            head += 1
            tail -= 1
        } else {
            return isPalindrome(s:sArr,head:head+1,tail:tail) || isPalindrome(s:sArr,head:head,tail:tail-1)
        }
    }
    
    func isPalindrome(s:[Character],head:Int,tail:Int) -> Bool {
        var head = head
        var tail = tail
        while (head < tail) {
            if s[head] != s[tail] {return false}
            head += 1
            tail -= 1
        }
        return true
    }
    return true
}
validPalindrome("a")



//345. Reverse Vowels of a String
//Input: s = "hello"
//Output: "holle"
func reverseVowels(_ s: String) -> String {
    var sArr = Array(s)
    var head = 0
    var tail = sArr.count-1
    
    while (head < tail) {
        if "aeiouAEIOU".contains(sArr[head]) {
            while (!"aeiouAEIOU".contains(sArr[tail]) && head < tail) {
                tail -= 1
            }
            
            sArr.swapAt(head, tail)
            tail -= 1
        }
        head += 1
    }
    return sArr.reduce("") { partialResult, char in
        return partialResult + String(char)
    }
}

//633. Sum of Square Numbers
//Input: c = 5
//Output: true
//Explanation: 1 * 1 + 2 * 2 = 5
func judgeSquareSum(_ c: Int) -> Bool {
    var head = 0
    var tail = Int(Double(c).squareRoot())
    
    while (head <= tail) {
        if c > head*head + tail*tail {
            head += 1
        } else if c < head*head + tail*tail {
            tail -= 1
        } else {
            return true
        }
    }
    return false
}

//167. Two Sum II - Input Array Is Sorted
//Input: numbers = [2,7,11,15], target = 9
//Output: [1,2]
func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var head = 0
    var tail = numbers.count - 1
    
    while(head < tail) {
        if target > numbers[head] + numbers[tail] {
            head += 1
        } else if target < numbers[head] + numbers[tail] {
            tail -= 1
        } else {
            return [head+1,tail+1]
        }
    }
    return []
}

//11. Container With Most Water
//Input: height = [1,8,6,2,5,4,8,3,7]
//Output: 49
func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var maxArea = 0
    while (left < right) {
        maxArea = max(maxArea, min(height[left], height[right]) * (right-left))
        if height[left] <= height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    return maxArea
}

//15. 3Sum
//Input: nums = [-1,0,1,2,-1,-4]
//Output: [[-1,-1,2],[-1,0,1]]
func threeSum(_ nums: [Int]) -> [[Int]] {
    var nums = nums.sorted()
    var result = [[Int]]()
    for i in 0..<nums.count {
        if i != 0 && nums[i] == nums[i-1] {continue}
        var left = i+1
        var right = nums.count-1
        while (left < right) {
            let sum = nums[i] + nums[left] + nums[right]
            if  sum == 0{
                result.append([nums[i], nums[left], nums[right]])
                left += 1
                right -= 1
                while(left < right && nums[left] == nums[left-1]) {
                    left += 1
                }
                
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    return result
}
