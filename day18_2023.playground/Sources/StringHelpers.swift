import SwiftUI

extension String {
    
    func inputToDigPlan() -> [DigStep] {
        
        var str = self
        var result: [DigStep] = []
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            var line = String(str[str.startIndex..<indexOfLine])
            
            var indexOfSpace = line.firstIndex(of: " ")!
            var lineSubrangeToDelete = line.firstIndex(of: " ")!
            let direction = String(line[line.startIndex..<indexOfSpace])
            line.removeSubrange(line.startIndex...lineSubrangeToDelete)
            
            indexOfSpace = line.firstIndex(of: " ")!
            lineSubrangeToDelete = line.firstIndex(of: " ")!
            let meters = String(line[line.startIndex..<indexOfSpace])
            line.removeSubrange(line.startIndex...lineSubrangeToDelete)
            
            indexOfSpace = line.index(line.endIndex, offsetBy: -1)
            lineSubrangeToDelete = line.index(line.endIndex, offsetBy: -1)
            let color = String(line[line.index(line.startIndex, offsetBy: 1)..<indexOfSpace])
            line.removeSubrange(line.startIndex...lineSubrangeToDelete)
            
            let digStep = DigStep(direction: Direction(rawValue: direction) ?? .up,
                                  meters: Int(meters) ?? 0,
                                  color: color)
            result.append(digStep)
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
}
