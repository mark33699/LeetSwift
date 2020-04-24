//: 100, Same Tree
/*:
 Given two binary trees, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
 
 ![](Ex1.png)
 ![](Ex2.png)
 
 */

import Foundation

//***************作答***************//

public class TreeNode
{
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int)
     {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }

class Solution
{
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool
    {
        //先比較整棵樹
        if p == nil && q == nil
        {
            return true
        }
        else if p == nil || q == nil
        {
            return false
        }
        else
        {
            if p?.val == q?.val //再比較數值
            {
                let isSameLeft = isSameTree(p?.left, q?.left)
                let isSameRight = isSameTree(p?.right, q?.right)
                return isSameLeft && isSameRight //最後比較子樹
            }
            else
            {
                return false
            }
        }
    }
}

//***************驗證***************//
let sol = Solution()

let ex1TreeLeft = TreeNode.init(1)
ex1TreeLeft.left = .init(2)
ex1TreeLeft.right = .init(3)
let ex1TreeRight = TreeNode.init(1)
ex1TreeRight.left = .init(2)
ex1TreeRight.right = .init(3)
let isSameEx1 = sol.isSameTree(ex1TreeLeft, ex1TreeRight)

let ex2TreeLeft = TreeNode.init(1)
ex2TreeLeft.left = .init(2)
let ex2TreeRight = TreeNode.init(1)
ex2TreeRight.right = .init(2)
let isSameEx2 = sol.isSameTree(ex2TreeLeft, ex2TreeRight)

let ex3TreeLeft = TreeNode.init(1)
ex3TreeLeft.left = .init(2)
ex3TreeLeft.right = .init(1)
let ex3TreeRight = TreeNode.init(1)
ex3TreeRight.left = .init(1)
ex3TreeRight.right = .init(2)
let isSameEx3 = sol.isSameTree(ex3TreeLeft, ex3TreeRight)


//: [Back](Tree)
