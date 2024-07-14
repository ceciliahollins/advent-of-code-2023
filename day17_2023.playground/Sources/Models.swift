import Foundation

struct Map {
    let map: [[Int]] = []
}

struct Move: Hashable {
    let x: Int
    let y: Int
    let direction: Direction
    let straights: Int
    
    init(_ x: Int, _ y: Int, _ direction: Direction, _ straights: Int) {
        self.x = x
        self.y = y
        self.direction = direction
        self.straights = straights
    }
}

enum Direction {
    case left
    case right
    case up
    case down
    
    var intValue: Int {
        switch self {
        case .left:
            return 1
        case .right:
            return 2
        case .up:
            return 3
        case .down:
            return 4
        }
    }
}

