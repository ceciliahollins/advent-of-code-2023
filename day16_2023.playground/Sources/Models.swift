import Foundation

struct Contraption {
    var parts: [[ContraptionPart]]
    var beams: [LightBeam] = []
}

struct LightBeam {
    var position: (x: Int, y: Int) = (0, 0)
    var direction: Direction
    
    mutating func move(_ part: ContraptionPart) -> LightBeam? {
        switch direction {
        case .left:
            switch part {
            case .empty, .horizontalSplitter:
                moveLeft()
            case .rightMirror:
                moveDown()
            case .leftMirror:
                moveUp()
            case .verticalSplitter:
                return splitTheBeam(.left)
            }
        case .right:
            switch part {
            case .empty, .horizontalSplitter:
                moveRight()
            case .rightMirror:
                moveUp()
            case .leftMirror:
                moveDown()
            case .verticalSplitter:
                return splitTheBeam(.right)
            }
        case .up:
            switch part {
            case .empty, .verticalSplitter:
                moveUp()
            case .rightMirror:
                moveRight()
            case .leftMirror:
                moveLeft()
            case .horizontalSplitter:
                return splitTheBeam(.up)
            }
        case .down:
            switch part {
            case .empty, .verticalSplitter:
                moveDown()
            case .rightMirror:
                moveLeft()
            case .leftMirror:
                moveRight()
            case .horizontalSplitter:
                return splitTheBeam(.down)
            }
        }
        return nil
    }
    
    mutating func moveLeft() {
        position = (position.x - 1, position.y)
        direction = .left
    }
    
    mutating func moveRight() {
        position = (position.x + 1, position.y)
        direction = .right
    }
    
    mutating func moveUp() {
        position = (position.x, position.y - 1)
        direction = .up
    }
    
    mutating func moveDown() {
        position = (position.x, position.y + 1)
        direction = .down
    }
    
    mutating func splitTheBeam(_ direction: Direction) -> LightBeam {
        // move the current beam and return a new beam
        switch direction {
        case .left, .right:
            moveUp()
            return LightBeam(position: (position.x, position.y + 1), direction: .down)
        case .up, .down:
            moveLeft()
            return LightBeam(position: (position.x + 1, position.y), direction: .right)
        }
    }
}

enum ContraptionPart: Character {
    case empty = "."
    case rightMirror = "/"
    case leftMirror = #"\"#
    case verticalSplitter = "|"
    case horizontalSplitter = "-"
}

enum Direction {
    case left
    case right
    case up
    case down
}

