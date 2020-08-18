public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

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
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard let _ = head else {
            return nil
        }
        var cur = head
        var listArr = [Int]()
        while cur != nil {
            listArr.append(cur!.val)
            cur = cur?.next
        }
        return createBST(listArr, 0, listArr.count - 1)
    }
    
    func createBST(_ nums: [Int],_ L: Int, _ R: Int) -> TreeNode? {
        if L > R {
            return nil
        }
        let mid = L + (R - L + 1) / 2
        let value = nums[mid]
        let root = TreeNode(value)
        
        root.left = createBST(nums, L, mid - 1)
        root.right = createBST(nums, mid + 1, R)
        
        return root
    }
}


