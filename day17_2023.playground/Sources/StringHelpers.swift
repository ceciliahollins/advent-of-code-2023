extension String {
    
    func inputToInt2DArray() -> [[Int]] {
        
        var str = self
        var result: [[Int]] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            result.append([])
            
            let line = String(str[str.startIndex..<indexOfLine])
            for char in line {
                result[result.count - 1].append(Int(String(char)) ?? 0)
            }

            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
}
