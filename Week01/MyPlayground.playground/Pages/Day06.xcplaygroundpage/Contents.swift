//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// loops, summary, and checkpoint 3

// loops
let animals = ["tiger", "seal", "sloth"]

for a in animals{
    print("Animal is \(a)")
}

for i in 1...12{
    print("5 x \(i) is \(5*i)")
}

for i in 1...12{
    print("The \(i) times table")
    for j in 1...12 {
        print("\(j) x \(i) is \(j*i)")
    }
    print()
}

for i in 1..<5{
    print("Counting from 1 up to 5: \(i)")
}

// while loop
var countdown = 5

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// skip loop items with break and continue

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// checkpoint 3

for i in 1...100{
    if i % 3 == 0 {
        print("fizz")
    } else if i % 5 == 0 {
        print("buzz")
    } else if i % 5 == 0 && i % 3 == 0 {
        print("fizzbizz")
    } else {
        print(i)
    }
}

