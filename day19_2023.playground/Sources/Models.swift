import Foundation

struct Workflow {
    var steps: [String: [OperationStep]] = [:]
    var parts: [Part] = []
    
    func findRangePossibilities(operationSteps: [OperationStep],
                                _ xRange: ClosedRange<Int>,
                                _ mRange: ClosedRange<Int>,
                                _ aRange: ClosedRange<Int>,
                                _ sRange: ClosedRange<Int>) -> [(x: ClosedRange<Int>, 
                                                                 m: ClosedRange<Int>,
                                                                 a: ClosedRange<Int>,
                                                                 s: ClosedRange<Int>)] {
        
        var xRange = xRange
        var mRange = mRange
        var aRange = aRange
        var sRange = sRange
        
        var possibilities: [(x: ClosedRange<Int>, m: ClosedRange<Int>, a: ClosedRange<Int>, s: ClosedRange<Int>)] = []
        for step in operationSteps {
            
            var xRangeNextCall = xRange
            var mRangeNextCall = mRange
            var aRangeNextCall = aRange
            var sRangeNextCall = sRange
            
            // create one set that will be true, one set that will be false
            if let operation = step.operation {
                
                if let lessThan = operation.firstIndex(of: "<") {
                    let lhs = String(operation[operation.startIndex..<lessThan])
                    let rhs = Int(String(operation[operation.index(lessThan, offsetBy: 1)..<operation.endIndex])) ?? 0
                    
                    if lhs == "x" {
                        xRangeNextCall = xRange.lowerBound...rhs-1
                        xRange = rhs...xRange.upperBound
                    } else if lhs == "m" {
                        mRangeNextCall = mRange.lowerBound...rhs-1
                        mRange = rhs...mRange.upperBound
                    } else if lhs == "a" {
                        aRangeNextCall = aRange.lowerBound...rhs-1
                        aRange = rhs...aRange.upperBound
                    } else if lhs == "s" {
                        sRangeNextCall = sRange.lowerBound...rhs-1
                        sRange = rhs...sRange.upperBound
                    }
                } else {
                    let greaterThan = operation.firstIndex(of: ">")!
                    let lhs = String(operation[operation.startIndex..<greaterThan])
                    let rhs = Int(String(operation[operation.index(greaterThan, offsetBy: 1)..<operation.endIndex])) ?? 0
                    
                    if lhs == "x" {
                        xRangeNextCall = rhs+1...xRange.upperBound
                        xRange = xRange.lowerBound...rhs
                    } else if lhs == "m" {
                        mRangeNextCall = rhs+1...mRange.upperBound
                        mRange = mRange.lowerBound...rhs
                    } else if lhs == "a" {
                        aRangeNextCall = rhs+1...aRange.upperBound
                        aRange = aRange.lowerBound...rhs
                    } else if lhs == "s" {
                        sRangeNextCall = rhs+1...sRange.upperBound
                        sRange = sRange.lowerBound...rhs
                    }
                }
            }
            
            if step.nextStep == "A" {
                possibilities.append((x: xRangeNextCall,
                                      m: mRangeNextCall,
                                      a: aRangeNextCall,
                                      s: sRangeNextCall))
            } else if step.nextStep != "R" {
                let nextCall = findRangePossibilities(operationSteps: steps[step.nextStep]!,
                                                      xRangeNextCall,
                                                      mRangeNextCall,
                                                      aRangeNextCall,
                                                      sRangeNextCall)
                possibilities.append(contentsOf: nextCall)
            }
        }
        
        return possibilities
    }
    
    func printAll() {
        print("workflows")
        for step in steps {
            print(step.key)
            for operation in step.value {
                print(operation.operation, operation.nextStep)
            }
            print("------")
        }
        
        print("parts")
        for part in parts {
            print(part.x, part.m, part.a, part.s)
        }
    }
}

struct OperationStep {
    var operation: String?
    var nextStep: String
    
    func evaluateOperation(_ part: Part) -> Bool {
        guard let operation = operation else { return false }

        if let lessThan = operation.firstIndex(of: "<") {
            let lhs = String(operation[operation.startIndex..<lessThan])
            let rhs = Int(String(operation[operation.index(lessThan, offsetBy: 1)..<operation.endIndex])) ?? 0
            if lhs == "x" {
                return part.x < rhs
            } else if lhs == "m" {
                return part.m < rhs
            } else if lhs == "a" {
                return part.a < rhs
            } else {
                return part.s < rhs
            }
        } else {
            let greaterThan = operation.firstIndex(of: ">")!
            let lhs = String(operation[operation.startIndex..<greaterThan])
            let rhs = Int(String(operation[operation.index(greaterThan, offsetBy: 1)..<operation.endIndex])) ?? 0
            if lhs == "x" {
                return part.x > rhs
            } else if lhs == "m" {
                return part.m > rhs
            } else if lhs == "a" {
                return part.a > rhs
            } else {
                return part.s > rhs
            }
        }
    }
}

struct Part {
    var x: Int
    var m: Int
    var a: Int
    var s: Int
}
