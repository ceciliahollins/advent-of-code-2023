extension String {
    
    func inputToPipeMaze() -> PipeMaze {
        
        var str = self
        var result: PipeMaze = PipeMaze()
        
        var i = 0
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            result.maze.append([])
            
            for (j, char) in line.enumerated() {
                
                if char == "S" {
                    result.startPosition.position = (j, i)
                }
                
                result.maze[result.maze.count - 1].append(Pipe(rawValue: String(char)) ?? .ground)
            }
            
            i += 1
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        let xStart = result.startPosition.position.0
        let yStart = result.startPosition.position.1
        
        let canGoLeft = xStart - 1 >= 0 && (result.maze[yStart][xStart - 1] == .horizontal
                                            || result.maze[yStart][xStart - 1] == .northEast
                                            || result.maze[yStart][xStart - 1] == .southEast)
        let canGoRight = xStart + 1 < result.maze[0].count && (result.maze[yStart][xStart + 1] == .horizontal
                                                               || result.maze[yStart][xStart + 1] == .northWest
                                                               || result.maze[yStart][xStart + 1] == .southWest)
        let canGoUp = yStart - 1 >= 0 && (result.maze[yStart - 1][xStart] == .vertical
                                          || result.maze[yStart - 1][xStart] == .southWest
                                          || result.maze[yStart - 1][xStart] == .southEast)
        let canGoDown = yStart + 1 < result.maze.count && (result.maze[yStart + 1][xStart] == .vertical
                                                           || result.maze[yStart + 1][xStart] == .northEast
                                                           || result.maze[yStart + 1][xStart] == .northWest)
                
        if canGoUp && canGoDown {
            result.startPosition.pipe = .vertical
            result.maze[result.startPosition.position.1][result.startPosition.position.0] = .vertical
        } else if canGoLeft && canGoRight {
            result.startPosition.pipe = .horizontal
            result.maze[result.startPosition.position.1][result.startPosition.position.0] = .horizontal
        } else if canGoUp && canGoRight {
            result.startPosition.pipe = .northEast
            result.maze[result.startPosition.position.1][result.startPosition.position.0] = .northEast
        } else if canGoUp && canGoLeft {
            result.startPosition.pipe = .northWest
            result.maze[result.startPosition.position.1][result.startPosition.position.0] = .northWest
        } else if canGoDown && canGoRight {
            result.startPosition.pipe = .southEast
            result.maze[result.startPosition.position.1][result.startPosition.position.0] = .southEast
        } else if canGoDown && canGoLeft {
            result.startPosition.pipe = .southWest
            result.maze[result.startPosition.position.1][result.startPosition.position.0] = .southWest
        }
        
        return result
    }
}
