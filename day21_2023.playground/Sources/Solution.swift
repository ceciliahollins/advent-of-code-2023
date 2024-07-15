import Foundation


public func stepCounter(_ input: String, numOfSteps: Int) -> Int {
    
    let garden = input.inputToGarden()
    
    var movementQueue: Set<Position> = [garden.start]
    
    for _ in 0..<numOfSteps {
        
        var possibleSteps: Set<Position> = []
        while !movementQueue.isEmpty {
            let currPlot = movementQueue.removeFirst()
            possibleSteps.formUnion(garden.move(currPlot.x, currPlot.y))
        }
        
        movementQueue = possibleSteps
    }
    
    return movementQueue.count
}

public func stepCounterPartTwo(_ input: String, numOfSteps: Int) -> Int {
    
    let gardenPartTwo = input.inputToGarden()
    
    var pathTracker: Set<InfiniteGardenTracker> = []
    var memo: [GardenTracker: Set<InfiniteGardenPosition>] = [:]
    var finalPositions: Set<InfiniteGardenPosition> = []
    
    var dfsWalk: ((InfiniteGardenPosition, Int) -> Set<InfiniteGardenPosition>)!
    dfsWalk = { infiniteGarden, numOfSteps in
        
        let plot = infiniteGarden.plotPosition
        let garden = infiniteGarden.gardenPosition
        
        print("start (", garden.x, garden.y, ") (", plot.x, plot.y, ") steps", numOfSteps)
        
        // base case: no more steps
        guard numOfSteps > 0 else {
            print("return base case (", garden.x, garden.y, ") (", plot.x, plot.y, ")")
            finalPositions.insert(InfiniteGardenPosition(plot, garden))
            memo[GardenTracker(plotPosition: plot, remainingSteps: numOfSteps)] = [InfiniteGardenPosition(plot, garden)]
            return [InfiniteGardenPosition(plot, garden)]
        }
        
        // path is already in progress
        guard !pathTracker.contains(InfiniteGardenTracker(plotPosition: plot, gardenPosition: garden, remainingSteps: numOfSteps)) else {
            print("return path tracker")
            return []
        }
        
        // mark the current path as in progress
        pathTracker.insert(InfiniteGardenTracker(plotPosition: plot, gardenPosition: garden, remainingSteps: numOfSteps))
        
        // if this plot result has been found, quit early and return the result
        if let found = memo[GardenTracker(plotPosition: plot, remainingSteps: numOfSteps)] {
            print("memo")
            for f in found {
                print(garden.x, f.gardenPosition.x, garden.y, f.gardenPosition.y)
                print("(", garden.x + f.gardenPosition.x, garden.y + f.gardenPosition.y, ") (", f.plotPosition.x, f.plotPosition.y, ")")
                print("---")
                finalPositions.insert(InfiniteGardenPosition(f.plotPosition,
                                                             GardenPosition(garden.x + f.gardenPosition.x,
                                                                            garden.y + f.gardenPosition.y)))
            }
            return Set(found)
        }
        
        var moveResult: Set<InfiniteGardenPosition> = []
        
        let moves = gardenPartTwo.movePartTwo(plot, gardenPos: garden)
        for move in moves {
            moveResult.formUnion(dfsWalk(InfiniteGardenPosition(move.0, move.1),
                                         numOfSteps - 1))
            print("return from (", move.1.x, move.1.y, ") (", move.0.x, move.0.y, ")")
        }
        let set = Set(moveResult.map({ InfiniteGardenPosition($0.plotPosition,
                                                              GardenPosition($0.gardenPosition.x - garden.x, $0.gardenPosition.y - garden.y)) }))
        print("add to memo for plot (", plot.x, plot.y, ") steps", numOfSteps)
        for f in set {
            print("(", f.gardenPosition.x, f.gardenPosition.y, ") (", f.plotPosition.x, f.plotPosition.y, ")")
        }
        memo[GardenTracker(plotPosition: plot, remainingSteps: numOfSteps)] = set
        
        return moveResult
    }
    
    let _ = dfsWalk(InfiniteGardenPosition(gardenPartTwo.start, GardenPosition(0, 0)), numOfSteps)
    print("-----end------")
    for p in finalPositions {
        print("(", p.gardenPosition.x, p.gardenPosition.y, ") (", p.plotPosition.x, p.plotPosition.y, ")")
    }
    return finalPositions.count
}

struct InfiniteGardenPosition: Hashable {
    var plotPosition: PlotPosition
    var gardenPosition: GardenPosition
    
    init(_ plotPosition: PlotPosition, _ gardenPosition: GardenPosition) {
        self.plotPosition = plotPosition
        self.gardenPosition = gardenPosition
    }
}

struct InfiniteGardenTracker: Hashable {
    var plotPosition: PlotPosition
    var gardenPosition: GardenPosition
    var remainingSteps: Int
}

struct GardenTracker: Hashable {
    var plotPosition: PlotPosition
    var remainingSteps: Int
}
