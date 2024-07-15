import Foundation


public func scratchCards(_ input: String) -> Int {
    
    let scratchCards = input.inputToScratchCards()
    var result = 0
    
    for card in scratchCards {
        var points = 0
        
        for winningNum in card.winningNumbers {
            for myNum in card.cardNumbers {
                if winningNum == myNum {
                    if points == 0 {
                        points = 1
                    } else {
                        points *= 2
                    }
                } else if winningNum < myNum {
                    break
                }
            }
        }
        
        result += points
    }
    
    return result
}

public func scratchCardsPartTwo(_ input: String) -> Int {
    
    let scratchCards = input.inputToScratchCards()
    var copies: [Int: Int] = [:]
    
    for i in 0..<scratchCards.count {
        copies[i] = 1
    }
    
    for currCard in 0..<copies.count {
        
        var numOfMatching = 0
        for winningNum in scratchCards[currCard].winningNumbers {
            for myNum in scratchCards[currCard].cardNumbers {
                if winningNum == myNum {
                    numOfMatching += 1
                } else if winningNum < myNum {
                    break
                }
            }
        }
        
        if numOfMatching > 0 {
            for i in currCard+1...currCard+numOfMatching {
                if copies[i] != nil {
                    copies[i]! += copies[currCard]!
                }
            }
        }
    }
    
    var numOfCards = 0
    for (_, numOfCopies) in copies {
        numOfCards += numOfCopies
    }
    
    return numOfCards
}
