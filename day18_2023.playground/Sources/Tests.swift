import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        R 6 (#70c710)
                        D 5 (#0dc571)
                        L 2 (#5713f0)
                        D 2 (#d2c081)
                        R 2 (#59c680)
                        D 2 (#411b91)
                        L 5 (#8ceee2)
                        U 2 (#caa173)
                        L 1 (#1b58a2)
                        U 2 (#caa171)
                        R 2 (#7807d2)
                        U 3 (#a77fa3)
                        L 2 (#015232)
                        U 2 (#7a21e3)
                        """
    
    func testPartOneExample() {
        let expected = 62
        let actual = lavaductLagoon(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }

    func testPartOne() {
        let expected = 58550
        let actual = lavaductLagoon(testInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 952408144115
        let actual = lavaductLagoonPartTwo(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 47452118468566
        let actual = lavaductLagoonPartTwo(testInput)

        XCTAssertEqual(expected, actual)
    }
}
