import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        32T3K 765
                        T55J5 684
                        KK677 28
                        KTJJT 220
                        QQQJA 483
                        """
    
    func testPartOneExample() {
        let expected = 6440
        let actual = camelCards(exampleInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 251106089
        let actual = camelCards(testInput)

        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExample() {
        let expected = 5905
        let actual = camelCardsPartTwo(exampleInput)

        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 249620106
        let actual = camelCardsPartTwo(testInput)
        
        XCTAssertEqual(expected, actual)
    }
}
