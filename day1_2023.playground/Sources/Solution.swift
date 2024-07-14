import Foundation


public func trebuchet(_ input: String) -> Int {
    
    let calibrations: [String] = input.inputToStringArray()
    var total = 0
    
    for calibration in calibrations {
        let firstNum = String(calibration[calibration.firstIndex(where: { $0.isNumber })!])
        let lastNum = String(calibration[calibration.lastIndex(where: { $0.isNumber })!])
        
        total += Int(firstNum + lastNum) ?? 0
    }
    
    return total
}

public func trebuchetPartTwo(_ input: String) -> Int {
    
    let calibrations: [String] = input.inputToStringArray()
    var total = 0
    
    for calibration in calibrations {
        let digitCalibration = calibration.wordsToInts()
        
        let firstNum = String(digitCalibration[digitCalibration.firstIndex(where: { $0.isNumber })!])
        let lastNum = String(digitCalibration[digitCalibration.lastIndex(where: { $0.isNumber })!])
        
        total += Int(firstNum + lastNum) ?? 0
    }
    
    return total
}
