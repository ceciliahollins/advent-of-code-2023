extension String {
    
    func inputTo2dIntArray() -> [[Int]] {
        
        var str = self
        var result: [[Int]] = []
        
        while !str.isEmpty {
            result.append([])
            
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            for char in line {
                if char.isNumber {
                    result[result.count - 1].append(Int(String(char)) ?? 0)
                } else if char == "." {
                    result[result.count - 1].append(-2)
                } else {
                    result[result.count - 1].append(-1)
                }
            }
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
    
    func stringTo2dIntArrayPartTwo() -> [[Int]] {
        
        var str = self
        var result: [[Int]] = []
        
        while !str.isEmpty {
            result.append([])
            
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            for char in line {
                if char.isNumber {
                    result[result.count - 1].append(Int(String(char)) ?? 0)
                } else if char == "*" {
                    result[result.count - 1].append(-1)
                } else {
                    result[result.count - 1].append(-2)
                }
            }
            
            str.removeSubrange(str.startIndex...indexOfLine)
        }
        
        return result
    }
}
