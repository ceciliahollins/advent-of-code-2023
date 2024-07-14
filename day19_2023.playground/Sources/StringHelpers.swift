import SwiftUI

//px{a<2006:qkq,m>2090:A,rfg}
//pv{a>1716:R,A}
//lnx{m>1548:A,A}
//rfg{s<537:gd,x>2440:R,A}
//qs{s>3448:A,lnx}
//qkq{x<1416:A,crn}
//crn{x>2662:A,R}
//in{s<1351:px,qqz}
//qqz{s>2770:qs,m<1801:hdj,R}
//gd{a>3333:R,R}
//hdj{m>838:A,pv}
//
//{x=787,m=2655,a=1222,s=2876}
//{x=1679,m=44,a=2067,s=496}
//{x=2036,m=264,a=79,s=2244}
//{x=2461,m=1339,a=466,s=291}
//{x=2127,m=1623,a=2188,s=1013}
extension String {
    
    func inputToWorkflow() -> Workflow {
        
        var str = self
        var result = Workflow()
        
        var isProcessingWorkflows = true
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            var line = String(str[str.startIndex..<indexOfLine])
            if line.isEmpty {
                isProcessingWorkflows = false
                str.removeSubrange(str.startIndex...str.firstIndex(of: "\n")!)
                continue
            }
            
            if isProcessingWorkflows {
                let name = String(line[line.startIndex..<line.firstIndex(of: "{")!])
                line.removeSubrange(line.startIndex...line.firstIndex(of: "{")!)
                var steps: [OperationStep] = []
                while !line.isEmpty {
                    var step = String(line[line.startIndex..<(line.firstIndex(of: ",") ?? line.endIndex)])
                    if let operationIndex = step.firstIndex(of: ":") {
                        let operation = String(step[step.startIndex..<operationIndex])
                        step.removeSubrange(step.startIndex...operationIndex)
                        let nextStep = step
                        steps.append(OperationStep(operation: operation, nextStep: nextStep))
                        line.removeSubrange(line.startIndex...line.firstIndex(of: ",")!)
                    } else {
                        line.removeLast()
                        steps.append(OperationStep(nextStep: line))
                        line = ""
                    }
                }
                result.steps[name] = steps
            } else {
                line.removeAll(where: { !$0.isNumber && $0 != "," })
                let x = Int(String(line[line.startIndex..<line.firstIndex(of: ",")!])) ?? 0
                line.removeSubrange(line.startIndex...line.firstIndex(of: ",")!)
                let m = Int(String(line[line.startIndex..<line.firstIndex(of: ",")!])) ?? 0
                line.removeSubrange(line.startIndex...line.firstIndex(of: ",")!)
                let a = Int(String(line[line.startIndex..<line.firstIndex(of: ",")!])) ?? 0
                line.removeSubrange(line.startIndex...line.firstIndex(of: ",")!)
                let s = Int(line) ?? 0
                result.parts.append(Part(x: x, m: m, a: a, s: s))
            }
            
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return result
    }
}
