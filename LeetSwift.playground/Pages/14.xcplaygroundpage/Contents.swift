//: 14, Longest Common Prefix
/*:
Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:
 
Input: ["flower","flow","flight"]
Output: "fl"
 
Example 2:
 
Input: ["dog","racecar","car"]
Output: ""
 
Explanation: There is no common prefix among the input strings.

Note:
All given inputs are in lowercase letters a-z.

*/
import Foundation

//***************作答***************//

class Solution
{
    func longestCommonPrefix(_ strs: [String]) -> String
    {
        if strs.isEmpty { return "" }
        
        var preStr = ""
        for (offset, str) in strs.enumerated()
        {
            print("current: \(str)")
            if  offset == 0
            {
                preStr = str
                continue
            }
            
            var tmpResult = ""
            for c in str
            {
                let pre = tmpResult + String(c)
                if preStr.hasPrefix(pre)
                {
                    tmpResult += String(c)
                    print("tmp: \(tmpResult)")
                }
                else
                {
                    break;
                }
            }
            
            preStr = tmpResult
            tmpResult = ""
        }
        return preStr
    }
}

//***************驗證***************//

let sol = Solution()
let ex1 = sol.longestCommonPrefix(["flower","flow","flight"])
print("============")
let ex2 = sol.longestCommonPrefix(["dog","racecar","car"])
print("============")
let ex3 = sol.longestCommonPrefix(["aaaa","a","aaa"])

//: [Back](<#上層檔名#>)
