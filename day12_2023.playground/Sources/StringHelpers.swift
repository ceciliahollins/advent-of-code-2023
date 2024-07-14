extension String {
    
    func inputToConditionalRecords() -> [ConditionalRecord] {
        
        var str = self
        var result: [ConditionalRecord] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            
            let springs = String(line[line.startIndex..<line.firstIndex(of: " ")!])
            var list = String(line[line.index(line.firstIndex(of: " ")!, offsetBy: 1)..<line.endIndex])
            
            var springsResult: [SpringStatus] = []
            for spring in springs {
                springsResult.append(SpringStatus(rawValue: String(spring)) ?? .unknown)
            }
            
            var listResult: [Int] = []
            while !list.isEmpty {
                let indexOfComma = list.firstIndex(of: ",") ?? list.endIndex
                let lineSubrangeToDelete = list.firstIndex(of: ",") ?? list.index(list.endIndex, offsetBy: -1)
                
                let num = String(list[list.startIndex..<indexOfComma])
                listResult.append(Int(num) ?? 0)
                list.removeSubrange(list.startIndex...lineSubrangeToDelete)
            }
                        
            result.append(ConditionalRecord(springs: springsResult,
                                            list: listResult))
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
}
