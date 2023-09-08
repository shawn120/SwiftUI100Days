import Cocoa

// type annotations
let surname = "Lasso" // type inference only
let surname_: String = "Lasso" // where type annotations is not really doing any thing

let score = 1
let score_: Double = 1 // where annotations make some difference
print(score)
print(score_)

var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other"
])

// initialize to empty array
var teams = [String]()
var teams_: [String] = [String]()
var teams__ : [String] = []
// no initializing
var teams___: [String]

// for enum
enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
var style_: UIStyle = UIStyle.light
var style__: UIStyle = .light

let username: String // okay
username = "Shawn" // okay
//username = "Paul" // not okay, bc it is still a constant
print(username)

/*
Goldern rule: Let swift know which type it is using all the time, no matter from type inference or type annotation
BUT, it has to be possible
e.g.:
let scores: Int = "Zero" // not posible, so error
*/

//check point 2
let target = ["a", "b", "c", "d", "b", "b", "d", "e"] // count = 8, unique_count = 5
print(target.count)
let target_set = Set(target)
print(target_set)
print(target_set.count)
