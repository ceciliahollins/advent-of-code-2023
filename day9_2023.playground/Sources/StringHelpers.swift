extension String {
    
    func inputToOasisReport() -> OasisReport {
        
        var str = self
        var report: OasisReport = OasisReport()
        
        while !str.isEmpty {
            let indexOfLine = str.firstIndex(of: "\n") ?? str.endIndex
            let subrangeToDelete = str.firstIndex(of: "\n") ?? str.index(str.endIndex, offsetBy: -1)
            
            var line = String(str[str.startIndex..<indexOfLine])
            
            var history: [Int] = []
            while !line.isEmpty {
                let indexOfSpace = line.firstIndex(of: " ") ?? line.endIndex
                let lineSubrangeToDelete = line.firstIndex(of: " ") ?? line.index(line.endIndex, offsetBy: -1)
                
                let num = Int(line[line.startIndex..<indexOfSpace]) ?? 0
                history.append(num)
                
                line.removeSubrange(line.startIndex...lineSubrangeToDelete)
            }
            
            report.surroundings.append(ReportHistory(history: history))
            str.removeSubrange(str.startIndex...subrangeToDelete)
        }
        
        return report
    }
}
