import Foundation

extension String {
    
    func inputToCamelCardHand() -> [CamelCardHand] {
        
        var str = self
        var result: [CamelCardHand] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            
            let hand = String(line[line.startIndex..<line.firstIndex(of: " ")!])
            let bid = Int(line[line.index(after: line.firstIndex(of: " ")!)..<line.endIndex]) ?? 0
            
            var cards: [Card: Int] = [:]
            var orderedCards: [Card] = []
            var rank = 1
            for (i, char) in hand.enumerated() {
                let card = Card(rawValue: String(char)) ?? .two
                cards[card] = (cards[card] ?? 0) + 1
                rank += ((pow(10.0, 5-i) * Decimal(card.strength)) as NSDecimalNumber).intValue
                orderedCards.append(card)
            }
            
            result.append(CamelCardHand(cards: cards,
                                        orderedCards: orderedCards,
                                        bid: bid))
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        result.sort(by: {
            var i = 0
            while $0.orderedCards[i].strength == $1.orderedCards[i].strength {
                i += 1
            }
            return $0.orderedCards[i].strength > $1.orderedCards[i].strength
        })
        
        return result
    }
    
    func inputToCamelCardHandPartTwo() -> [CamelCardHandPartTwo] {
        
        
        var str = self
        var result: [CamelCardHandPartTwo] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            
            let hand = String(line[line.startIndex..<line.firstIndex(of: " ")!])
            let bid = Int(line[line.index(after: line.firstIndex(of: " ")!)..<line.endIndex]) ?? 0
            
            var cards: [CardPartTwo: Int] = [:]
            var orderedCards: [CardPartTwo] = []
            var rank = 1
            for (i, char) in hand.enumerated() {
                let card = CardPartTwo(rawValue: String(char)) ?? .two
                cards[card] = (cards[card] ?? 0) + 1
                rank += ((pow(10.0, 5-i) * Decimal(card.strength)) as NSDecimalNumber).intValue
                orderedCards.append(card)
            }
            
            result.append(CamelCardHandPartTwo(cards: cards,
                                               orderedCards: orderedCards,
                                               bid: bid))
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        result.sort(by: {
            var i = 0
            while $0.orderedCards[i].strength == $1.orderedCards[i].strength {
                i += 1
            }
            return $0.orderedCards[i].strength > $1.orderedCards[i].strength
        })
        
        return result
    }
}
