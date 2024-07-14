import Foundation

extension String {
    
    func inputToCubeGames() -> [CubeGame] {
        var str = self
        
        var result: [CubeGame] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
                    
            var line = String(str[str.startIndex..<indexOfLine])
            
            line.removeSubrange(line.startIndex...line.firstIndex(of: " ")!)
            let id = String(line[line.startIndex..<line.index(line.firstIndex(of: " ")!, offsetBy: -1)])
            line.removeSubrange(line.startIndex...line.firstIndex(of: " ")!)
            
            var cubeDraws: [CubeDraw] = []
            while !line.isEmpty {
                var color = ""
                var number = 0
                if let indexOfSpace = line.firstIndex(of: " ") {
                    number = Int(line[line.startIndex..<indexOfSpace]) ?? 0
                    line.removeSubrange(line.startIndex...indexOfSpace)
                }
                
                if let indexOfSpace = line.firstIndex(of: " ") {
                    color = String(line[line.startIndex..<line.index(indexOfSpace, offsetBy: -1)])
                    line.removeSubrange(line.startIndex...indexOfSpace)
                } else {
                    color = String(line[line.startIndex..<line.endIndex])
                    line = ""
                }
                
                cubeDraws.append(CubeDraw(cubeColor: Cube(rawValue: color)!,
                                          numOfCubes: number))
            }
            
            result.append(CubeGame(id: Int(id) ?? 0,
                                   draws: cubeDraws))
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
}

