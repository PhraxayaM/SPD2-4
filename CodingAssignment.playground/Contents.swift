import UIKit

//  Brute force way
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

     for currentIndex in 0..<nums.count {
           for nextIndex in 1..<nums.count {
               if nums[currentIndex] + nums[nextIndex] == target {
                   return [currentIndex, nextIndex]
               }
           }
       }
       return []
   }


var test = [1,3,6,7, 5, 20, 10, 11]
var tar = 12

twoSum(test, tar)

func twoSumV2(_ nums: [Int], _ target: Int) -> [Int] {
    var result = [Int](), seen = [Int: Int]()
    for (i, num) in nums.enumerated() {
        if let prevIndex = seen[num] { // Found
            result = [prevIndex, i]; break
        }
        seen[target - num] = i
    }
    return result
}

twoSumV2(test, tar)

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    if nums.count == 0 {
        return 0
    }
    
    return helper(nums, 0, nums.count - 1, nums.count - k)
}

private func helper(_ nums: [Int], _ start: Int, _ end: Int, _ k: Int) -> Int {
    if start > end {
        return 0
    }
    
    let pivot = nums[end]
    var nums = nums
    var left = start
    
    for i in start..<end {
        if nums[i] <= pivot {
            if left != i {
                nums.swapAt(left, i)
            }
            left += 1
        }
    }
    if left != end {
        nums.swapAt(left, end)
    }
    
    if left == k {
        return nums[left]
    } else if left < k {
        return helper(nums, left + 1, end, k)
    } else {
        return helper(nums, start, left - 1, k)
    }
}

findKthLargest(test, 2)
