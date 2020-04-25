//: 1, Two Sum
/*:
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:

 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].

![](這邊輸入圖片檔名可顯示圖片)

*/
import Foundation

//***************作答***************//

class Solution
{
    func twoSum(_ nums: [Int], _ target: Int) -> [Int]
    {
        if nums.count < 2
        {
            return []
        }
        
        var dict: Dictionary<Int,Int> = [:]
        for (currentOffset, num) in nums.enumerated()
        {
            //重點在於跑到n的時候, 再去找0到n-1, 找不到才逐一加入
            if let lastOffset = dict[target - num]
            {
                return [lastOffset, currentOffset]
            }
            else
            {
                dict[num] = currentOffset
            }
        }
        return []
    }
}

//***************驗證***************//

let sol = Solution()
let ex1 = sol.twoSum([2, 7, 11, 15], 9)
let ex2 = sol.twoSum([3, 2, 4], 6) //自己加自己剛好等於target
let ex3 = sol.twoSum([3, 3], 6) //兩個元素相同
let ex4 = sol.twoSum([3], 5)
let ex5 = sol.twoSum([1, 1, 2, 3, 5, 8, 13], 21)

//: [Back](Common)
