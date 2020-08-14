class Solution {
    func isValid(_ s: String) -> Bool {
        let count = s.count % 2
        if count != 0 {
            return false
        }
        
        var Stack = [Character]()
        
        for value in s {
            switch value {
            case "(","{","[":
                Stack.append(value)
            case ")":
                if Stack.popLast() != "(" {
                    return false
                }
            case "}":
            if Stack.popLast() != "{" {
                return false
            }
            case "]":
                if Stack.popLast() != "[" {
                    return false
                }
            default:
                break
            }
        }
        
        if Stack.count == 0 {
            return true
        }
        else
        {
            return false
        }
    }
    
    func isValid_better(_ s: String) -> Bool {
        
        if s.count % 2 != 0 {
          return false
        }
        
        var Stack = [Character]()
        let HashMap: [Character : Character] = [")":"(", "}":"{", "]":"["]
        
        for value in s {
            if HashMap.values.contains(value)
            {
                Stack.append(value)
            }
            else
            {
                if Stack.isEmpty || Stack.popLast() != HashMap[value]
                {
                    return false
                }
            }
        }
        
        return Stack.isEmpty
    }
}

print(Solution.init().isValid_better("[()]"))
