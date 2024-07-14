import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  [BoatRace(7, 9),
                         BoatRace(15, 40),
                         BoatRace(30, 200)]
    
    let exampleInputPartTwo = BoatRace(71530, 940200)
    
    func testPartOneExample() {
        let expected = 288
        let actual = waitForIt(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 1155175
        let actual = waitForIt(testInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 71503
        let actual = waitForItPartTwo(exampleInputPartTwo)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 0
        let actual = waitForItPartTwo(testInputPartTwo)
        
        XCTAssertEqual(expected, actual)
    }
}
