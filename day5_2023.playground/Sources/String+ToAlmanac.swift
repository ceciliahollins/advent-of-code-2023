extension String {
    
    func stringToAlmanac() -> Almanac {
        
        var str = self
        var result: Almanac = Almanac()
        
        // MARK: Seeds
        str.removeSubrange(str.startIndex...str.firstIndex(of: " ")!)
        var line = String(str[str.startIndex..<str.firstIndex(of: "\n")!])
        
        while !line.isEmpty {
            let indexOfSpace = line.firstIndex(of: " ") ?? line.endIndex
            let subrangeToDelete = line.firstIndex(of: " ") ?? line.index(line.endIndex, offsetBy: -1)
            let num = String(line[line.startIndex..<indexOfSpace])
            result.seeds.append(Int(num) ?? 0)
            line.removeSubrange(line.startIndex...subrangeToDelete)
        }
        
        str.removeSubrange(str.startIndex...str.firstIndex(of: ":")!)
        str.removeSubrange(str.startIndex...str.firstIndex(of: "\n")!)
        
        // MARK: Maps
        result.maps.append([])
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            var line = String(str[str.startIndex..<indexOfLine])
            
            if line.isEmpty {
                result.maps[result.maps.count - 1].sort(by: { $0.destinationCategory <= $1.destinationCategory })
                result.maps.append([])
                str.removeSubrange(str.startIndex...indexOfLine)
                continue
            } else if line.last == ":" {
                str.removeSubrange(str.startIndex...indexOfLine)
                continue
            }
            
            let firstNum = String(line[line.startIndex..<line.firstIndex(of: " ")!])
            line.removeSubrange(line.startIndex...line.firstIndex(of: " ")!)
            let secondNum = String(line[str.startIndex..<line.firstIndex(of: " ")!])
            line.removeSubrange(line.startIndex...line.firstIndex(of: " ")!)
            let thirdNum = String(line[line.startIndex..<line.endIndex])
            
            let map = Map(destinationCategory: Int(firstNum) ?? 0,
                          sourceCategory: Int(secondNum) ?? 0,
                          range: (Int(thirdNum) ?? 0) - 1)
            result.maps[result.maps.count-1].append(map)
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
    
    func stringToAlmanacRange() -> AlmanacRanges {
        
        var str = self
        var result: AlmanacRanges = AlmanacRanges()
        
        // MARK: Seed Ranges
        str.removeSubrange(str.startIndex...str.firstIndex(of: " ")!)
        var line = String(str[str.startIndex..<str.firstIndex(of: "\n")!])
        
        while !line.isEmpty {
            var indexOfSpace = line.firstIndex(of: " ") ?? line.endIndex
            var subrangeToDelete = line.firstIndex(of: " ") ?? line.index(line.endIndex, offsetBy: -1)
            let num = String(line[line.startIndex..<indexOfSpace])
            line.removeSubrange(line.startIndex...subrangeToDelete)
            
            indexOfSpace = line.firstIndex(of: " ") ?? line.endIndex
            subrangeToDelete = line.firstIndex(of: " ") ?? line.index(line.endIndex, offsetBy: -1)
            let range = String(line[line.startIndex..<indexOfSpace])
            line.removeSubrange(line.startIndex...subrangeToDelete)
            
            result.seeds.append((Int(num) ?? 0, Int(range) ?? 0))
        }
        
        str.removeSubrange(str.startIndex...str.firstIndex(of: ":")!)
        str.removeSubrange(str.startIndex...str.firstIndex(of: "\n")!)
        
        // MARK: Maps
        result.maps.append([])
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            var line = String(str[str.startIndex..<indexOfLine])
            
            if line.isEmpty {
                result.maps[result.maps.count - 1].sort(by: { $0.destinationCategory <= $1.destinationCategory })
                result.maps.append([])
                str.removeSubrange(str.startIndex...indexOfLine)
                continue
            } else if line.last == ":" {
                str.removeSubrange(str.startIndex...indexOfLine)
                continue
            }
            
            let firstNum = String(line[line.startIndex..<line.firstIndex(of: " ")!])
            line.removeSubrange(line.startIndex...line.firstIndex(of: " ")!)
            let secondNum = String(line[str.startIndex..<line.firstIndex(of: " ")!])
            line.removeSubrange(line.startIndex...line.firstIndex(of: " ")!)
            let thirdNum = String(line[line.startIndex..<line.endIndex])
            
            let map = Map(destinationCategory: Int(firstNum) ?? 0,
                          sourceCategory: Int(secondNum) ?? 0,
                          range: (Int(thirdNum) ?? 0))
            result.maps[result.maps.count-1].append(map)
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
}
