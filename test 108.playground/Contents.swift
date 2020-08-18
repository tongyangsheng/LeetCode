public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
         self.val = val
        self.left = nil
        self.right = nil
    }
}


class Solution {
  func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return dfs(nums, 0, nums.count - 1)
  }
    
    func dfs(_ nums: [Int], _ low: Int, _ high: Int) -> TreeNode? {
        if(low > high)
        {
            return nil
        }
        let mid = low + (high - low) / 2
        let root: TreeNode = TreeNode.init(nums[mid])
        root.left = dfs(nums, low, mid - 1)
        root.right = dfs(nums, mid + 1, high)
        return root
    }
}

