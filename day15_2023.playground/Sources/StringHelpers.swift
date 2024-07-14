extension String {
    
    func inputToStringArray() -> [String] {
        
        var str = self
        var result: [String] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: ",") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: ",") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            result.append(line)
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
    
    func stringToHASHMAP() -> HASHMAP {
        var str = self
        
        if let indexOfOperation = str.firstIndex(of: "=") {
            let label = String(str[str.startIndex..<indexOfOperation])
            let focalLength = String(str[str.index(str.firstIndex(of: "=")!, offsetBy: 1)..<str.endIndex])
            return HASHMAP(label: label,
                           box: label.stringToLensManualHash(),
                           operation: .insert,
                           focalLength: Int(focalLength) ?? 0)
        } else {
            let label = String(str[str.startIndex..<str.firstIndex(of: "-")!])
            return HASHMAP(label: label,
                           box: label.stringToLensManualHash(),
                           operation: .remove,
                           focalLength: nil)
        }
    }
    
    func stringToLensManualHash() -> Int {
        var stepResult = 0
        for char in self {
            let ascii = Int(Character(extendedGraphemeClusterLiteral: char).asciiValue ?? 0)
            stepResult = stepResult + ascii
            stepResult *= 17
            stepResult = stepResult % 256
        }
        return stepResult
    }
}
