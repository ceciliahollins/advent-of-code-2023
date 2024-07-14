import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        ???.### 1,1,3
                        .??..??...?##. 1,1,3
                        ?#?#?#?#?#?#?#? 1,3,1,6
                        ????.#...#... 4,1,1
                        ????.######..#####. 1,6,5
                        ?###???????? 3,2,1
                        """
    
//    let exampleInput = """
//????#.???###.???? 1,1,3,1
//???.???.??#???#??? 1,1,4,3
//??????????.????#??? 1,2,1,2,1,1
//????????????. 1,2,1,1
//"""
    
    func testPartOneExample() {
        let expected = 21
        let actual = hotSprings(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 6949
        let actual = hotSprings(testInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 525152
        let actual = hotSpringsPartTwo(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 51456609952403
        let actual = hotSpringsPartTwo(testInput)
        
        XCTAssertEqual(expected, actual)
    }
}
