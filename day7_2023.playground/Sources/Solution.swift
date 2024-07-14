import Foundation


public func camelCards(_ input: String) -> Int {
    
    let hands = input.inputToCamelCardHand()
    
    // [[fiveOfAKind], [fourOfAKind], [fullHouse], [threeOfAKind], [twoPair], [onePair], [highCard]]
    var orderedHands: [[Int]] = Array(repeating: [], count: 7)
    
    for hand in hands {
        
        if hand.cards.count == 1 { // five of a kind
            orderedHands[0].append(hand.bid)
        } else if hand.cards.count == 2 { // four of a kind, full house
            if hand.cards.contains(where: { $0.value == 4 }) { // four of a kind
                orderedHands[1].append(hand.bid)
            } else { // full house
                orderedHands[2].append(hand.bid)
            }
        } else if hand.cards.count == 3 { // three of a kind, two pair
            if hand.cards.contains(where: { $0.value == 3 }) { // three of a kind
                orderedHands[3].append(hand.bid)
            } else { // two pair
                orderedHands[4].append(hand.bid)
            }
        } else if hand.cards.count == 4 { // one pair
            orderedHands[5].append(hand.bid)
        } else { // high card
            orderedHands[6].append(hand.bid)
        }
    }
    
    var currRank = hands.count
    var totalBids = 0
    for handTypes in orderedHands {
        for hand in handTypes {
            totalBids += (hand * currRank)
            currRank -= 1
        }
    }
    
    return totalBids
}

public func camelCardsPartTwo(_ input: String) -> Int {
    
    let hands = input.inputToCamelCardHandPartTwo()

    // [[fiveOfAKind], [fourOfAKind], [fullHouse], [threeOfAKind], [twoPair], [onePair], [highCard]]
    var orderedHands: [[Int]] = Array(repeating: [], count: 7)
    
    for hand in hands {
        
        if hand.cards.count == 1
            || (hand.cards.count == 2 && hand.cards[.joker] != nil) { // five of a kind
            orderedHands[0].append(hand.bid)
        } else if hand.cards.count == 2
                    || (hand.cards.count == 3 && hand.cards[.joker] != nil) { // four of a kind, full house
            if hand.cards.contains(where: { $0.value == 4 })
            || hand.cards.contains(where: { $0.value == 4 - (hand.cards[.joker] ?? 0) }) { // four of a kind
                orderedHands[1].append(hand.bid)
            } else { // full house
                orderedHands[2].append(hand.bid)
            }
        } else if hand.cards.count == 3
                    || (hand.cards.count == 4 && hand.cards[.joker] != nil) { // three of a kind, two pair
            if hand.cards.contains(where: { $0.value == 3 })
                || hand.cards.contains(where: { $0.value == 3 - (hand.cards[.joker] ?? 0) }) { // three of a kind
                orderedHands[3].append(hand.bid)
            } else { // two pair
                orderedHands[4].append(hand.bid)
            }
        } else if hand.cards.count == 4
                    || (hand.cards.count == 5 && hand.cards[.joker] != nil) { // one pair
            orderedHands[5].append(hand.bid)
        } else { // high card
            orderedHands[6].append(hand.bid)
        }
    }
    
    var currRank = hands.count
    var totalBids = 0
    for handTypes in orderedHands {
        for hand in handTypes {
            totalBids += (hand * currRank)
            currRank -= 1
        }
    }
    
    return totalBids
}
