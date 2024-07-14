import Foundation

public func clumsyCrucible(_ input: String) -> Int {
    
    let map = input.inputToInt2DArray()
    
    var priorityQueue = PriorityQueue<(move: Move, cost: Int)>(sort: { lhs, rhs in
        return lhs.cost < rhs.cost
    })
    
    priorityQueue.enqueue(element: (Move(0, 0, .right, 0), 0))
    var routeTracker: [Move: Int] = [:]
    
    while !priorityQueue.isEmpty {
        guard let currItem = priorityQueue.dequeue() else { continue }
        let currMove = currItem.move
        let currCost = currItem.cost
        let x = currMove.x
        let y = currMove.y
        let direction = currMove.direction
        let straights = currMove.straights
        let xLength = map[0].count - 1
        let yLength = map.count - 1
        
        if let moveCost = routeTracker[currMove],
              currCost >= moveCost {
            continue
        }
        
        routeTracker[currMove] = currCost
        if x == xLength && y == yLength {
            return currCost
        }
                
        switch direction {
        case .left:
            if y > 0, currCost + map[y-1][x] < routeTracker[Move(x, y-1, .up, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y-1, .up, 1), currCost + map[y-1][x]))
            }
            if y < yLength, currCost + map[y+1][x] < routeTracker[Move(x, y+1, .down, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y+1, .down, 1), currCost + map[y+1][x]))
            }
            if straights < 3, x > 0, currCost + map[y][x-1] < routeTracker[Move(x-1, y, .left, straights + 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x-1, y, .left, straights + 1), currCost + map[y][x-1]))
            }
        case .right:
            if y > 0, currCost + map[y-1][x] < routeTracker[Move(x, y-1, .up, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y-1, .up, 1), currCost + map[y-1][x]))
            }
            if y < yLength, currCost + map[y+1][x] < routeTracker[Move(x, y+1, .down, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y+1, .down, 1), currCost + map[y+1][x]))
            }
            if straights < 3, x < xLength, currCost + map[y][x+1] < routeTracker[Move(x+1, y, .right, straights + 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x+1, y, .right, straights + 1), currCost + map[y][x+1]))
            }
        case .up:
            if x > 0, currCost + map[y][x-1] < routeTracker[Move(x-1, y, .left, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x-1, y, .left, 1), currCost + map[y][x-1]))
            }
            if x < xLength, currCost + map[y][x+1] < routeTracker[Move(x+1, y, .right, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x+1, y, .right, 1), currCost + map[y][x+1]))
            }
            if straights < 3 && y > 0, currCost + map[y-1][x] < routeTracker[Move(x, y-1, .up, straights + 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y-1, .up, straights + 1), currCost + map[y-1][x]))
            }
        case .down:
            if x > 0, currCost + map[y][x-1] < routeTracker[Move(x-1, y, .left, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x-1, y, .left, 1), currCost + map[y][x-1]))
            }
            if x < xLength, currCost + map[y][x+1] < routeTracker[Move(x+1, y, .right, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x+1, y, .right, 1), currCost + map[y][x+1]))
            }
            if straights < 3 && y < yLength, currCost + map[y+1][x] < routeTracker[Move(x, y+1, .down, straights + 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y+1, .down, straights + 1), currCost + map[y+1][x]))
            }
        }
    }
    
    return 0
}

public func clumsyCruciblePartTwo(_ input: String) -> Int {
    
    let map = input.inputToInt2DArray()
    
    var priorityQueue = PriorityQueue<(move: Move, cost: Int)>(sort: { lhs, rhs in
        return lhs.cost < rhs.cost
    })
    
    priorityQueue.enqueue(element: (Move(0, 0, .right, 0), 0))
    var routeTracker: [Move: Int] = [:]
    
    while !priorityQueue.isEmpty {
        guard let currItem = priorityQueue.dequeue() else { continue }
        let currMove = currItem.move
        let currCost = currItem.cost
        let x = currMove.x
        let y = currMove.y
        let direction = currMove.direction
        let straights = currMove.straights
        let xLength = map[0].count - 1
        let yLength = map.count - 1
        
        if let moveCost = routeTracker[currMove],
              currCost >= moveCost {
            continue
        }
        
        routeTracker[currMove] = currCost
        if x == xLength,
            y == yLength, 
            straights >= 4 {
            return currCost
        }
                
        switch direction {
        case .left:
            if straights >= 4 && y > 0, currCost + map[y-1][x] < routeTracker[Move(x, y-1, .up, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y-1, .up, 1), currCost + map[y-1][x]))
            }
            if straights >= 4 && y < yLength, currCost + map[y+1][x] < routeTracker[Move(x, y+1, .down, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y+1, .down, 1), currCost + map[y+1][x]))
            }
            if straights < 10, x > 0, currCost + map[y][x-1] < routeTracker[Move(x-1, y, .left, straights + 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x-1, y, .left, straights + 1), currCost + map[y][x-1]))
            }
        case .right:
            if straights >= 4 && y > 0, currCost + map[y-1][x] < routeTracker[Move(x, y-1, .up, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y-1, .up, 1), currCost + map[y-1][x]))
            }
            if straights >= 4 && y < yLength, currCost + map[y+1][x] < routeTracker[Move(x, y+1, .down, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y+1, .down, 1), currCost + map[y+1][x]))
            }
            if straights < 10, x < xLength, currCost + map[y][x+1] < routeTracker[Move(x+1, y, .right, straights + 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x+1, y, .right, straights + 1), currCost + map[y][x+1]))
            }
        case .up:
            if straights >= 4 && x > 0, currCost + map[y][x-1] < routeTracker[Move(x-1, y, .left, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x-1, y, .left, 1), currCost + map[y][x-1]))
            }
            if straights >= 4 && x < xLength, currCost + map[y][x+1] < routeTracker[Move(x+1, y, .right, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x+1, y, .right, 1), currCost + map[y][x+1]))
            }
            if straights < 10 && y > 0, currCost + map[y-1][x] < routeTracker[Move(x, y-1, .up, straights + 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y-1, .up, straights + 1), currCost + map[y-1][x]))
            }
        case .down:
            if straights >= 4 && x > 0, currCost + map[y][x-1] < routeTracker[Move(x-1, y, .left, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x-1, y, .left, 1), currCost + map[y][x-1]))
            }
            if straights >= 4 && x < xLength, currCost + map[y][x+1] < routeTracker[Move(x+1, y, .right, 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x+1, y, .right, 1), currCost + map[y][x+1]))
            }
            if straights < 10 && y < yLength, currCost + map[y+1][x] < routeTracker[Move(x, y+1, .down, straights + 1)] ?? Int.max {
                priorityQueue.enqueue(element: (Move(x, y+1, .down, straights + 1), currCost + map[y+1][x]))
            }
        }
    }
    
    return 0
}
