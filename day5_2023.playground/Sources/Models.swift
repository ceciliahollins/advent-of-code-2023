import Foundation

struct Almanac {
    var seeds: [Int] = []
    var maps: [[Map]] = []
}

struct AlmanacRanges {
    var seeds: [(Int, Int)] = []
    var maps: [[Map]] = []
}

struct Map {
    var destinationCategory: Int
    var sourceCategory: Int
    var range: Int
}
