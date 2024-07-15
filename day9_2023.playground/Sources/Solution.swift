import Foundation


public func mirageMaintenance(_ input: String) -> Int {
    
    let report = input.inputToOasisReport()
    var oasisResult = 0
                
    for surrounding in report.surroundings {
        oasisResult += reportPrediciton(surrounding.history)
    }
    
    return oasisResult
}

func reportPrediciton(_ dataset: [Int]) -> Int {
    
    guard !dataset.allSatisfy({ $0 == 0 }) else { return 0 }
    
    var differences: [Int] = []
    var i = 1
    while i < dataset.count {
        let difference = dataset[i] - dataset[i-1]
        differences.append(difference)
        
        i += 1
    }
        
    return (dataset.last ?? 0) + reportPrediciton(differences)
}

public func mirageMaintenancePartTwo(_ input: String) -> Int {
    
    let report = input.inputToOasisReport()
    var oasisResult = 0
                
    for surrounding in report.surroundings {
        oasisResult += reportPredicitonPartTwo(surrounding.history)
    }
    
    return oasisResult
}

func reportPredicitonPartTwo(_ dataset: [Int]) -> Int {
    
    guard !dataset.allSatisfy({ $0 == 0 }) else {
        return 0
    }
    
    var differences: [Int] = []
    var i = 1
    while i < dataset.count {
        let difference = dataset[i] - dataset[i-1]
        differences.append(difference)
        
        i += 1
    }
        
    return (dataset.first ?? 0) - reportPredicitonPartTwo(differences)
}
