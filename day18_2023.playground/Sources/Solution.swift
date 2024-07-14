import Foundation

public func lavaductLagoon(_ input: String) -> Int {
    
    var lagoon = Lagoon(digPlan: input.inputToDigPlan())
    
    var trenchCount = 0
    
    // Dig the outside
    var currPosition: (x: Int, y: Int) = (0,0)
    for step in lagoon.digPlan {
        currPosition = lagoon.dig(step, currPosition)
    }
    
    // Dig the inside and count the squares
    let xLength = lagoon.terrain.first!.count
    let yLength = lagoon.terrain.count
    
    for y in 0..<yLength {
        var isInside = false
        for x in 0..<xLength {
            
            if lagoon.isSideSquare(x, y) {
                isInside.toggle()
            }
            
            if isInside {
                lagoon.terrain[y][x].isDug = true
            }
            
            trenchCount += lagoon.terrain[y][x].isDug ? 1 : 0
        }
    }
    
    return trenchCount
}

public func lavaductLagoonPartTwo(_ input: String) -> Int {
    
    var lagoon = Lagoon(digPlan: input.inputToDigPlan())
    
    // Use Shoelace Formula to calculate area
    // https://www.youtube.com/watch?v=Bh0pSVByxbo&ab_channel=JustinRyan
    
    var currPosition: (x: Int, y: Int) = (0, 0)
    var x1 = 0
    var y1 = 0
    var area = 0
    var perimeter = 0
    for step in lagoon.digPlan {
        var color = step.color
        color.removeFirst() // remove the hash
        let correctedSteps = Int(String(color[color.startIndex...color.index(color.startIndex, offsetBy: 4)]), radix: 16) ?? 0
        let correctedDirection = Direction.directionFromNum(Int(String(color.last!)) ?? 0)
        let updatedStep = DigStep(direction: correctedDirection,
                                  meters: correctedSteps,
                                  color: color)
        
        
        currPosition = lagoon.digPartTwo(updatedStep, currPosition)
        let x2 = currPosition.x
        let y2 = currPosition.y
        area += (x1*y2) - (x2*y1)
        perimeter += updatedStep.meters
        
        x1 = currPosition.x
        y1 = currPosition.y
    }
    
    // divide in half
    area /= 2
    perimeter = (perimeter / 2) + 1
    
    // add the perimeter
    area += perimeter
    
    return area
}
