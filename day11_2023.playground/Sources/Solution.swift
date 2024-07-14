import Foundation


public func cosmicExpansion(_ input: String, universeSize: Int) -> Int {

    let universe = input.inputToGalaxyLocations(universeSize)
    
    var totalDistance = 0
    
    for i in 0..<universe.count {
        for j in i..<universe.count {
            let pairOne = universe[i]
            let pairTwo = universe[j]
            
            let x = abs(pairOne.0 - pairTwo.0)
            let y = abs(pairOne.1 - pairTwo.1)
            totalDistance += (x+y)
        }
    }
    
    return totalDistance
}
