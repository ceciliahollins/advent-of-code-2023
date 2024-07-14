extension String {
    
    func inputToParabolicReflectorDish() -> [[RockType]] {
        
        var str = self
        var result: [[RockType]] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            result.append([])

            for char in line {
                result[result.count - 1].append(RockType(rawValue: String(char)) ?? .empty)
            }
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
}
