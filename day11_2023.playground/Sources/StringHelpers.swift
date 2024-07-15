extension String {
    
    func inputToGalaxyLocations(_ size: Int) -> [(Int, Int)] {
        var str = self
        let universeSize = size > 1 ? size - 1 : size
        var result: [(Int, Int)] = []
        
        var rowsContainsGalaxy = Array(repeating: (0, false),
                                      count: String(str[str.startIndex..<str.firstIndex(of: "\n")!]).count)
        var columnsContainsGalaxy = Array(repeating: (0, false),
                                         count: str.components(separatedBy: "\n").count)
        var i = 0
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            
            rowsContainsGalaxy[i].0 = i
            columnsContainsGalaxy[i].0 = i
            for (j, char) in line.enumerated() {
                if char == "#" {
                    rowsContainsGalaxy[i].1 = true
                    columnsContainsGalaxy[j].1 = true
                    result.append((j, i))
                }
            }
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
            i += 1
        }
                        
        for column in 0..<columnsContainsGalaxy.count {
            if !columnsContainsGalaxy[column].1 {
                for i in 0..<result.count {
                    result[i].0 += result[i].0 >= columnsContainsGalaxy[column].0 ? universeSize : 0
                }
                
                for columnToMove in column+1..<columnsContainsGalaxy.count {
                    columnsContainsGalaxy[columnToMove].0 += universeSize
                }
            }
        }
        
        for row in 0..<rowsContainsGalaxy.count {
            if !rowsContainsGalaxy[row].1 {
                for i in 0..<result.count {
                    result[i].1 += result[i].1 >= rowsContainsGalaxy[row].0 ? universeSize : 0
                }
                
                for rowToMove in row+1..<rowsContainsGalaxy.count {
                    rowsContainsGalaxy[rowToMove].0 += universeSize
                }
            }
        }
                        
        return result
    }
}
