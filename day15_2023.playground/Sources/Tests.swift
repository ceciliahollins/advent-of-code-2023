import XCTest

public class Tests: XCTestCase {
    
    let exampleInputPartOne = """
                          HASH
                          """
    
    let exampleInput =  """
                           rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
                           """
    
    func testPartOneExampleOne() {
        let expected = 52
        let actual = lensLibrary(exampleInputPartOne)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOneExampleTwo() {
        let expected = 1320
        let actual = lensLibrary(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }

    func testPartOne() {
        let expected = 494980
        let actual = lensLibrary(testInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 145
        let actual = lensLibraryPartTwo(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 247933
        let actual = lensLibraryPartTwo(testInput)

        XCTAssertEqual(expected, actual)
    }
}
