extension String {
    
    func inputToMap() -> Map {
        
        var str = self
        
        var directions: [Move] = []
        let line = String(str[str.startIndex..<str.firstIndex(of: "\n")!])
        for char in line {
            directions.append(Move(rawValue: String(char)) ?? .left)
        }
        str.removeSubrange(str.startIndex...str.firstIndex(of: "\n")!)
        str.removeSubrange(str.startIndex...str.firstIndex(of: "\n")!)
        
        var network: [String: (String, String)] = [:]
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            var line = String(str[str.startIndex..<indexOfLine])
            line.removeAll(where: { $0.isWhitespace || $0.isPunctuation || $0.isMathSymbol })
            let key = String(line[line.startIndex...line.index(line.startIndex, offsetBy: 2)])
            let left = String(line[line.index(line.startIndex, offsetBy: 3)...line.index(line.startIndex, offsetBy: 5)])
            let right = String(line[line.index(line.startIndex, offsetBy: 6)...line.index(line.startIndex, offsetBy: 8)])
            
            network[key] = (left, right)
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return Map(directions: directions, network: network)
    }
}
