import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        ...#......
                        .......#..
                        #.........
                        ..........
                        ......#...
                        .#........
                        .........#
                        ..........
                        .......#..
                        #...#.....
                        """
    
    func testPartOneExampleOne() {
        let expected = 374
        let actual = cosmicExpansion(exampleInput, universeSize: 1)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 9233514
        let actual = cosmicExpansion(testInput, universeSize: 1)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExampleOne() {
        let expected = 1030
        let actual = cosmicExpansion(exampleInput, universeSize: 10)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExampleTwo() {
        let expected = 8410
        let actual = cosmicExpansion(exampleInput, universeSize: 100)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 363293506944
        let actual = cosmicExpansion(testInput, universeSize: 1000000)

        XCTAssertEqual(expected, actual)
    }
}
