import UIKit

// variables, constants, strings, and numbers

// variable
var greeting = "Hello, playground"
greeting = "Hi, playground"

// constants
let fruit = "apple"

// strings
let name = "Johnny Appleseed"
let quotes = "She said \"hi\""
let longQuote = """
A day
in the life
"""

let nameLength = name.count
print(nameLength)

print(fruit.uppercased())
print(longQuote.hasPrefix("A day"))

// whole numbers
let score = 10
let million = 1_000_000

let number = 120
print(number.isMultiple(of: 3))

// decimal numbers
let decNum = 0.1 + 0.2
print(decNum)

let a = 1
let b = 2.0
let c = a + Int(b)
let d = Double(a) + b
print(c, d)




