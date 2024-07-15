import Foundation

struct MirrorValley {
    var valleys: [ValleyPattern] = []
}

struct ValleyPattern {
    var pattern: [[Terrain]] = []
}

enum Terrain: String {
    case ash = "."
    case rock = "#"
}

