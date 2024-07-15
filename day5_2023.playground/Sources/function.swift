import Foundation


public func ifYouGiveASeedAFertilizer(_ input: String) -> Int {
    
    let almanac: Almanac = input.stringToAlmanac()
    var destinations: [Int] = almanac.seeds
    
    for map in almanac.maps {
        
        for (i, seed) in destinations.enumerated() {
            for range in map {
                if seed >= range.sourceCategory && seed <= range.sourceCategory + range.range {
                    let distance = seed - range.sourceCategory
                    let destination = range.destinationCategory + distance
                    
                    destinations[i] = destination
                    break
                }
            }
        }
    }
    
    return destinations.min() ?? -1
}

public func ifYouGiveASeedAFertilizerPartTwo(_ input: String) -> Int {
    
    let almanac: AlmanacRanges = input.stringToAlmanacRange()
    var destinations: [(Int, Int)] = almanac.seeds
    
    var countInitial = 0
    for destination in destinations {
        countInitial += destination.1
    }
    
    for map in almanac.maps {
        var i = 0
        while i < destinations.count {
            let seed = destinations [i]
            
            for range in map {
                // seed is on the right of the source category and in range
                if seed.0 >= range.sourceCategory && seed.0 <= range.sourceCategory + range.range - 1 {
                    let distance = seed.0 - range.sourceCategory
                    let destination = range.destinationCategory + distance
                    
                    // right side spillover
                    if seed.0 + seed.1 - 1 > range.sourceCategory + range.range - 1 {
                        destinations.append((range.sourceCategory + range.range, ((seed.0 + seed.1 - 1) - (range.sourceCategory + range.range - 1))))
                        destinations[i].1 = ((range.sourceCategory + range.range) - seed.0)
                    }
                    
                    destinations[i].0 = destination
                    break
                    
                // seed is on the left of the source category and in range
                } else if range.sourceCategory >= seed.0 && range.sourceCategory <= seed.0 + seed.1 - 1 {
                    
                    // left side spillover
                    if seed.0 < range.sourceCategory {
                        // right and left side spillover
                        if seed.0 + seed.1 - 1 > range.sourceCategory + range.range - 1 {
                            // right side
                            destinations.append((range.sourceCategory + range.range, ((seed.0 + seed.1) - (range.sourceCategory + range.range))))
                            // left side
                            destinations.append((seed.0, range.sourceCategory - seed.0))
                            destinations[i].1 = (range.range)
                        // left side spillover only
                        } else {
                            destinations.append((seed.0, range.sourceCategory - seed.0))
                            destinations[i].1 = (seed.0 + seed.1) - range.sourceCategory
                        }
                    }
                    
                    destinations[i].0 = range.destinationCategory
                    
                    break
                }
            }
            i += 1
        }
    }
    
    var countFinal = 0
    for destination in destinations {
        countFinal += destination.1
    }
    
    return destinations.min(by: { $0.0 <= $1.0 })?.0 ?? -1
}
