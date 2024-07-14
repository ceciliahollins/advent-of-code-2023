import XCTest

public class Tests: XCTestCase {
    
    func testPartOneExampleOne() {
        let expected = 4
        let actual = pipeMaze(examplePartOneInputOne)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOneExampleTwo() {
        let expected = 8
        let actual = pipeMaze(examplePartOneInputTwo)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartOne() {
        let expected = 6640
        let actual = pipeMaze(testInput)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExampleOne() {
        let expected = 4
        let actual = pipeMazePartTwo(examplePartTwoInputOne)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExampleTwo() {
        let expected = 4
        let actual = pipeMazePartTwo(examplePartTwoInputTwo)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExampleThree() {
        let expected = 8
        let actual = pipeMazePartTwo(examplePartTwoInputThree)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwoExampleFour() {
        let expected = 10
        let actual = pipeMazePartTwo(examplePartTwoInputFour)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPartTwo() {
        let expected = 411
        let actual = pipeMazePartTwo(testInput)

        XCTAssertEqual(expected, actual)
    }
}

extension Tests {
    var examplePartOneInputOne: String {
        """
        -L|F7
        7S-7|
        L|7||
        -L-J|
        L|-JF
        """
    }
    
    var examplePartOneInputTwo: String {
        """
        7-F7-
        .FJ|7
        SJLL7
        |F--J
        LJ.LJ
        """
    }
    
    var examplePartTwoInputOne: String {
        """
        ...........
        .S-------7.
        .|F-----7|.
        .||.....||.
        .||.....||.
        .|L-7.F-J|.
        .|..|.|..|.
        .L--J.L--J.
        ...........
        """
    }
    
    var examplePartTwoInputTwo: String {
        """
        ..........
        .S------7.
        .|F----7|.
        .||....||.
        .||....||.
        .|L-7F-J|.
        .|..||..|.
        .L--JL--J.
        ..........
        """
    }
    
    var examplePartTwoInputThree: String {
        """
        .F----7F7F7F7F-7....
        .|F--7||||||||FJ....
        .||.FJ||||||||L7....
        FJL7L7LJLJ||LJ.L-7..
        L--J.L7...LJS7F-7L7.
        ....F-J..F7FJ|L7L7L7
        ....L7.F7||L7|.L7L7|
        .....|FJLJ|FJ|F7|.LJ
        ....FJL-7.||.||||...
        ....L---J.LJ.LJLJ...
        """
    }
    
    var examplePartTwoInputFour: String {
        """
        FF7FSF7F7F7F7F7F---7
        L|LJ||||||||||||F--J
        FL-7LJLJ||||||LJL-77
        F--JF--7||LJLJ7F7FJ-
        L---JF-JLJ.||-FJLJJ7
        |F|F-JF---7F7-L7L|7|
        |FFJF7L7F-JF7|JL---7
        7-L-JL7||F7|L7F-7F7|
        L.L7LFJ|||||FJL7||LJ
        L7JLJL-JLJLJL--JLJ.L
        """
    }
}
