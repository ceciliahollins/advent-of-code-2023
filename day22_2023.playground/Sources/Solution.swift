import Foundation


public func sandSlabs(_ input: String) -> Int {
    
    var stack = input.inputToStack()
    stack.printStack()
    
    // push all the bricks down to complete the descent
    var currBrickID = 1
    while currBrickID <= stack.bricks.count {
        switch stack.bricks[currBrickID].direction {
        case .x:
            print("skip")
        case .y:
            print("skip")
        case .z:
            var belowIsOpen = true
            while belowIsOpen {
                if stack.bricks[currBrickID].start.z > 0,
                   stack.stack[stack.bricks[currBrickID].start.z - 1][stack.bricks[currBrickID].start.y][stack.bricks[currBrickID].start.x] == 0 {
                    
                    var currZ = stack.bricks[currBrickID].start.z
                    while currZ <= stack.bricks[currBrickID].end.z {
                        stack.stack[currZ-1][stack.bricks[currBrickID].start.y][stack.bricks[currBrickID].start.x] = 0
                        stack.stack[currZ][stack.bricks[currBrickID].start.y][stack.bricks[currBrickID].start.x] = 0
                        currZ += 1
                    }
                    stack.bricks[currBrickID].start.z -= 1
                    stack.bricks[currBrickID].end.z -= 1
                } else {
                    belowIsOpen = false
                }
            }
        }
        currBrickID += 1
    }
    
    stack.printStack()
    
    return 0
}

public func sandSlabsPartTwo(_ input: String) -> Int {
    
    return 0
}
