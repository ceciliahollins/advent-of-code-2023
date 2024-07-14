import Foundation

struct Garden {
    var map: [[Plot]] = []
    var start: Position = Position(0, 0)
    
    func move(_ x: Int, _ y: Int) -> [Position] {
        var movePositions: [Position] = []
        
        // move left
        if x - 1 >= 0, map[y][x - 1] == .garden {
            movePositions.append(Position(x - 1, y))
        }
        
        // move right
        if x + 1 < map.first!.count, map[y][x + 1] == .garden {
            movePositions.append(Position(x + 1, y))
        }
        
        // move up
        if y - 1 >= 0, map[y - 1][x] == .garden {
            movePositions.append(Position(x, y - 1))
        }
        
        // move down
        if y + 1 < map.count, map[y + 1][x] == .garden {
            movePositions.append(Position(x, y + 1))
        }
        
        return movePositions
    }
    
    func movePartTwo(_ plotPos: PlotPosition, gardenPos: GardenPosition) -> [(PlotPosition, GardenPosition)] {
        
        var movePositions: [(PlotPosition, GardenPosition)] = []
        
        let xEnd = map.first!.count - 1
        let yEnd = map.count - 1
        
        // move left
        let leftMovePlot = plotPos.x - 1 < 0 ? xEnd : plotPos.x - 1
        // add to the move positions if the left plot is garden
        if map[plotPos.y][leftMovePlot] == .garden {
            var leftMoveGarden = gardenPos
            // if the position entered a new garden, update the garden positions
            if leftMovePlot == xEnd {
                leftMoveGarden = GardenPosition(leftMoveGarden.x - 1, leftMoveGarden.y)
            }
            
            movePositions.append((PlotPosition(leftMovePlot, plotPos.y), leftMoveGarden))
        }
        
        // move right
        let rightMovePlot = plotPos.x + 1 > xEnd ? 0 : plotPos.x + 1
        // add to the move positions if the right plot is garden
        if map[plotPos.y][rightMovePlot] == .garden {
            var rightMoveGarden = gardenPos
            // if the position entered a new garden, update the garden positions
            if rightMovePlot == 0 {
                rightMoveGarden = GardenPosition(rightMoveGarden.x + 1, rightMoveGarden.y)
            }
            movePositions.append((PlotPosition(rightMovePlot, plotPos.y), rightMoveGarden))
        }
        
        // move up
        let upMovePlot = plotPos.y - 1 < 0 ? yEnd : plotPos.y - 1
        // add to the move positions if the up plot is garden
        if map[upMovePlot][plotPos.x] == .garden {
            var upMoveGarden = gardenPos
            // if the position entered a new garden, update the garden positions
            if upMovePlot == yEnd {
                upMoveGarden = GardenPosition(upMoveGarden.x, upMoveGarden.y - 1)
            }
            
            movePositions.append((PlotPosition(plotPos.x, upMovePlot), upMoveGarden))
        }
        
        // move down
        let downMovePlot = plotPos.y + 1 > yEnd ? 0 : plotPos.y + 1
        // add to the move positions if the down plot is garden
        if map[downMovePlot][plotPos.x] == .garden {
            var downMoveGarden = gardenPos
            // if the position entered a new garden, update the garden positions
            if downMovePlot == 0 {
                downMoveGarden = GardenPosition(downMoveGarden.x, downMoveGarden.y + 1)
            }
            
            movePositions.append((PlotPosition(plotPos.x, downMovePlot), downMoveGarden))
        }
        
        return movePositions
    }
}

typealias PlotPosition = Position
typealias GardenPosition = Position

struct Position: Hashable {
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

enum Plot: String {
    case garden = "."
    case rock = "#"
}

