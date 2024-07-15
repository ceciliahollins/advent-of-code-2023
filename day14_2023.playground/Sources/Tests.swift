import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        O....#....
                        O.OO#....#
                        .....##...
                        OO.#O....O
                        .O.....O#.
                        O.#..O.#.#
                        ..O..#O..O
                        .......O..
                        #....###..
                        #OO..#....
                        """
    
    func testPartOneExample() {
        let expected = 136
        let actual = parabolicReflectorDish(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 108792
        let actual = parabolicReflectorDish(testInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 64
        let actual = parabolicReflectorDishPartTwo(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 99118
        let actual = parabolicReflectorDishPartTwo(testInput)
        
        XCTAssertEqual(expected, actual)
    }
}
