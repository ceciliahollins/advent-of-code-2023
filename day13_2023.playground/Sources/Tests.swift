import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        #.##..##.
                        ..#.##.#.
                        ##......#
                        ##......#
                        ..#.##.#.
                        ..##..##.
                        #.#.##.#.

                        #...##..#
                        #....#..#
                        ..##..###
                        #####.##.
                        #####.##.
                        ..##..###
                        #....#..#
                        """
    
    func testPartOneExample() {
        let expected = 405
        let actual = pointofIncidence(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 33728
        let actual = pointofIncidence(testInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 400
        let actual = pointofIncidencePartTwo(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 28235
        let actual = pointofIncidencePartTwo(testInput)
        
        XCTAssertEqual(expected, actual)
    }
}
