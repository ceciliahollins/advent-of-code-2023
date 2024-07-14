import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
                        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
                        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
                        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
                        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
                        """
    
    func testPartOneExample() {
        let expected = 8
        let actual = cubeConundrum(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 2317
        let actual = cubeConundrum(testInput)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwoExample() {
        let expected = 2286
        let actual = cubeConundrumPartTwo(exampleInput)

        XCTAssertEqual(expected, actual)
    }

    func testPartTwo() {
        let expected = 74804
        let actual = cubeConundrumPartTwo(testInput)

        XCTAssertEqual(expected, actual)
    }
}
