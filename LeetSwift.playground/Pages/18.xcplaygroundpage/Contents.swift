//: 18, 4Sum
/*:
Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

Note:
The solution set must not contain duplicate quadruplets.

 ![](Ex.png)

*/
import Foundation

//***************作答***************//

class Solution
{
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]]
    {
        var result = [[Int]]()
        var initial = [Int]()
        let sorted = nums.sorted()
        dfs(result: &result, nums: sorted, target: target, currentArray: &initial, currentIndex: 0)
        return result
    }

    func dfs( result: inout [[Int]],
              nums: [Int],
              target: Int,
              currentArray: inout [Int],
              currentIndex: Int,
              n: Int = 4)
    {
        // 结束条件: 当前数组长度达标后, 看下值够不够,够了就加到结果数组里, 如果不够就扔掉
        if (currentArray.count == n)
        {
            let sum = currentArray.reduce(0) { $0 + $1 }
            
            if (sum == target)
            {
                result.append(currentArray)
            }
            return
        }
        else if currentIndex == nums.count
        {
            return
        }
        
        var index = currentIndex
        repeat
        {
            print("我要在\(nums)裡取\(index)")
            currentArray.append(nums[index])
            // 如果和大于目标值,而且 nums 从当前位置 curIndex 往后,全是大于 0 的值,也就是说不可能再达到 target 了
            let sum = currentArray.reduce(0) { $0 + $1 }
            if (sum > target && nums[index] > 0)
            {
                return
            }

            // 注意 nowArray 在进行参数传递的时候,应该是通过深度复制一份,而不是直接传递
            dfs(result: &result, nums: nums, target: target,
                currentArray: &currentArray, currentIndex: index + 1)
            currentArray.popLast()

            // 同样, 为了避免相邻重复
            
            if index < nums.count - 1
            {
                while (nums[index] == nums[index + 1])
                {
                    index += 1
                }
            }
            
            index += 1
            
        } while (index < nums.count)
    }
}

//***************驗證***************//

let sol = Solution()
let ex = sol.fourSum([1, 0, -1, 0, -2, 2], 0)
print(ex)
//: [Back](DFS)
