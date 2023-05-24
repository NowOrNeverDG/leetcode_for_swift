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


//16. 3Sum Closest
//Input: nums = [-1,2,1,-4], target = 1
//Output: 2
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let nums = nums.sorted()
    var distance = Int.max
    var result = 0
    for i in 0..<nums.count {
        var left = i+1
        var right = nums.count-1
        while(left < right) {
            let sum = nums[i] + nums[left] + nums[right]
            let currDistance = abs(sum-target)
            distanceCalculator(currDistance: currDistance, sum: sum)
            if sum > target {
                right -= 1
            } else if sum < target {
                left += 1
            } else {
                return target
            }
        }
    }
    
    func distanceCalculator(currDistance: Int,sum:Int) {
        if currDistance < distance {
            distance = currDistance
            result = sum
        }
    }
    return result
}

//18. 4Sum
//Input: nums = [1,0,-1,0,-2,2], target = 0
//Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let nums = nums.sorted()
    var result = [[Int]]()
    for i in 0..<nums.count {
        if i != 0 && nums[i-1] == nums[i] {continue}
        for j in i+1..<nums.count {
            if j > i+1 && nums[j-1] == nums[j] {continue}
            var left = j + 1
            var right = nums.count-1
            while (left < right) {
                let sum = nums[i] + nums[j] + nums[left] + nums[right]
                if  sum == target {
                    result.append([nums[i],nums[j],nums[left],nums[right]])
                    left += 1
                    right -= 1
                    while(nums[left] == nums[left-1] && left < right) {
                        left += 1
                    }
                    while(nums[right] == nums[right+1] && left < right) {
                        right -= 1
                    }
                } else if sum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
    }
    
    return result
}


//28. Find the Index of the First Occurrence in a String
//Input: haystack = "sadbutsad", needle = "sad"
//Output: 0
func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack.count < needle.count { return -1 }
    for i in 0...haystack.count-needle.count {
        let startIndex = haystack.index(haystack.startIndex, offsetBy: i)
        let endIndex = haystack.index(haystack.startIndex, offsetBy: i+needle.count)
        print(haystack[startIndex..<endIndex])
        if haystack[startIndex..<endIndex] == needle {
            return i
        }

    }
    return -1
}

//42. Trapping Rain Water
//Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
//Output: 6
func trap(_ height: [Int]) -> Int {
       var left = 0
       var right = height.count - 1
       var result = 0
       
       while (left < right) {
           if height[left] <= height[right] {
               let current = height[left]
               left += 1
               while(current >= height[left] && left < right) {
                   result += current - height[left]
                   left += 1
               }

           } else {
               let current = height[right]
               right -= 1

               while(current >= height[right] && left < right) {
                   result += current - height[right]
                   right -= 1
               }
           }
       }
       return result
   }

//61. Rotate List
//Input: head = [1,2,3,4,5], k = 2
//Output: [4,5,1,2,3]
func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    var findTail = head
    var size = 1
    
    while(findTail?.next != nil) {
        findTail = findTail?.next
        size += 1
    }
    findTail?.next = head

    var op = size - (k % size)
    var head = head
    for _ in 1..<op {
        head = head?.next
    }
    let result = head?.next
    head?.next = nil
    return result
}

//75. Sort Colors
//Input: nums = [2,0,2,1,1,0]
//Output: [0,0,1,1,2,2]
func sortColors(_ nums: inout [Int]) {
        var curr = 0
        var left = 0
        var right = nums.count-1
        
        while (curr <= right) {
            if nums[curr] == 0 {
                let temp = nums[left]
                nums[left] = nums[curr]
                nums[curr] = temp
                left += 1
                curr += 1
            } else if nums[curr] == 2 {
                let temp = nums[right]
                nums[right] = nums[curr]
                nums[curr] = temp
                right -= 1
            } else {
                curr += 1
                
            }
        }
    }

//80. Remove Duplicates from Sorted Array II
//Input: nums = [1,1,1,2,2,3]
//Output: 5, nums = [1,1,2,2,3,_]
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var left = 1
    var count = 1
    
    for i in 1..<nums.count {
        if nums[i-1] == nums[i] {
            count += 1
        } else {
            count = 1
        }
        
        if count <= 2 {
            nums[left] = nums[i]
            left += 1
        }
    }
    return left
}

//86. Partition List
//Input: head = [1,4,3,2,5,2], x = 3
//Output: [1,2,2,4,3,5]
func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    var leftFirstNode = ListNode(0)
    var rightFirstNode = ListNode(0)

    var currLeftNode = leftFirstNode
    var currRightNode = rightFirstNode
    var currHead = head
    while(currHead != nil) {
        
        if currHead!.val < x {
            currLeftNode.next = currHead
            currLeftNode = currLeftNode.next!
        }else {
            currRightNode.next = currHead!
            currRightNode = currRightNode.next!
        }
        let temp = currHead
        currHead = currHead?.next
        temp?.next = nil
    }
    currLeftNode.next = rightFirstNode.next
    return leftFirstNode.next
}

