//: 200, Number of Islands
/*:
Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

![](Ex1.png)

*/
import Foundation

//***************作答***************//

var runCount = 0

class Solution
{
    func numIslands(_ grid: [[Character]]) -> Int
    {
        //反正第一步都先基本檢查
        if grid.count == 0 || grid.first?.count == 0 //第二項要檢查嗎？為何不能空第一行？
        {
            return 0
        }
        //建個記錄表
        let visitedRow = Array.init(repeating: false, count: grid.first!.count)
        var visitedGrid = Array.init(repeating: visitedRow, count: grid.count)
        var numberOfIsland = 0
        for (i, row) in grid.enumerated()
        {
            for (j, char) in row.enumerated()
            {
                if char == "1" && visitedGrid[i][j] == false //為何沒去過的陸地就+1？不是要以是否相連來判斷嗎？
                {
                    print("=========加一=========")
                    numberOfIsland += 1
                    travel(grid, &visitedGrid, i, j)//因為這裡開始會把所有上下左右都標記為已拜訪
                }
            }
        }
        return numberOfIsland
    }
    
    func travel(_ grid: [[Character]], _ visited: inout [[Bool]], _ i: Int, _ j: Int)
    {
        runCount += 1
        print("第\(runCount)次執行\(i)行\(j)列")
        
        if i >= 0 && j >= 0 && i < grid.count && j < grid[0].count //不因上下左右移動而超出範圍
        && grid[i][j] == "1" && visited[i][j] == false //而且是沒去過的陸地
        {
            print("移動")
            visited[i][j] = true
            travel(grid, &visited, i+1, j)
            travel(grid, &visited, i-1, j)
            travel(grid, &visited, i, j+1)
            travel(grid, &visited, i, j-1)
        }
        else
        {
            print("不移動")
        }
    }
}

//let grid: [[Character]] = [[],["1"]]
//let c = grid.count
//let cc = grid.first?.count
//let t = grid.count == 0
//let tt = grid.first?.count == 0

//***************驗證***************//

let sol = Solution()

//let ex1Grid: [[Character]] =
//[["1","1","1","1","0"],
// ["1","1","0","1","0"],
// ["1","1","0","0","0"],
// ["0","0","0","0","0"],]
//let ex1numIslands = sol.numIslands(ex1Grid)

let ex2Grid: [[Character]] =
[["1","1","0","0","0"],
 ["1","1","0","0","0"],
 ["0","0","1","0","0"],
 ["0","0","0","1","1"],]
let ex2numIslands = sol.numIslands(ex2Grid)

let rc = runCount
//: [Back](DFS)
