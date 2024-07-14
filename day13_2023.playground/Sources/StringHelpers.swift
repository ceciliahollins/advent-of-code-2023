extension String {
    
    func inputToMirrorValley() -> MirrorValley {
        
        var str = self
        var result = MirrorValley()
        result.valleys.append(ValleyPattern())
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            
            if line.isEmpty {
                result.valleys.append(ValleyPattern())
            } else {
                
                var patternToInsert: [Terrain] = []
                for char in line {
                    patternToInsert.append(Terrain(rawValue: String(char)) ?? .ash)
                }
                result.valleys[result.valleys.count-1].pattern.append(patternToInsert)
            }

            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
}