//142. Linked List Cycle II
//Input: head = [3,2,0,-4], pos = 1
//Output: tail connects to node index 1
func detectCycle(_ head: ListNode?) -> ListNode? {
    var leftNode = head
    var rightNode = head

    while(rightNode?.next?.next != nil && leftNode?.next != nil) {
        rightNode = rightNode?.next?.next
        leftNode = leftNode?.next

        if leftNode === rightNode {
            rightNode = head
            while (rightNode !== leftNode ) {
                rightNode = rightNode?.next
                leftNode = leftNode?.next
            }
            return rightNode
         }
    }

    return nil
}

//159. Longest Substring with At Most Two Distinct Characters
//Input: s = "eceba"
//Output: 3
func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
    if s.count < 3 { return s.count }
    var left = 0
    var right = 0
    var distictDic = [Character:Int]()
    let sArr = Array(s)
    var maxCount = 1
    while(right < sArr.count) {
        distictDic[sArr[right]] = right
        if distictDic.count == 3 {
            let delete_pair = distictDic.min { left_pair, right_pair in
                left_pair.value < right_pair.value
            }
            guard let delete_pair = delete_pair else { return -1 }
            distictDic.removeValue(forKey: delete_pair.key)
            left = delete_pair.value+1
        }
        right += 1
        maxCount = max(maxCount, right - left)
    }
    return maxCount
}


//209. Minimum Size Subarray Sum
//Input: target = 7, nums = [2,3,1,2,4,3]
//Output: 2
func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var left = 0
    var right = 0
    var sum = 0
    var distance = Int.max
    while (right < nums.count) {
        sum = sum + nums[right]
        while (sum >= target) {
            distance = min(distance, right - left)
            sum = sum - nums[left]
            left += 1
        }
        right += 1
    }
    return distance == Int.max ? 0 : distance+1
}

//234. Palindrome Linked List
//Input: head = [1,2,2,1]
//Output: true
func isPalindrome(_ head: ListNode?) -> Bool {
    var headStr = [Int]()
    var head = head
    while (head != nil) {
        headStr.append(head!.val)
        head = head!.next
    }
    
    while(headStr.count > 1) {
        if headStr.first != headStr.last { return false }
        headStr.removeFirst()
        headStr.removeLast()
    }
    
    return true
}

//259. 3Sum Smaller
//Input: nums = [-2,0,1,3], target = 2
//Output: 2
func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 { return 0 }
    if nums.count < 4 {
        let sum = nums.reduce(0) { partialResult, num in
        return partialResult + num
        }
        return sum < target ? 1 : 0
    }
    let nums = nums.sorted()
    
    var count = 0
    for i in 0..<nums.count-2 {
        var left = i+1
        var right = nums.count-1
        while(left < right) {
            print("\(nums[i]) \(nums[left]) \(nums[right])")
            if nums[i] + nums[left] + nums[right] < target {
                count += right - left
                left += 1
            } else {
                right -= 1
            }
        }
    }
    return count
}


//349. Intersection of Two Arrays
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2]
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var res = [Int]()
    var nums1Set = Set(nums1)
    var nums2Set = Set(nums2)
    for i in nums1Set {
        if nums2Set.contains(i) {
            res.append(i)
        }
    }
    return res
}

//350. Intersection of Two Arrays II
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2,2]
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    if nums1.count > nums2.count { return intersect(nums2, nums1) }
    var result = [Int]()
    var nums1Dic = [Int:Int]()
    for i in nums1 {
        nums1Dic[i,default: 0] += 1
    }
    
    for i in nums2 {
        if nums1Dic[i] != nil && nums1Dic[i]! > 0 {
            nums1Dic[i]! -= 1
            result.append(i)
        }
    }
    return result
}

//360. Sort Transformed Array
//Input: nums = [-4,-2,2,4], a = 1, b = 3, c = 5
//Output: [3,9,15,33]
func sortTransformedArray(_ nums: [Int], _ a: Int, _ b: Int, _ c: Int) -> [Int] {
    var result = [Int]()
    for i in nums {
        result.append(a * i * i + b * i + c)
    }
    return result.sorted()
}

//424. Longest Repeating Character Replacement
//Input: s = "ABAB", k = 2
//Output: 4
func characterReplacement(_ s: String, _ k: Int) -> Int {
    var left = 0
    var freqMap = [Character: Int]()
    let sArr = Array(s)
    var maxFreq = 0
    var longestSubstringLength = 0
    for right in 0..<sArr.count {
        freqMap[sArr[right],default: 0] += 1
        maxFreq = max(maxFreq, freqMap[sArr[right]]!)
        
        if right - left + 1 - maxFreq > k {
            freqMap[sArr[left]]! -= 1
            left += 1
        }
        
        longestSubstringLength = max(longestSubstringLength, right - left + 1)
    }
    
    return longestSubstringLength
}

//487. Max Consecutive Ones II
//Input: nums = [1,0,1,1,0]
//Output: 4
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var left = 0
    var right = 0
    var distance = 0
    var zeroCount = 0
    while right < nums.count {
        if nums[right] == 0 {
            zeroCount += 1
            while zeroCount >= 2 {
                if nums[left] == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
        }
        right += 1
        distance = max(distance, right - left)
    }
    return distance
}

