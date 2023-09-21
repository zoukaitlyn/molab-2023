//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// provide default values for parameters
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
// if end is not specified, use 12
printTimesTables(for: 8)

// handle errors in functions
enum PasswordError: Error {
    case short, obvious
}

// throw = smth fatal went wrong in function
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

// checkpoint 4
enum numError: Error {
    case outOfBounds, noRoot
}

func sqRoot(num: Int) throws -> String {
    if num < 1 || num > 10000 {
        throw numError.outOfBounds
    }
    
    for i in 1...100{
        if num == i * i {
            return "\(i)"
        }
    }
    throw numError.noRoot
}

let number = 100

do {
    let ans = try sqRoot(num: number)
    print("Square root is: \(ans)")
} catch numError.outOfBounds {
    print("Number is out of bounds")
} catch numError.noRoot {
    print("Number has no root")
}
