import Foundation

struct Stack {
    var bricks: [Brick]
    // stack[z][y][x]
    var stack: [[[Int]]]
    
    func printStack() {
        for z in stack {
            for y in z {
                print(y)
            }
            print("--------")
        }
    }
}

struct Brick {
    var start: Position
    var end: Position
    var direction: Direction
    
    func printBrick() {
        print("\(start.x) \(start.y) \(start.z) ~ \(end.x) \(end.y) \(end.z)")
    }
}

enum Direction {
    case x
    case y
    case z
}

struct Position {
    var x: Int
    var y: Int
    var z: Int
    
    init(_ x: Int, _ y: Int, _ z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
}

