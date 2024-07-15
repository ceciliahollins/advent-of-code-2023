extension String {
    
    func inputToContraption() -> Contraption {
        
        var str = self
        var parts: [[ContraptionPart]] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            parts.append([])
            
            let line = String(str[str.startIndex..<indexOfLine])
            for char in line {
                parts[parts.count - 1].append(ContraptionPart(rawValue: char) ?? .empty)
            }

            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return Contraption(parts: parts, beams: [LightBeam(position: (0,0), direction: .right)])
    }
}
