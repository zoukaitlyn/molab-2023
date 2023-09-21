//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// how to create and use closures

// skip creating a separate function... assign directly
let sayHello = {
    print("Hi there!")
}
sayHello()

// closure to accept parameters
func greetUser(){
    print("Hi there")
}
// no parameters, void = function returns nothing
var greetCopy: () -> Void = greetUser

let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}


