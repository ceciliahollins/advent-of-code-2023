import Foundation


public func pointofIncidence(_ input: String) -> Int {
    
    let mirrorValleys = input.inputToMirrorValley()
    
    var result = 0
    
    for valley in mirrorValleys.valleys {
        
        let pattern = valley.pattern
        let horizontalLength = pattern.first?.count ?? 0
        let verticalLength = pattern.count
        
        var isReflective = false
                
        // check for vertical reflection line
        var currLine = 0
        while currLine < horizontalLength - 1 {
            // reset isReflective for the next line
            isReflective = true
            
            var currLeftX = currLine
            var currRightX = currLine + 1
            
            while currLeftX >= 0 && currRightX < horizontalLength {
                var currY = 0
                while currY < verticalLength {
                    if pattern[currY][currLeftX] != pattern[currY][currRightX] {
                        isReflective = false
                        break
                    }
                    currY += 1
                }
                
                // this line is not reflective, break the current loop and try the next line
                if !isReflective {
                    break
                }
                
                currLeftX -= 1
                currRightX += 1
            }
            
            // the line made it entirely though checks and is reflective! add it to the result
            if isReflective {
                result += currLine + 1
                break
            }
            
            currLine += 1
        }
        
        // the line has already been found vertically, no need to check horizontal and can move on to the next valley
        if isReflective {
            continue
        }
                
        // check for horizontal reflection line
        currLine = 0
        while currLine < verticalLength - 1 {
            // reset isReflective for the next line
            isReflective = true
            
            var currTopY = currLine
            var currBottomY = currLine + 1
            
            while currTopY >= 0 && currBottomY < verticalLength {
                var currX = 0
                while currX < horizontalLength {
                    if pattern[currTopY][currX] != pattern[currBottomY][currX] {
                        isReflective = false
                        break
                    }
                    currX += 1
                }
                
                // this line is not reflective, break the current loop and try the next line
                if !isReflective {
                    break
                }
                
                currTopY -= 1
                currBottomY += 1
            }
            
            // the line made it entirely though checks and is reflective! add it to the result
            if isReflective {
                result += (currLine + 1) * 100
                break
            }
            
            currLine += 1
        }
    }
    
    return result
}

public func pointofIncidencePartTwo(_ input: String) -> Int {

    let mirrorValleys = input.inputToMirrorValley()
    
    var result = 0
    
    for valley in mirrorValleys.valleys {
        
        let pattern = valley.pattern
        let horizontalLength = pattern.first?.count ?? 0
        let verticalLength = pattern.count
        
        var smudgedLineFound = false
                
        // check for vertical reflection line
        var currLine = 0
        while currLine < horizontalLength - 1 {
            
            var currLeftX = currLine
            var currRightX = currLine + 1
            
            var numOfDifferences = 0
            while currLeftX >= 0 && currRightX < horizontalLength {
                var currY = 0
                while currY < verticalLength {
                    if pattern[currY][currLeftX] != pattern[currY][currRightX] {
                        numOfDifferences += 1
                    }
                    currY += 1
                }
                
                currLeftX -= 1
                currRightX += 1
            }
            
            // the smudged line has been found!
            if numOfDifferences == 1 {
                smudgedLineFound = true
                result += currLine + 1
                break
            }
            
            currLine += 1
        }
        
        // the smudged line has already been found vertically, no need to check horizontal and can move on to the next valley
        if smudgedLineFound {
            continue
        }
                
        // check for horizontal reflection line
        currLine = 0
        while currLine < verticalLength - 1 {
            
            var currTopY = currLine
            var currBottomY = currLine + 1
            
            var numOfDifferences = 0
            while currTopY >= 0 && currBottomY < verticalLength {
                var currX = 0
                while currX < horizontalLength {
                    if pattern[currTopY][currX] != pattern[currBottomY][currX] {
                        numOfDifferences += 1
                    }
                    currX += 1
                }
                
                currTopY -= 1
                currBottomY += 1
            }
            
            // the smudged line has been found!
            if numOfDifferences == 1 {
                result += (currLine + 1) * 100
                break
            }
            
            currLine += 1
        }
    }
    
    return result
}
