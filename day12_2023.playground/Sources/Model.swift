import Foundation

struct ConditionalRecord: Hashable {
    var springs: [SpringStatus] = []
    var list: [Int] = []
}
        
enum SpringStatus: String, Hashable {
    case operational = "."
    case damaged = "#"
    case unknown = "?"
}

