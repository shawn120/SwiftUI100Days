import Cocoa

// arrays
// ordered data
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 42, 15, 16, 23, 8] // array also could be var or const
var temperatures = [25.3, 28.2, 26.4]

// read/access
print(beatles[0])
print(temperatures[2])

beatles.append("Shawn")

// Swift has type safty
// empty array
var scores = Array<Int>()

var albums = Array<String>()
var albums_ = [String]() // works exactly the same

print(beatles.count)
beatles.remove(at: 4)
print(beatles.count)
beatles.removeAll()
print(beatles.count)

print(numbers.contains(3))
print(numbers.contains(4))

print(numbers.sorted())
var beatles_ = ["John", "Paul", "George", "Ringo"]
print(beatles_.sorted())
print(beatles_.reversed()) // not "actually" reverse the array itself, instead reverse the index when you read it later

// dictionary
let employee = ["name": "Taylor Swift",
                 "job": "Singer",
                 "location": "Nashville"]
print(employee["name"])
print(employee["job"])
print(employee["location"]) // there will be type warning here, tell you that you might not get value back: as:
print(employee["fake_key"])

print(employee["name", default: "unknown"])
print(employee["fake_key", default: "unknown"])

// create empty dictionary
var heights = [String: Int]()
print(heights)

heights["Yao Ming"] = 229
heights["Peter"] = 180
heights["Shawn"] = 177
heights["Shawn"] = 176 // will overwrite
print(heights)

print(heights.count)
heights.removeValue(forKey: "Peter")
print(heights)

// also could use remove(at:)
// but why would you do that??
if let idx = heights.index(forKey: "Shawn"){
    heights.remove(at: idx)
    print(heights)
}

heights.removeAll()
print(heights)

// some extra info
let demo: [String:Any] = [
    "number":1,
    "string":"string",
    "bool": false
]

// set
// No order and No duplicate
var people = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson"
])

print(people)

people.insert("Shawn")
print(people)

// empty set
var actor = Set<String>()
actor.insert("Shawn")
actor.insert("Shawn") // No duplicate
actor.insert("Shawn2")
print(actor)

print(people.count)
print(people.contains("Shawn"))
print(people.contains("Shawn2"))

print(people)
var people2 = people.sorted() // return a sorted array
print(people2)

// enums
enum TimeOfDay {
    case AM
    case PM
}

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = Weekday.friday
day = .wednesday // dont have to include enum name: Weekday after creating it
