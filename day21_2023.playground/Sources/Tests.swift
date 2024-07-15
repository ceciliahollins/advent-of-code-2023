import XCTest

public class Tests: XCTestCase {
    
    let exampleInput =  """
                        ...........
                        .....###.#.
                        .###.##..#.
                        ..#.#...#..
                        ....#.#....
                        .##..S####.
                        .##..#...#.
                        .......##..
                        .##.#.####.
                        .##..##.##.
                        ...........
                        """
    
    let anotherExample = """
                         S.
                         ..
                         """
    
//    func testPartOneExample() {
//        let expected = 16
//        let actual = stepCounter(exampleInput, numOfSteps: 6)
//        
//        XCTAssertEqual(expected, actual)
//    }
//    
//    func testPartOne() {
//        let expected = 3740
//        let actual = stepCounter(testInput, numOfSteps: 64)
//        
//        XCTAssertEqual(expected, actual)
//    }
//    
    
    func testPartTwoExampletest() {
        let expected = 16
        let actual = stepCounterPartTwo(anotherExample, numOfSteps: 3)
        
        XCTAssertEqual(expected, actual)
    }
    
//    func testPartTwoExample6Steps() {
//        let expected = 16
//        let actual = stepCounterPartTwo(exampleInput, numOfSteps: 6)
//        
//        XCTAssertEqual(expected, actual)
//    }
    
//    func testPartTwoExample10Steps() {
//        let expected = 50
//        let actual = stepCounterPartTwo(exampleInput, numOfSteps: 10)
//        
//        XCTAssertEqual(expected, actual)
//    }
    
//    func testPartTwoExample50Steps() {
//        let expected = 1594
//        let actual = stepCounterPartTwo(exampleInput, numOfSteps: 50)
//        
//        XCTAssertEqual(expected, actual)
//    }
    
//    func testPartTwoExample100Steps() {
//        let expected = 6536
//        let actual = stepCounterPartTwo(exampleInput, numOfSteps: 100)
//        
//        XCTAssertEqual(expected, actual)
//    }
    
//    func testPartTwoExample500Steps() {
//        let expected = 167004
//        let actual = stepCounterPartTwo(exampleInput, numOfSteps: 500)
//        
//        XCTAssertEqual(expected, actual)
//    }
    
//    func testPartTwoExample1000Steps() {
//        let expected = 668697
//        let actual = stepCounterPartTwo(exampleInput, numOfSteps: 1000)
//        
//        XCTAssertEqual(expected, actual)
//    }
    
//    func testPartTwoExample5000Steps() {
//        let expected = 16733044
//        let actual = stepCounterPartTwo(exampleInput, numOfSteps: 5000)
//        
//        XCTAssertEqual(expected, actual)
//    }
        
//    func testPartTwo() {
//        let expected = 0
//        let actual = stepCounterPartTwo(testInput)
//        
//        XCTAssertEqual(expected, actual)
//    }
}
