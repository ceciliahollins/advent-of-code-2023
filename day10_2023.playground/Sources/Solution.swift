import Foundation


public func pipeMaze(_ input: String) -> Int {
    
    let pipeMaze = input.inputToPipeMaze()
    
    var mazePositionOne: PipePosition
    var mazePositionTwo: PipePosition
    
    var startPoint = pipeMaze.startPosition
    let startPointMoveOne = startPoint.pipe.entryPoints.0
    let startPointMoveTwo = startPoint.pipe.entryPoints.1
        
    startPoint.entry = startPointMoveTwo
    let moveOne = startPoint.move
    mazePositionOne = PipePosition(position: moveOne,
                                   pipe: pipeMaze.maze[moveOne.1][moveOne.0],
                                   entry: startPointMoveOne.opposite)
                                   
    startPoint.entry = startPointMoveOne
    let moveTwo = startPoint.move
    mazePositionTwo = PipePosition(position: moveTwo,
                                   pipe: pipeMaze.maze[moveTwo.1][moveTwo.0],
                                   entry: startPointMoveTwo.opposite)
    
    var count = 1
    while mazePositionOne != mazePositionTwo {
        mazePositionOne = PipePosition(position: mazePositionOne.move,
                                       pipe: pipeMaze.maze[mazePositionOne.move.1][mazePositionOne.move.0],
                                       entry: mazePositionOne.entry != mazePositionOne.pipe.entryPoints.0
                                       ? mazePositionOne.pipe.entryPoints.0.opposite
                                       : mazePositionOne.pipe.entryPoints.1.opposite)
        
        mazePositionTwo = PipePosition(position: mazePositionTwo.move,
                                       pipe: pipeMaze.maze[mazePositionTwo.move.1][mazePositionTwo.move.0],
                                       entry: mazePositionTwo.entry != mazePositionTwo.pipe.entryPoints.0
                                       ? mazePositionTwo.pipe.entryPoints.0.opposite
                                       : mazePositionTwo.pipe.entryPoints.1.opposite)
        
        count += 1
    }

    return count
}

public func pipeMazePartTwo(_ input: String) -> Int {
    
    let pipeMaze = input.inputToPipeMaze()
    
    // MARK: find the pipes that are in the maze to weed out scrap pipes
    var startPoint = pipeMaze.startPosition
    startPoint.entry = startPoint.pipe.entryPoints.1
    let startPointMoveOne = startPoint.pipe.entryPoints.0
    var currPoint = PipePosition(position: startPoint.move,
                                 pipe: pipeMaze.maze[startPoint.move.1][startPoint.move.0],
                                 entry: startPointMoveOne.opposite)
    var pipesApartOfMaze: Set = ["\(startPoint.position.0), \(startPoint.position.1)"]

    while currPoint != startPoint {
        pipesApartOfMaze.insert("\(currPoint.position.0), \(currPoint.position.1)")
        
        currPoint = PipePosition(position: currPoint.move,
                                     pipe: pipeMaze.maze[currPoint.move.1][currPoint.move.0],
                                     entry: currPoint.entry != currPoint.pipe.entryPoints.0
                                     ? currPoint.pipe.entryPoints.0.opposite
                                     : currPoint.pipe.entryPoints.1.opposite)
    }
    
    // MARK: find the ground and determine if it is in the loop
    // https://alienryderflex.com/polygon/
    var insideCount = 0
    for (y, row) in pipeMaze.maze.enumerated() {
        for (x, _) in row.enumerated() {
            
            if !pipesApartOfMaze.contains("\(x), \(y)") {
                var currX = x
                
                var leftCrosses = 0
                while currX >= 0 {
                    if pipeMaze.maze[y][currX].isCrossingPipe
                    && pipesApartOfMaze.contains("\(currX), \(y)") {
                        leftCrosses += 1
                    }
                    currX -= 1
                }
                
                var rightCrosses = 0
                currX = x
                while currX < row.count {
                    if pipeMaze.maze[y][currX].isCrossingPipe
                        && pipesApartOfMaze.contains("\(currX), \(y)") {
                        rightCrosses += 1
                    }
                    currX += 1
                }
                
                
                if leftCrosses % 2 != 0 && rightCrosses % 2 != 0 {
                    insideCount += 1
                }
            }
        }
    }

    return insideCount
}
