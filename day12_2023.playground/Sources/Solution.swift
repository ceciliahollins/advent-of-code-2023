import Foundation


public func hotSprings(_ input: String) -> Int {
    
    let records = input.inputToConditionalRecords()
    
    var arrangementCount = 0
    for record in records {
        arrangementCount += countUnknownSpringArrangements(record)
    }
    
    return arrangementCount
}

public func hotSpringsPartTwo(_ input: String) -> Int {
    let records = input.inputToConditionalRecords()
    var unfoldedRecords: [ConditionalRecord] = []
    
    for record in records {
        var unfoldedSprings = Array(repeating: record.springs + [.unknown], count: 5).flatMap { $0 }
        unfoldedSprings.removeLast() // remove the last unknown spring, it is not seperating anything
        
        let unfoldedList = Array(repeating: record.list, count: 5).flatMap { $0 }
        
        unfoldedRecords.append(ConditionalRecord(springs: unfoldedSprings,
                                                 list: unfoldedList))
    }
    
    
    var arrangementCount = 0
    for unfoldedRecord in unfoldedRecords {
        arrangementCount += countUnknownSpringArrangements(unfoldedRecord)
    }
    
    return arrangementCount
}

var memo: [ConditionalRecord: Int] = [:]
func countUnknownSpringArrangements(_ record: ConditionalRecord) -> Int {
    let springs = record.springs
    let list = record.list
    
    // memo hit
    if let memoResult = memo[record] {
        return memoResult
    }
        
    // base case: not enough list items
    guard let currListItem = list.first else {
        return springs.allSatisfy({ $0 != .damaged }) ? 1 : 0
    }
    
    // base case: not enough springs
    guard list.reduce(0, +) + list.count - 1 <= springs.count else {
        return 0
    }
        
    var numberOfArrangements = 0
    for i in 0...springs.count-currListItem {
        
        let currEndIndex = i+currListItem
        let subSprings = Array(springs[i..<currEndIndex])
        
        if subSprings.allSatisfy({ $0 != .operational })
            && Array(springs[0..<i]).allSatisfy({ $0 != .damaged }) {
            // if the current end index is at the end of the springs list, send empty springs
            if currEndIndex == springs.count {
                numberOfArrangements += countUnknownSpringArrangements(ConditionalRecord(springs: [],
                                                                                         list: Array(list[1...])))
                break
            } else if (i > 0 && springs[i-1] != .damaged && springs[currEndIndex] != .damaged)
                        || (i == 0 && springs[currEndIndex] != .damaged) {
                numberOfArrangements += countUnknownSpringArrangements(ConditionalRecord(springs: Array(springs[(currEndIndex+1)...]),
                                                                                         list: Array(list[1...])))
            }
        }
    }
    
    memo[record] = numberOfArrangements
    return numberOfArrangements
}
