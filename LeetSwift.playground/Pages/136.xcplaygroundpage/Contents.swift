//: 136, Single Number
/*:
Given a non-empty array of integers, every element appears twice except for one. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:

Input: [2,2,1]
Output: 1
 
Example 2:

Input: [4,1,2,1,2]
Output: 4

*/
import Foundation

//***************作答***************//

class Solution
{
    func singleNumber(_ nums: [Int]) -> Int
    {
        var result = 0
        
        for num in nums
        {
            print("result=\(result), num=\(num)")
            result = result ^ num
            print("new result=\(result)================")
        }
        
        return result
    }
}

//***************驗證***************//

//"組成電腦"的基本邏輯閘包含 AND、OR、NOT、XOR 等四種(&, |, !, ^)
//互斥或(XOR)，其輸入有兩條，輸出只有一條，當兩條不一樣的時候就輸出 1，兩者一樣的時候則會輸出 0。

//https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html

//Bitwise Operators, 用位元去兩兩比較
let and = 999 & 1 //其中一個是0就0, 不然就1
let xor = 0 ^ 1 //兩個一樣就0, 不然就運算

let sol = Solution()
let ex1 = sol.singleNumber([2,2,1])
let ex2 = sol.singleNumber([4,1,2,1,2])
let ex3 = sol.singleNumber([2,0,2])
let ex4 = sol.singleNumber([5,5,5,5,5])

//: [Back](Array)
