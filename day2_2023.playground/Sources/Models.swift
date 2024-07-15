import Foundation

struct CubeGame {
    var id: Int
    var draws: [CubeDraw]
}

struct CubeDraw {
    var cubeColor: Cube
    var numOfCubes: Int
}

enum Cube: String {
    case red
    case green
    case blue
}

