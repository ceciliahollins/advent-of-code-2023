extension String {
    
    func inputToStringArray() -> [String] {
        
        var str = self
        var result: [String] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            result.append(line)
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
    
    func wordsToInts() -> String {
        var str = self
        
        let intsAsWords = [("one", "1"),
                           ("two", "2"),
                           ("three", "3"),
                           ("four", "4"),
                           ("five", "5"),
                           ("six", "6"),
                           ("seven", "7"),
                           ("eight", "8"),
                           ("nine", "9")]
        
        for word in intsAsWords {
            str = str.replacingOccurrences(of: word.0, with: word.0 + word.1 + word.0)
        }
        
        return str
    }
}
