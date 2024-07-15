import Foundation

public func aplenty(_ input: String) -> Int {
    
    let workflow = input.inputToWorkflow()
    
    var result = 0
    
    for part in workflow.parts {
        var currStep = workflow.steps["in"]!
        var i = 0
        while i < currStep.count {

            if let _ = currStep[i].operation {
                
                if currStep[i].evaluateOperation(part) {
                    let nextStep = currStep[i].nextStep
                    if nextStep == "A" {
                        result += part.x + part.m + part.a + part.s
                        break
                    } else if nextStep == "R" {
                        break
                    } else {
                        currStep = workflow.steps[nextStep]!
                        i = 0
                    }
                } else {
                    // otherwise continue
                    i += 1
                }
            } else {
                // the end of the list is found
                let nextStep = currStep[i].nextStep
                if nextStep == "A" {
                    result += part.x + part.m + part.a + part.s
                    break
                } else if nextStep == "R" {
                    break
                } else {
                    currStep = workflow.steps[nextStep]!
                    i = 0
                }
            }
        }
    }
    
    return result
}

public func aplentyLagoonPartTwo(_ input: String) -> Int {
    
    let workflow = input.inputToWorkflow()
    
    let possibilities =  workflow.findRangePossibilities(operationSteps: workflow.steps["in"]!,
                                                         1...4000,
                                                         1...4000,
                                                         1...4000,
                                                         1...4000)
    
    var result = 0
    
    for possibility in possibilities {
        result += possibility.x.count * possibility.m.count * possibility.a.count * possibility.s.count
    }
    return result
}
