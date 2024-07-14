import Foundation

struct PipeMaze {
    var maze: [[Pipe]] = []
    var startPosition: PipePosition = PipePosition()
}

struct PipePosition {
    var position: (Int, Int) = (0, 0)
    var pipe: Pipe = .ground
    var entry: Entry = .none
    
    var move: (Int, Int) {
        let curr = self.position
        switch pipe {
        case .vertical:
            switch entry {
            case .above:
                return (curr.0, curr.1 + 1)
            case .below:
                return (curr.0, curr.1 - 1)
            default:
                return (curr.0, curr.1)
            }
        case .horizontal:
            switch entry {
            case .left:
                return (curr.0 + 1, curr.1)
            case .right:
                return (curr.0 - 1, curr.1)
            default:
                return (curr.0, curr.1)
            }
        case .northEast:
            switch entry {
            case .above:
                return (curr.0 + 1, curr.1)
            case .right:
                return (curr.0, curr.1 - 1)
            default:
                return (curr.0, curr.1)
            }
        case .northWest:
            switch entry {
            case .above:
                return (curr.0 - 1, curr.1)
            case .left:
                return (curr.0, curr.1 - 1)
            default:
                return (curr.0, curr.1)
            }
        case .southWest:
            switch entry {
            case .below:
                return (curr.0 - 1, curr.1)
            case .left:
                return (curr.0, curr.1 + 1)
            default:
                return (curr.0, curr.1)
            }
        case .southEast:
            switch entry {
            case .below:
                return (curr.0 + 1, curr.1)
            case .right:
                return (curr.0, curr.1 + 1)
            default:
                return (curr.0, curr.1)
            }
        case .ground:
            return (curr.0, curr.1)
        }
    }
}

extension PipePosition: Equatable {
    static func == (lhs: PipePosition, rhs: PipePosition) -> Bool {
        lhs.position == rhs.position
    }
}

enum Pipe: String {
    case vertical = "|"
    case horizontal = "-"
    case northEast = "L"
    case northWest = "J"
    case southWest = "7"
    case southEast = "F"
    case ground = "."
    
    var entryPoints: (Entry, Entry) {
        switch self {
        case .vertical:
            return (.above, .below)
        case .horizontal:
            return (.left, .right)
        case .northEast:
            return (.above, .right)
        case .northWest:
            return (.above, .left)
        case .southWest:
            return (.below, .left)
        case .southEast:
            return (.below, .right)
        case .ground:
            return (.none, .none)
        }
    }
    
    // https://alienryderflex.com/polygon/ Figure 4 & 5
    var isCrossingPipe: Bool {
        return self == .northEast || self == .northWest || self == .vertical
    }
}

enum Entry {
    case left
    case right
    case above
    case below
    case none
    
    var opposite: Entry {
        switch self {
        case .left:
            return .right
        case .right:
            return .left
        case .above:
            return .below
        case .below:
            return .above
        case .none:
            return .none
        }
    }
}