//524. Longest Word in Dictionary through Deleting
//Input: s = "abpcplea", dictionary = ["ale","apple","monkey","plea"]
//Output: "apple"
func findLongestWord(_ s: String, _ dictionary: [String]) -> String {
    func characterComparison(firstString: String, secondString: String) -> String {
        let count = firstString.count > secondString.count ? secondString.count : firstString.count
        
        for i in 0..<count {
            if Array(firstString)[i].asciiValue! == Array(secondString)[i].asciiValue! { continue }
            return Array(firstString)[i].asciiValue! > Array(secondString)[i].asciiValue! ? secondString : firstString
        }
        return firstString
    }
    
    let sArr = Array(s)
    var result = ""
    for givenStr in dictionary {
        let givenStrArr = Array(givenStr)
        
        var sArrPointer = 0
        var givenStrPointer = 0
        while (sArrPointer < sArr.count ) {
            if sArr[sArrPointer] == givenStrArr[givenStrPointer] {
                givenStrPointer += 1
            }
            
            if givenStrPointer >= givenStrArr.count {
                if result.count == givenStrArr.count {
                    result = characterComparison(firstString: result, secondString: givenStr)
                } else {
                    result = result.count > givenStrArr.count ? result : givenStr
                }
                break
            }
            sArrPointer += 1
        }
    }
    return result
}

//532. K-diff Pairs in an Array
//Input: nums = [3,1,4,1,5], k = 2
//Output: 2
func findPairs(_ nums: [Int], _ k: Int) -> Int {
        if nums.count < 2 { return 0 }
        if nums.count == 2 { return abs(nums[1]-nums[0] == k ? 1:0)}
        let nums = nums.sorted()
        var result = 0
        var left = 0
        var right = 1
        
        while(right < nums.count) {
            if nums[right] - nums[left] < k {
                right += 1
            } else if nums[right] - nums[left] > k {
                left += 1
            } else if nums[right] - nums[left] == k {
                print("\(nums[left]) \(nums[right])")
                result += 1
                left += 1
                right += 1
                while (left < nums.count && nums[left] == nums[left-1]) {
                    left += 1
                }
            }
            
            if left >= right {
                right = left + 1
            }
        }
        return result
    }


//844. Backspace String Compare
func backspaceCompare(_ s: String, _ t: String) -> Bool {
    var sArr = Array(s)
    var tArr = Array(t)
    var tempS = [Character]()
    for i in 0..<sArr.count {
        if sArr[i] == "#" {
            if tempS.count > 0 {
                tempS.removeLast()
            }
        } else {
            tempS.append(sArr[i])
        }
    }

    var tempT = [Character]()
    for i in 0..<tArr.count {
        if tArr[i] == "#" {
            if tempT.count > 0 {
                tempT.removeLast()
            }
        } else {
            tempT.append(tArr[i])
        }
    }

    return tempS == tempT ? true : false
}

//713. Subarray Product Less Than K
func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    var left = 0
    var sum = 1
    var result = 0
    for right in 0..<nums.count {
        sum = sum * nums[right]
        while (sum >= k && left <= right ) {
            sum /= nums[left]
            left += 1
        }

        result += right - left + 1
    }
    return result
}


//82. Remove Duplicates from Sorted List II
//Input: head = [1,2,3,3,4,4,5]
//Output: [1,2,5]
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var head = head
    var current = head
    var previous: ListNode? = nil
    while current != nil {
        if current?.val == current?.next?.val {
            let val = current?.val
            let refPointer = current
            while (current?.val == val) {
                current = current?.next
            }
            if (refPointer === head) {
                head = current
            } else {
                previous?.next = current
            }
        } else {
            previous = current
            current = current?.next
        }
    }
    return head
}

//125. Valid Palindrome
//Input: s = "A man, a plan, a canal: Panama"
//Output: true
func isPalindrome(_ s: String) -> Bool {
    let sArr = Array(s)
    var testArr = [String]()
    for ch in sArr {
        guard let asciiVal = ch.asciiValue else { return false }
        if ch.isLetter{
            let ch = ch.lowercased()
            testArr.append(String(ch))
        } else if ch.isNumber {
            testArr.append(String(ch))
        }
    }
    var head = 0
    var tail = testArr.count-1
    while (head < tail) {
        if testArr[head] != testArr[tail] { return false }
        head += 1
        tail -= 1
    }
    
    return true
}

//3. Longest Substring Without Repeating Characters
//Input: s = "abcabcbb"
//Output: 3
func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count == 0 { return 0 }
    var sArr = Array(s)
    let n = sArr.count
    var head = 0
    var tail = 0
    var tempDic = [String:Int]()
    var length = 0
    while(tail < n) {
        tempDic[String(sArr[tail]),default: 0] += 1
        if tempDic[String(sArr[tail])]! > 1 {
            while (tempDic[String(sArr[tail])]! > 1){
                tempDic[String(sArr[head])]! -= 1
                head += 1
            }
        }
        length = max(length, tail-head)
        tail += 1
    }
    return length+1
}
