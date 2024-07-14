import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  #"""
                        .|...\....
                        |.-.\.....
                        .....|-...
                        ........|.
                        ..........
                        .........\
                        ..../.\\..
                        .-.-/..|..
                        .|....-|.\
                        ..//.|....
                        """#
    
    func testPartOneExample() {
        let expected = 46
        let actual = TheFloorWillBeLava(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }

    func testPartOne() {
        let expected = 8249
        let actual = TheFloorWillBeLava(testInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 51
        let actual = TheFloorWillBeLavaPartTwo(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 8444
        let actual = TheFloorWillBeLavaPartTwo(testInput)

        XCTAssertEqual(expected, actual)
    }
}
