import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        2413432311323
                        3215453535623
                        3255245654254
                        3446585845452
                        4546657867536
                        1438598798454
                        4457876987766
                        3637877979653
                        4654967986887
                        4564679986453
                        1224686865563
                        2546548887735
                        4322674655533
                        """
    
    let exampleInputTwo = """
                          111111111111
                          999999999991
                          999999999991
                          999999999991
                          999999999991
                          """
    
    func testPartOneExampleOne() {
        let expected = 102
        let actual = clumsyCrucible(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }

    func testPartOne() {
        let expected = 936
        let actual = clumsyCrucible(testInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExampleOne() {
        let expected = 94
        let actual = clumsyCruciblePartTwo(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExampleTwo() {
        let expected = 71
        let actual = clumsyCruciblePartTwo(exampleInputTwo)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 1157
        let actual = clumsyCruciblePartTwo(testInput)

        XCTAssertEqual(expected, actual)
    }
}
