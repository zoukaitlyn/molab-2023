//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// arrays, dictionaries, sets, and enums

// arrays
var scores = Array<Int>()
scores.append(100)
scores.append(96)
scores.append(20)
print(scores[1])

var albums = Array<String>()
albums.append("Red")
albums.append("Fearless")

var albums2 = [String]()
albums2.append("Red")

var characters = ["Lana", "Pam", "Ray"]
characters.remove(at: 2)
print(characters)

characters.removeAll()
print(characters.count)

let movies = ["Rome", "London", "Tokyo"]
print(movies.contains("Rome"))
print(movies.sorted())
// produces new type, keeps original array intact
// remembers itself to reverse
print(movies.reversed()[0])

// dictionaries
let employee = [
    "name": "Taylor Swift",
    "location" : "Nashville"
]

// optional- data might be there, might not
print(employee["name"])
print(employee["name", default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["LeBron James"] = 206

// sets
// doesn't take duplicates, doesn't rmb order
let actors = Set([
    "Tom Cruise",
    "Margot Robbie",
    "Zac Efron"
])

var actors2 = Set<String>()
actors2.insert("Tom Cruise")
actors2.insert("Margot Robbie")
print(actors2)

// enums
enum Weekday {
    case monday, tuesday, wednesday
}

var day = Weekday.monday
day = .tuesday
day = .wednesday


