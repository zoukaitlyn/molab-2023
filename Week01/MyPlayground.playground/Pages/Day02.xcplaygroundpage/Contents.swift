//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// booleans, string interpolation, and checkpoint 1

// booleans
let goodDogs = true
var gameOver = false
gameOver.toggle()
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated

// join strings together
let first = "Hello, "
let second = "world"
let total = first + second

let name = "Taylor"
let age = 26
let message = "My name is \(name) and I'm \(age)"

print("5 * 5 is \(5 * 5)")

// checkpoint 1
let celTemp = 32
let fahTemp = (celTemp*9)/5 + 32
print("Celsius is \(celTemp), Fahrenheit is \(fahTemp)")




