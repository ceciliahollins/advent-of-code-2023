import Foundation


public func lensLibrary(_ input: String) -> Int {
    
    let sequence = input.inputToStringArray()
    
    var result = 0
    
    for str in sequence {
        result += str.stringToLensManualHash()
    }
    
    return result
}

public func lensLibraryPartTwo(_ input: String) -> Int {
    
    let sequence = input.inputToStringArray()
    
    var result = 0
    
    var boxes: [[(String, Int)]] = Array(repeating: [], count: 256)
    
    for str in sequence {
        let hashmapStep = str.stringToHASHMAP()
        
        switch hashmapStep.operation {
        case .insert:
            if let index = boxes[hashmapStep.box].firstIndex(where: { $0.0 == hashmapStep.label }) {
                boxes[hashmapStep.box][index] = (hashmapStep.label, hashmapStep.focalLength!)
            } else {
                boxes[hashmapStep.box].append((hashmapStep.label, hashmapStep.focalLength!))
            }
        case .remove:
            boxes[hashmapStep.box].removeAll { $0.0 == hashmapStep.label }
        }
    }
    
    for (boxIndex, box) in boxes.enumerated() {
        for (slotIndex, slot) in box.enumerated() {
            result += (boxIndex + 1) * (slotIndex + 1) * slot.1
        }
    }
    
    return result
}
