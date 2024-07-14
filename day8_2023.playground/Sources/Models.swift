import Foundation

struct Map {
    var directions: [Move]
    var network: [String: (String, String)]
}

enum Move: String {
    case left = "L"
    case right = "R"
}

