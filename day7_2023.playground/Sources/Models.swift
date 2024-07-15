import Foundation

struct CamelCardHand {
    var cards: [Card: Int]
    var orderedCards: [Card]
    var bid: Int
}

struct CamelCardHandPartTwo {
    var cards: [CardPartTwo: Int]
    var orderedCards: [CardPartTwo]
    var bid: Int
}

enum Card: String {
    case ace = "A"
    case king = "K"
    case queen = "Q"
    case jack = "J"
    case ten = "T"
    case nine = "9"
    case eight = "8"
    case seven = "7"
    case six = "6"
    case five = "5"
    case four = "4"
    case three = "3"
    case two = "2"
    
    var strength: Int {
        switch self {
        case .ace:
            return 14
        case .king:
            return 13
        case .queen:
            return 12
        case .jack:
            return 11
        case .ten:
            return 10
        case .nine:
            return 9
        case .eight:
            return 8
        case .seven:
            return 7
        case .six:
            return 6
        case .five:
            return 5
        case .four:
            return 4
        case .three:
            return 3
        case .two:
            return 2
        }
    }
}

enum CardPartTwo: String {
    case ace = "A"
    case king = "K"
    case queen = "Q"
    case joker = "J"
    case ten = "T"
    case nine = "9"
    case eight = "8"
    case seven = "7"
    case six = "6"
    case five = "5"
    case four = "4"
    case three = "3"
    case two = "2"
    
    var strength: Int {
        switch self {
        case .ace:
            return 14
        case .king:
            return 13
        case .queen:
            return 12
        case .ten:
            return 10
        case .nine:
            return 9
        case .eight:
            return 8
        case .seven:
            return 7
        case .six:
            return 6
        case .five:
            return 5
        case .four:
            return 4
        case .three:
            return 3
        case .two:
            return 2
        case .joker:
            return 1
        }
    }
}

enum HandTypes {
    case fiveOfAKind
    case fourOfAKind
    case fullHouse
    case threeOfAKind
    case twoPair
    case onePair
    case highCard
    
    var handBidsWithRanking: [(Int, Int)] {
        return []
    }
    
    func getRanking() -> Int {
        switch self {
        case .fiveOfAKind:
            return 0
        case .fourOfAKind:
            return 0
        case .fullHouse:
            return 0
        case .threeOfAKind:
            return 0
        case .twoPair:
            return 0
        case .onePair:
            return 0
        case .highCard:
            return 0
        }
    }
}

