import Foundation


public func gearRatios(_ input: String) -> Int {
    
    var arr = input.inputTo2dIntArray()
    var result = 0
    
    for (i, row) in arr.enumerated() {
        for (j, item) in row.enumerated() {
            if item == -1 {

                var possibilities = [(i-1, j-1), (i-1, j), (i-1, j+1), (i, j-1), (i, j+1), (i+1, j-1), (i+1, j), (i+1, j+1)]
                possibilities.removeAll(where: { $0.0 < 0 || $0.0 > arr.count - 1
                                                    || $0.1 < 0 || $0.1 > arr[i].count - 1 })

                for pos in possibilities {
                    if arr[pos.0][pos.1] >= 0 {

                        var num = "\(arr[pos.0][pos.1])"
                        arr[pos.0][pos.1] = -2

                        var currIndex = pos.1 - 1
                        while currIndex >= 0 && arr[pos.0][currIndex] >= 0 {
                            num = "\(arr[pos.0][currIndex])" + num
                            arr[pos.0][currIndex] = -2
                            currIndex -= 1
                        }

                        currIndex = pos.1 + 1
                        while currIndex <= arr[pos.0].count - 1 && arr[pos.0][currIndex] >= 0 {
                            num += "\(arr[pos.0][currIndex])"
                            arr[pos.0][currIndex] = -2
                            currIndex += 1
                        }

                        result += Int(num) ?? 0
                    }
                }
            }
        }
    }
    
    return result
}

public func gearRatiosPartTwo(_ input: String) -> Int {
    
    var arr = input.inputTo2dIntArray()
    var result = 0
    
    for (i, row) in arr.enumerated() {
        for (j, item) in row.enumerated() {
            if item == -1 {

                var possibilities = [(i-1, j-1), (i-1, j), (i-1, j+1), (i, j-1), (i, j+1), (i+1, j-1), (i+1, j), (i+1, j+1)]
                possibilities.removeAll(where: { $0.0 < 0 || $0.0 > arr.count - 1
                                                    || $0.1 < 0 || $0.1 > arr[i].count - 1 })

                var nearby = 0
                var possibleResult = 1
                for pos in possibilities {
                    if arr[pos.0][pos.1] >= 0 {
                        nearby += 1

                        var num = "\(arr[pos.0][pos.1])"
                        arr[pos.0][pos.1] = -2

                        var currIndex = pos.1 - 1
                        while currIndex >= 0 && arr[pos.0][currIndex] >= 0 {
                            num = "\(arr[pos.0][currIndex])" + num
                            arr[pos.0][currIndex] = -2
                            currIndex -= 1
                        }

                        currIndex = pos.1 + 1
                        while currIndex <= arr[pos.0].count - 1 && arr[pos.0][currIndex] >= 0 {
                            num += "\(arr[pos.0][currIndex])"
                            arr[pos.0][currIndex] = -2
                            currIndex += 1
                        }

                        possibleResult *= Int(num) ?? 0
                    }
                }
                
                if nearby == 2 {
                    result += possibleResult
                }
            }
        }
    }
    
    return result
}
