//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// if, switch, and the ternary operator

// if
let speed = 2
if speed == 2{
    print("Do Something")
}

var numbers = [1,2,3,4]
if numbers.count > 3{
    numbers.remove(at:0)
}
print(numbers)

if !numbers.isEmpty{
    print("full")
} else {
    print("empty")
}
    
// multiple conditions
enum transportOption {
    case airplane, car, bus, train, helicopter, bicycle
}

let transport = transportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly")
} else if transport == .bicycle {
    print("Let's take the bike path")
} else {
    print("Hire a scooter")
}

// switch statements to check multiple conditions
enum Weather {
    case sun, rain, wind, snow
}
let forecast = Weather.snow

switch forecast{
case .sun:
    print("Sunny day")
case .rain:
    print("Rainy day")
case .wind:
    print("Windy day")
default:
    print("Snowy day")
}

// use fallthrough to carry on executing subsequent cases
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// ternary
let age = 17
//               What     True  False
let canVote = age >= 18 ? "Yes": "No"
print(canVote)

let names = ["Jane", "Mal", "Sally"]
let crewCount = names.isEmpty ? "No one": "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)




    
    

    
