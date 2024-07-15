import Foundation


public func parabolicReflectorDish(_ input: String) -> Int {
    
    var dish = input.inputToParabolicReflectorDish()
    
    var result = 0
    
    for (i, row) in dish.enumerated() {
        for (j, rock) in row.enumerated() {
            
            if rock == .round {
                var currY = i
                while currY > 0 && dish[currY - 1][j] == .empty {
                    dish[currY - 1][j] = .round
                    dish[currY][j] = .empty
                    currY -= 1
                }
                
                result += dish.count - currY
            }
        }
    }
    
    return result
}

public func parabolicReflectorDishPartTwo(_ input: String) -> Int {
    
    var dish = input.inputToParabolicReflectorDish()
    
    var result = 0
    let numOfRequiredCycles = 1000000000
    
    var cycle = 0
    var repeatCycleFound = false

    var memo: [[[RockType]]: Int] = [:]
    memo[dish] = 0
    while !repeatCycleFound {
        
        cycle += 1
        
        // north - start at the top and move down, pushing items up
        for (y, row) in dish.enumerated() {
            for (x, rock) in row.enumerated() {
                
                if rock == .round {
                    var currY = y
                    while currY > 0 && dish[currY - 1][x] == .empty {
                        dish[currY - 1][x] = .round
                        dish[currY][x] = .empty
                        currY -= 1
                    }
                }
            }
        }
        
        // west - start at the left and move right, pushing items left
        var x = 0
        while x < dish.first?.count ?? 0 {
            var y = 0
            while y < dish.count {
                let rock = dish[y][x]
                
                if rock == .round {
                    var currX = x
                    while currX > 0 && dish[y][currX - 1] == .empty {
                        dish[y][currX - 1] = .round
                        dish[y][currX] = .empty
                        currX -= 1
                    }
                }
                
                y += 1
            }
            x += 1
        }
        
        // south - start at the bottom and move up, pushing items down
        for (y, row) in dish.enumerated().reversed() {
            for (x, rock) in row.enumerated() {
                
                if rock == .round {
                    var currY = y
                    while currY < dish.count - 1 && dish[currY + 1][x] == .empty {
                        dish[currY + 1][x] = .round
                        dish[currY][x] = .empty
                        currY += 1
                    }
                }
            }
        }
        
        // east - start at the right and move left, pushing items right
        x = (dish.first?.count ?? 1) - 1
        while x >=  0 {
            var y = 0
            while y < dish.count {
                let rock = dish[y][x]
                
                if rock == .round {
                    var currX = x
                    while currX < dish[y].count - 1 && dish[y][currX + 1] == .empty {
                        dish[y][currX + 1] = .round
                        dish[y][currX] = .empty
                        currX += 1
                    }
                }
                
                y += 1
            }
            x -= 1
        }
        
        // if a cycle is found, manually rotated is no longer needed
        if let startOfCycle = memo[dish] {
            repeatCycleFound = true
            let repeatCycleCount = cycle - startOfCycle
            let remainderCycleCount = (numOfRequiredCycles - (startOfCycle - 1)) % repeatCycleCount
            let dishAfterNRotations = startOfCycle + (remainderCycleCount - 1)
            dish = memo.first(where: { $0.value == dishAfterNRotations })?.key ?? dish
        } else {
            memo[dish] = cycle
        }
    }
    
    for (y, row) in dish.enumerated() {
        for rock in row {
            if rock == .round {
                result += dish.count - y
            }
        }
    }
    
    return result
}
