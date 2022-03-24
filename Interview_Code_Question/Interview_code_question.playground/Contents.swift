import UIKit
//Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
//The overall run time complexity should be O(log (m+n)).

//Example 1:
//
//Input: nums1 = [1,3], nums2 = [2]
//Output: 2.00000
//Explanation: merged array = [1,2,3] and median is 2.
//Example 2:
//
//Input: nums1 = [1,2], nums2 = [3,4]
//Output: 2.50000
//Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

//a = 15
//b = 10
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var i = 0, j = 0, arr = [Int]()
    while i < nums1.count && j < nums2.count {
        if nums1[i] < nums2[j] {
            arr.append(nums1[i])
            i += 1
        } else {
            arr.append(nums2[j])
            j += 1
        }
    }
    arr.append(contentsOf: nums1[i..<nums1.count])
    arr.append(contentsOf: nums2[j..<nums2.count])
    return arr.count % 2 == 0 ? Double(arr[arr.count / 2] + arr[arr.count / 2 - 1]) / 2 : Double(arr[arr.count / 2])
}

//a = 15 b = 10 don't using third variable to swap
//a = a + b //a = 25 b = 10
//b = a - b //a = 25 b = 15
//a = a - b //a = 10 b = 15
 
/*
name=John Trust, username=john3, email=john3@gmail.com, id=434453;
name=Hannah Smith, username=hsmith, email=hsm@test.com, id=23312;
name=Hannah Smith, username=hsmith, id=3223423, email=hsm@test.com;
name=Robert M, username=rm44, id=222342, email=rm@me.com;
name=Robert M, username=rm4411, id=5535, email=rm@me.com;
name=Susan Vee, username=sv55, id=443432, email=susanv123@me.com;
name=Robert Nick, username=rnick33, id=23432, email=rnick@gmail.com;
name=Robert Nick II, username=rnickTemp34, id=23432, email=rnick@gmail.com;
name=Susan Vee, username=sv55, id=443432, email=susanv123@me.com
*/
func LogDumpGetUnique() -> String {
    let log_dump = "name=John Trust, username=john3, email=john3@gmail.com, id=434453;name=Hannah Smith, username=hsmith, email=hsm@test.com, id=23312; name=Hannah Smith, username=hsmith, id=3223423, email=hsm@test.com; name=Robert M, username=rm44, id=222342, email=rm@me.com; name=Robert M, username=rm4411, id=5535, email=rm@me.com; name=Susan Vee, username=sv55, id=443432, email=susanv123@me.com; name=Robert Nick, username=rnick33, id=23432, email=rnick@gmail.com; name=Robert Nick II, username=rnickTemp34, id=23432, email=rnick@gmail.com; name=Susan Vee, username=sv55, id=443432, email=susanv123@me.com;"
    var splitArr = log_dump.split(separator: ";")
    
    var logDumpArr:[[Substring]] = []
    for arr in splitArr {
        var detailArr = arr.split(separator: ",")
        logDumpArr.append(detailArr)
    }
    var userNameCollection:[String] = Array()
    var resultArr:[[Substring]] = Array()
    for arr in logDumpArr {
        if userNameCollection.contains(String(arr[1])) { continue }
        userNameCollection.append(String(arr[1]))
        resultArr.append(arr)
    }
    print(resultArr)

    for i in 0..<resultArr.count {
        resultArr[i] = resultArr[i].filter { substring in
            if substring.hasPrefix(" id=") {return false}
            return true
        }
    }
    print(resultArr)
    var resultStr = ""
    for arr in resultArr {
        resultStr = resultStr + arr.reduce("", { partialResult, substring in
            return partialResult + substring + ","
        })
        resultStr.removeLast()
        resultStr = resultStr + ";"
    }
    return resultStr
}
