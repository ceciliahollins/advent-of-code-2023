import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        1abc2
                        pqr3stu8vwx
                        a1b2c3d4e5f
                        treb7uchet
                        """
    
    let exampleInputPartTwo =  """
                               two1nine
                               eightwothree
                               abcone2threexyz
                               xtwone3four
                               4nineeightseven2
                               zoneight234
                               7pqrstsixteen
                               """
    
    func testPartOneExample() {
        let expected = 142
        let actual = trebuchet(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 55208
        let actual = trebuchet(testInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 281
        let actual = trebuchetPartTwo(exampleInputPartTwo)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 54578
        let actual = trebuchetPartTwo(testInput)
        
        XCTAssertEqual(expected, actual)
    }
}
