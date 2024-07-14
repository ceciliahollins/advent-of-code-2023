extension String {
    
//    func inputToBricks() -> [Brick] {
//        
//        var str = self
//        var result: [Brick] = []
//        
//        while !str.isEmpty {
//            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
//            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
//            
//            let line = String(str[str.startIndex..<indexOfLine])
//            
//            var nums: [Int] = []
//            var currNum = ""
//            for char in line {
//                if char.isNumber {
//                    currNum.append(char)
//                } else {
//                    nums.append(Int(currNum) ?? 0)
//                    currNum = ""
//                }
//            }
//            nums.append(Int(currNum) ?? 0)
//            
//            result.append(Brick(start: Position(nums[0], nums[1], nums[2]),
//                                end: Position(nums[3], nums[4], nums[5])))
//
//            str.removeSubrange(str.startIndex...subrangeToDelete)
//        }
//        
//        return result
//    }
    
    func inputToStack() -> Stack {
        
        var str = self
        
        var bricks: [Brick] = []
        var maxX = 0
        var maxY = 0
        var maxZ = 0
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            let line = String(str[str.startIndex..<indexOfLine])
            
            var nums: [Int] = []
            var currNum = ""
            for char in line {
                if char.isNumber {
                    currNum.append(char)
                } else {
                    nums.append(Int(currNum) ?? 0)
                    currNum = ""
                }
            }
            nums.append(Int(currNum) ?? 0)
            
            let x = (nums[0], nums[3])
            let y = (nums[1], nums[4])
            let z = (nums[2], nums[5])
            let direction: Direction
            if x.0 != x.1 { direction = .x }
            else if y.0 != y.1 { direction = .y }
            else { direction = .z}
            let brick = Brick(start: Position(x.0, y.0, z.0),
                              end: Position(x.1, y.1, z.1),
                              direction: direction)
            
            bricks.append(brick)
            maxX = max(max(brick.start.x, brick.end.x), maxX)
            maxY = max(max(brick.start.y, brick.end.y), maxY)
            maxZ = max(max(brick.start.z, brick.end.z), maxZ)

            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
                
        let stackX = Array(repeating: 0, count: maxX + 1)
        let stackY = Array(repeating: stackX, count: maxY + 1)
        let stackZ = Array(repeating: stackY, count: maxZ + 1)
        var stack = stackZ
        
        var id = 1
        for b in bricks {
            switch b.direction {
            case .x:
                var currX = b.start.x
                while currX <= b.end.x {
                    stack[b.start.z][b.start.y][currX] = id
                    currX += 1
                }
            case .y:
                var currY = b.start.y
                while currY <= b.end.y {
                    stack[b.start.z][currY][b.start.x] = id
                    currY += 1
                }
            case .z:
                var currZ = b.start.z
                while currZ <= b.end.z {
                    stack[currZ][b.start.y][b.start.x] = id
                    currZ += 1
                }
            }
            id += 1
        }
        
        return Stack(bricks: bricks, stack: stack)
    }
}
