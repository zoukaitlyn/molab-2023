//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// type annotations and checkpoint 2

// type annotations
let surname: String = "Lasso"
let score: Int = 0
let pi: Double = 3.141
let isTrue: Bool = true
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["Red": "Fearless"]
var books: Set<String> = Set ([
    "The Bluest Eye",
    "Foundation"
])

// use type annotation when you don't want to provide initial values
var teams: [String] = [String]()
var cities: [String] = []

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark

// create a constant that doesn't have a value yet
let username: String
// lots of complex logic
username = "@twostraws"
// more complex logic
print(username)

// checkpoint 2

let colors: [String] = ["yellow", "red", "blue", "green", "red"]
print(colors.count)

let unique_colors: Set<String> = Set(colors)
print(unique_colors.count)




