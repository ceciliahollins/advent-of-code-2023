import XCTest

public class Tests: XCTestCase {
    
    let exampleInputOne =  """
                           0 3 6 9 12 15
                           1 3 6 10 15 21
                           10 13 16 21 30 45
                           """
    
    func testPartOneExampleOne() {
        let expected = 114
        let actual = mirageMaintenance(exampleInputOne)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 2101499000
        let actual = mirageMaintenance(testInput)

        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 2
        let actual = mirageMaintenancePartTwo(exampleInputOne)

        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 1089
        let actual = mirageMaintenancePartTwo(testInput)

        XCTAssertEqual(expected, actual)
    }
}
