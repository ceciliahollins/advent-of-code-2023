extension String {
    
    func inputToGarden() -> Garden {
        
        var str = self
        var result = Garden()
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            
            var lineToInsert: [Plot] = []
            for char in line {
                lineToInsert.append(Plot(rawValue: String(char)) ?? .garden)
                
                if char == "S" {
                    result.start = Position(lineToInsert.count - 1, result.map.count)
                }
            }
            result.map.append(lineToInsert)

            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
}
