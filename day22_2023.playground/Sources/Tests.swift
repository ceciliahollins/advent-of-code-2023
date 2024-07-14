import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        1,0,1~1,2,1
                        0,0,2~2,0,2
                        0,2,3~2,2,3
                        0,0,4~0,2,4
                        2,0,5~2,2,5
                        0,1,6~2,1,6
                        1,1,8~1,1,9
                        """
    
    func testPartOneExample() {
        let expected = 5
        let actual = sandSlabs(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
//    func testPartOne() {
//        let expected = 0
//        let actual = sandSlabs(testInput)
//        
//        XCTAssertEqual(expected, actual)
//    }
//    
//    func testPartTwoExample() {
//        let expected = 0
//        let actual = sandSlabsPartTwo(exampleInput)
//        
//        XCTAssertEqual(expected, actual)
//    }
//    
//    func testPartTwo() {
//        let expected = 0
//        let actual = sandSlabsPartTwo(testInput)
//        
//        XCTAssertEqual(expected, actual)
//    }
}
