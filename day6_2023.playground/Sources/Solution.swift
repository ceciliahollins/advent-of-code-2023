import Foundation


func waitForIt(_ input: [BoatRace]) -> Int {
    
    var result = 1
    
    for boatRaceRecord in input {
        
        var possibleRecords = 0
        for buttonHoldingTime in 0...boatRaceRecord.time {
            let timeToTravel = boatRaceRecord.time - buttonHoldingTime
            let distance = timeToTravel * buttonHoldingTime
            
            possibleRecords += distance > boatRaceRecord.distance ? 1 : 0
        }
        
        result *= possibleRecords
    }
    
    return result
}

func waitForItPartTwo(_ input: BoatRace) -> Int {
    
    var possibleRecords = 0
    for buttonHoldingTime in 0...input.time {
        let timeToTravel = input.time - buttonHoldingTime
        let distance = timeToTravel * buttonHoldingTime
        
        possibleRecords += distance > input.distance ? 1 : 0
    }
    
    return possibleRecords
}
