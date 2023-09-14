//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// text art

var space = " "

func spaces(number: Int){
    for _ in 1...number {
        print(space, terminator: "")
    }
}

func littleFish(num: Int) {
    for _ in 1...num{
        print(space, terminator: "")
    }
    print("<><")
}

func bigFish(num1: Int, num2: Int){
    spaces(number: num1)
    print("__")
    spaces(number: num2)
    print("/o \\/")
    spaces(number: num2)
    print("\\__/\\")
}

bigFish(num1: 8, num2: 7)
littleFish(num: 2)
bigFish(num1: 4, num2: 3)
littleFish(num: 15)
bigFish(num1: 20, num2: 19)
bigFish(num1: 10, num2: 9)
littleFish(num: 5)


