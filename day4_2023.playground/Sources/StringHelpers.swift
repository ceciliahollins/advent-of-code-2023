extension String {
    
    func inputToScratchCards() -> [ScratchCard] {
        
        var str = self
        var result: [ScratchCard] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            var line = String(str[str.startIndex..<indexOfLine])
            line.removeSubrange(line.startIndex...line.index(line.firstIndex(of: ":")!, offsetBy: 1))
            
            var winningNumbers: [Int] = []
            var cardNumbers: [Int] = []
            
            var isWinningNumbers = true
            while !line.isEmpty {
                let indexOfSpace = line.firstIndex(of: " ") ?? line.endIndex
                let lineSubrangeToDelete = line.firstIndex(of: " ") ?? line.index(line.endIndex, offsetBy: -1)
                
                let num = String(line[line.startIndex..<indexOfSpace])
                if num == "|" {
                    isWinningNumbers = false
                } else if let numAsInt = Int(num) {
                    if isWinningNumbers {
                        winningNumbers.append(numAsInt)
                    } else {
                        cardNumbers.append(numAsInt)
                    }
                }
                line.removeSubrange(line.startIndex...lineSubrangeToDelete)
            }
            
            winningNumbers.sort()
            cardNumbers.sort()
            result.append(ScratchCard(winningNumbers: winningNumbers,
                                       cardNumbers: cardNumbers))
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
}
