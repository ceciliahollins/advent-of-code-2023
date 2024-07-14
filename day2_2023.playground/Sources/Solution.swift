import Foundation


public func cubeConundrum(_ input: String) -> Int {
    
    let cubeGames: [CubeGame] = input.inputToCubeGames()
    var idTotal = 0
    
    for game in cubeGames {
        
        var valid = true
        for draw in game.draws {
            switch draw.cubeColor {
            case .red:
                valid = draw.numOfCubes <= 12 && valid
            case .green:
                valid = draw.numOfCubes <= 13 && valid
            case .blue:
                valid = draw.numOfCubes <= 14 && valid
            }
        }
        idTotal += valid ? game.id : 0
    }
    
    return idTotal
}

public func cubeConundrumPartTwo(_ input: String) -> Int {
    let cubeGames: [CubeGame] = input.inputToCubeGames()
    
    var total = 0
    
    for game in cubeGames {
        
        var red = 0
        var green = 0
        var blue = 0
        
        for draw in game.draws {
            switch draw.cubeColor {
            case .red:
                red = max(draw.numOfCubes, red)
            case .green:
                green = max(draw.numOfCubes, green)
            case .blue:
                blue = max(draw.numOfCubes, blue)
            }
        }
        
        total += red * green * blue
    }
    return total
}
