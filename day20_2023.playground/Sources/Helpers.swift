import Foundation

// Helper functions to find the LCM, used for part 2
//https://stackoverflow.com/questions/28349864/algorithm-for-lcm-of-doubles-in-swift

// GCD of two numbers:
func gcd(_ a: Int, _ b: Int) -> Int {
    var (a, b) = (a, b)
    while b != 0 {
        (a, b) = (b, a % b)
    }
    return abs(a)
}

// LCM of two numbers:
func lcm(a: Int, b: Int) -> Int {
    return (a / gcd(a, b)) * b
}

// LCM of a vector of numbers:
func lcm(_ vector : [Int]) -> Int {
    return vector.reduce(1, lcm)
}
