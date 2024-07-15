import XCTest

public class Tests: XCTestCase {
    
    let exampleInputOne =  """
                           broadcaster -> a, b, c
                           %a -> b
                           %b -> c
                           %c -> inv
                           &inv -> a
                           """
    
    let exampleInputTwo = """
                          broadcaster -> a
                          %a -> inv, con
                          &inv -> b
                          %b -> con
                          &con -> output
                          """
    
    func testPartOneExampleOne() {
        let expected = 32000000
        let actual = pulsePropagation(exampleInputOne)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOneExampleTwo() {
        let expected = 11687500
        let actual = pulsePropagation(exampleInputTwo)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 832957356
        let actual = pulsePropagation(testInput)
        
        XCTAssertEqual(expected, actual)
    }
       
    func testPartTwo() {
        let expected = 240162699605221
        let actual = pulsePropagationPartTwo(testInput)
        
        XCTAssertEqual(expected, actual)
    }
}
