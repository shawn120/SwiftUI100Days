import Cocoa

var greeting = "Hello, playground" // variable
let userName = "Shawn" // constant

print(userName)

let longString = """
First line
second line
third line
"""
print(longString)

print(greeting.count)
print(greeting.uppercased())
print(greeting.hasPrefix("Hello")) // remember case sensitive

let score = 2_100_000
let score_ = 2_100____00__0 // also works but why would you do something like that?
let computeScore = (score-1+2)*4/2*score

var counter = 10
counter += 5
print(counter)
counter *= 2
print(counter)

let number = 120
print(number.isMultiple(of: 3))
//or
print(120.isMultiple(of: 3))

let number_ = 0.1 + 0.2
print(number_)

let result = 1.0/3.0
print(result)

//Booleans
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let goodDogs = true
let gameOver = false

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
//isAuthenticated = !isAuthenticated
isAuthenticated.toggle()
print(isAuthenticated)

var gameOver_ = false
print(gameOver_)

gameOver_.toggle()
print(gameOver_)

// join strings
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let luggageCode = "1" + "2" + "3" + "4" + "5" // will create too many temporary strings, so don't do this
print(luggageCode)

//string interpolation

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

// put calculations inside string interpolation
print("5 x 5 is \(5 * 5)")

// check point
let cel = 30.5
let fe = cel * 9 / 5 + 32
print("\(cel) °C is equal to \(fe) °F")
