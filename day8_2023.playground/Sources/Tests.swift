import XCTest

public class Tests: XCTestCase {
    
    let exampleInputOne =  """
                           RL

                           AAA = (BBB, CCC)
                           BBB = (DDD, EEE)
                           CCC = (ZZZ, GGG)
                           DDD = (DDD, DDD)
                           EEE = (EEE, EEE)
                           GGG = (GGG, GGG)
                           ZZZ = (ZZZ, ZZZ)
                           """
    
    let exampleInputTwo =  """
                           LLR

                           AAA = (BBB, BBB)
                           BBB = (AAA, ZZZ)
                           ZZZ = (ZZZ, ZZZ)
                           """
    
    let exampleInputPartTwo = """
                              LR
                              
                              11A = (11B, XXX)
                              11B = (XXX, 11Z)
                              11Z = (11B, XXX)
                              22A = (22B, XXX)
                              22B = (22C, 22C)
                              22C = (22Z, 22Z)
                              22Z = (22B, 22B)
                              XXX = (XXX, XXX)
                              """
    
    func testPartOneExampleOne() {
        let expected = 2
        let actual = hauntedWasteland(exampleInputOne)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOneExampleTwo() {
        let expected = 6
        let actual = hauntedWasteland(exampleInputTwo)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 13301
        let actual = hauntedWasteland(testInput)

        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 6
        let actual = hauntedWastelandPartTwo(exampleInputPartTwo)

        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 7309459565207
        let actual = hauntedWastelandPartTwo(testInput)

        XCTAssertEqual(expected, actual)
    }
}
