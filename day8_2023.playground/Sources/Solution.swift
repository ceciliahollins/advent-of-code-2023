import Foundation


public func hauntedWasteland(_ input: String) -> Int {
    
    let map = input.inputToMap()
    
    var currentLocation = "AAA"
    var currDir = 0
    var numOfSteps = 0
    while currentLocation != "ZZZ" {
        currentLocation = map.directions[currDir] == .left
            ? map.network[currentLocation]!.0
            : map.network[currentLocation]!.1
        
        currDir = currDir == map.directions.count - 1
            ? 0
            : currDir + 1
        
        numOfSteps += 1
    }
    
    return numOfSteps
}

public func hauntedWastelandPartTwo(_ input: String) -> Int {
    
    let map = input.inputToMap()
    
    let currentLocations = map.network.keys.filter({ $0.last == "A" })
    var numOfSteps: [Int] = []
    for currentLocation in currentLocations {
        var currLoc = currentLocation
        var currNumOfSteps = 0
        var currDir = 0
        
        while currLoc.last != "Z" {
            currLoc = map.directions[currDir] == .left
                ? map.network[currLoc]!.0
                : map.network[currLoc]!.1
            
            currDir = currDir == map.directions.count - 1
                ? 0
                : currDir + 1
            
            currNumOfSteps += 1
        }
        
        numOfSteps.append(currNumOfSteps)
    }
    
    return lcm(numOfSteps)
}
