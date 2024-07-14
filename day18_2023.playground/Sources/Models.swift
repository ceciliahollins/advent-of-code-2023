import Foundation
import SwiftUI

struct Lagoon {
    // terrain only used in part one
    var terrain: [[LagoonSquare]] = [[LagoonSquare(isDug: true)]]
    var digPlan: [DigStep]
    
    // MARK: Part one
    
    /* 
     This is what I used for part one. I physically drew out the lagoon with the terrain variable and added space into the array where I needed. It worked well for part one, but I found it was far too inefficient for part 2. I could improve part 1 to use my improved algo from part 2, but I thought it was nice to leave in to show my improvement
     */
    mutating func dig(_ digStep: DigStep, _ currPos: (x: Int, y: Int)) -> (x: Int, y: Int) {
        var count = 0
        var currPosition = currPos
        while count < digStep.meters {
            let x = currPosition.x
            let y = currPosition.y
            let xLength = terrain.first!.count
            let yLength = terrain.count
            
            switch digStep.direction {
            case .up:
                if y - 1 < 0 {
                    terrain.insert(Array(repeating: LagoonSquare(), count: xLength), at: 0)
                } else {
                    currPosition = (x, y - 1)
                }
            case .down:
                if y + 1 > yLength - 1 {
                    terrain.append(Array(repeating: LagoonSquare(), count: xLength))
                }
                currPosition = (x, y + 1)
            case .left:
                if x - 1 < 0 {
                    for i in 0..<yLength {
                        terrain[i].insert(LagoonSquare(), at: 0)
                    }
                } else {
                    currPosition = (x - 1, y)
                }
            case .right:
                if x + 1 > xLength - 1 {
                    for i in 0..<yLength {
                        terrain[i].append(LagoonSquare())
                    }
                }
                currPosition = (x + 1, y)
            }
            
            terrain[currPosition.y][currPosition.x].isDug = true
            terrain[currPosition.y][currPosition.x].color = digStep.color
            
            count += 1
        }
        return currPosition
    }
    
    // https://alienryderflex.com/polygon/
    func isSideSquare(_ x: Int, _ y: Int) -> Bool {
        let xLength = terrain.first!.count
        let yLength = terrain.count
        
        if terrain[y][x].color != nil // it is a perimeter piece
            && (x == 0 || (x-1 >= 0  && terrain[y][x-1].color == nil) // it has a non perimiter piece next to it
                || (x == xLength-1 || (x+1 < xLength && terrain[y][x+1].color == nil))) // or it is an edge piece
            && ((y+1 < yLength && terrain[y+1][x].color != nil) // it has a perimeter piece below it
                || (y+1 == yLength-1 && terrain[y-1][x].color != nil)) // or it is a bottom piece and it has a perimeter piece above
        {
            return true
        }
        return false
    }
    
    // MARK: Part two
    
    /*
     my much improved algorithm for part two
     only needs to return next vertex
     */
    mutating func digPartTwo(_ digStep: DigStep, _ currPos: (x: Int, y: Int)) -> (x: Int, y: Int) {
        var currPosition = currPos
        let x = currPosition.x
        let y = currPosition.y
        
        switch digStep.direction {
        case .up:
            currPosition = (x, y - digStep.meters)
        case .down:
            currPosition = (x, y + digStep.meters)
        case .left:
            currPosition = (x - digStep.meters, y)
        case .right:
            currPosition = (x + digStep.meters, y)
        }
        
        return currPosition
    }
}

struct DigStep {
    let direction: Direction
    let meters: Int
    let color: String
}

struct LagoonSquare {
    var isDug: Bool = false
    var color: String? = nil
}

enum Direction: String {
    case up = "U"
    case down = "D"
    case left = "L"
    case right = "R"
    
    static func directionFromNum(_ num: Int) -> Direction {
        switch num {
        case 0: 
            return .right
        case 1: 
            return .down
        case 2: 
            return .left
        default: 
            return .up
        }
    }
}

