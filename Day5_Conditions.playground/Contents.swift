import Cocoa

// if
let score = 85
if score >= 80 {
    print("Great job!")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("it's \(ourName) vs \(friendName)")
} else {
    print("it's \(friendName) vs \(ourName)")
}

var nums = [1,2,3]
nums.append(4)
if nums.count > 3 {
    nums.remove(at: 0)
}
print(nums)

var user_name = ""
if user_name == "" {
    user_name = "Anonymous User"
}
if user_name.isEmpty {                     // same effect
    user_name = "Anonymous User"
}
print("welcome, \(user_name)")

// bool with enum
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second) // That will print “true”, because small comes before large in the enum case list.

// else if
let a = false
let b = true

if a {
    print("a is true, no matter what b is")
} else if b {
    print("a is false, while b is true")
} else {
    print("both a and b are false")
}

// logical operator
// AND: &&
let temp = 25

if temp > 20 && temp < 30 {
    print("it's a nice day")
}

// OR: ||
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
} else {
    print("please leave")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to rent a scooter now!")
}


// random tip: it is invalid to compare int and double in Swift
// because: you can only compare between same types
// But: don't forgot Swift also have type inference so:
// "if 10.1 > 10" is valid, while:
// "var x = 10.1; var y = 10; if x > y" is invalid
// try it here:
// var x = 10.1
// var y = 10
// if x>y{print("yes")} // error message: Binary operator '>' cannot be applied to operands of type 'Double' and 'Int'

// switch
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}
// it won't allow you neither miss one or check one twice, you must check all the case, and only once for each
// it will check each case in order until one case is true,
    // But if you want to carry on all the cases, you can use: "fallthrough" (will show example later)

// but sometimes, it is impossible to cover all the case, e.g. when you check a string, it is impossible to cover all the string in the world
// solution: use "default"

let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:                               // similar with "else"
    print("Who are you?")
}

// "switch" with "fallthrough"
// let's say you get 1 dollar each day in 5 days
    // (there is better way to solve this problem but who cares, let's see how to use fallthrough)
let currentDay = 5 // which day is it now
var myBank = 0
switch currentDay {
case 5:
    myBank+=1
    fallthrough
case 4:
    myBank+=1
    fallthrough
case 3:
    myBank+=1
    fallthrough
case 2:
    myBank+=1
    fallthrough
case 1:
    myBank+=1
    fallthrough
case 0:
    myBank+=0         // you cannot add fallthrough here in this case because default case will run no matter what
default:
    myBank = -1
    print("invalid currentDay")
}
print(myBank)
// if you use regular switch function, it will only print out 1 because Swift stop checking later cases when it find the case whose true, but by using fallthrough, it will keep running even it find the true case

// ternary conditional operator
    // what is binary operator? "+" "*" because they take 2 input: "2 + 5"
// a ternary conditional operator:
    //" ? : " which take 3 input
let age = 18
let canVote = age >= 18 ? "Yes" : "No"
//           |  What   | | True| | False|   -> WTF


var names = ["Shawn", "Paul"]
names.removeAll() // toggle this to see the difference
let count = names.isEmpty ? "no one here" : "\(names.count) people here"
print(count)
// or just write print around it
print(names.isEmpty ? "no one here" : "\(names.count) people here")

// but why not just use "if-else"?
// answer: trust me bro, it will matter later when it comes with SwiftUI
