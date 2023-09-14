//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// functions, parameters, and return values

// reuse code with functions
let number = 139

if number.hashValue.isMultiple(of: 2){
    print("even")
} else {
    print("odd")
}

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

// return values from functions
// write arrow then data type(what kind of data will be sent back)
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func sameLetters(a: String, b: String) -> Bool {
    let first = a.sorted()
    let second = b.sorted()
    return first == second
}

print(sameLetters(a: "snake", b: "eanks"))

// return multiple values from functions
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

// customize parameter labels
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result1 = isUppercase(string)

// external name -- for
// internal name -- number
// type -- Int
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
