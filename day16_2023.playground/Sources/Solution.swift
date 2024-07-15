import Foundation


public func TheFloorWillBeLava(_ input: String) -> Int {
    
    let contraption = input.inputToContraption()
    
    return numOfEnergizedTiles(contraption)
}

public func TheFloorWillBeLavaPartTwo(_ input: String) -> Int {
    
    let contraption = input.inputToContraption()
    var maxNumOfEnergizedTiles = -1
    
    // all left tiles
    for i in 0..<contraption.parts.count {
        let possibleContraption = Contraption(parts: contraption.parts,
                                              beams: [LightBeam(position: (0, i),
                                                                direction: .right)])
        let possibleResult = numOfEnergizedTiles(possibleContraption)
        maxNumOfEnergizedTiles = max(maxNumOfEnergizedTiles, possibleResult)
    }
    
    // all right tiles
    for i in 0..<contraption.parts.count {
        let possibleContraption = Contraption(parts: contraption.parts,
                                              beams: [LightBeam(position: (contraption.parts[i].count - 1, i),
                                                                direction: .left)])
        let possibleResult = numOfEnergizedTiles(possibleContraption)
        maxNumOfEnergizedTiles = max(maxNumOfEnergizedTiles, possibleResult)
    }
    
    // all top tiles
    for i in 0..<contraption.parts[0].count {
        let possibleContraption = Contraption(parts: contraption.parts,
                                              beams: [LightBeam(position: (i, 0),
                                                                direction: .down)])
        let possibleResult = numOfEnergizedTiles(possibleContraption)
        maxNumOfEnergizedTiles = max(maxNumOfEnergizedTiles, possibleResult)
    }
    
    // all bottom tiles
    for i in 0..<contraption.parts[0].count {
        let possibleContraption = Contraption(parts: contraption.parts,
                                              beams: [LightBeam(position: (i, contraption.parts.count - 1),
                                                                direction: .up)])
        let possibleResult = numOfEnergizedTiles(possibleContraption)
        maxNumOfEnergizedTiles = max(maxNumOfEnergizedTiles, possibleResult)
    }
    
    return maxNumOfEnergizedTiles
}

func numOfEnergizedTiles(_ contraption: Contraption) -> Int {
    
    var contraption = contraption
    // [x,y : [directions]]
    var energizedTiles: [[Int]: [Direction]] = [[contraption.beams[0].position.x, contraption.beams[0].position.y]: [contraption.beams[0].direction]]
    
    while !contraption.beams.isEmpty {
        var i = 0
        while i < contraption.beams.count {
            let currentTile = contraption.parts[contraption.beams[i].position.y][contraption.beams[i].position.x]
            let moveBeam = contraption.beams[i].move(currentTile)
            
            if (contraption.beams[i].position.x < 0 || contraption.beams[i].position.x > contraption.parts[0].count - 1
            || contraption.beams[i].position.y < 0 ||  contraption.beams[i].position.y > contraption.parts.count - 1)
            || (energizedTiles[[contraption.beams[i].position.x, contraption.beams[i].position.y]] != nil
                && energizedTiles[[contraption.beams[i].position.x, contraption.beams[i].position.y]]!.contains(contraption.beams[i].direction)) {
                contraption.beams.remove(at: i)
            } else {
                if energizedTiles[[contraption.beams[i].position.x, contraption.beams[i].position.y]] != nil {
                    energizedTiles[[contraption.beams[i].position.x, contraption.beams[i].position.y]]!.append(contraption.beams[i].direction)
                } else {
                    energizedTiles[[contraption.beams[i].position.x, contraption.beams[i].position.y]] = [contraption.beams[i].direction]
                }
                i += 1
            }
            
            if let newBeam = moveBeam {
                contraption.beams.append(newBeam)
                if energizedTiles[[newBeam.position.x, newBeam.position.y]] != nil {
                    energizedTiles[[newBeam.position.x, newBeam.position.y]]!.append(newBeam.direction)
                } else {
                    energizedTiles[[newBeam.position.x, newBeam.position.y]] = [newBeam.direction]
                }
            }
        }
    }

    return energizedTiles.count
}
