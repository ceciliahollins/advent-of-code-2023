import Foundation

struct HASHMAP {
    let label: String
    let box: Int
    let operation: Operation
    let focalLength: Int?
}

enum Operation: String {
    case insert = "="
    case remove = "-"
}

