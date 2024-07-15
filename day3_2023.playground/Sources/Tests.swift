import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        467..114..
                        ...*......
                        ..35..633.
                        ......#...
                        617*......
                        .....+.58.
                        ..592.....
                        ......755.
                        ...$.*....
                        .664.598..
                        """
    
    func testPartOneExample() {
        let expected = 4361
        let actual = gearRatios(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }

    func testPartOne() {
        let expected = 560670
        let actual = gearRatios(testInput)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwoExample() {
        let expected = 467835
        let actual = gearRatiosPartTwo(exampleInput)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwo() {
        let expected = 91622824
        let actual = gearRatiosPartTwo(testInput)

        XCTAssertEqual(expected, actual)
    }
}
