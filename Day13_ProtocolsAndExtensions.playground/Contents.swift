import Cocoa

// protocols: like a blueprint
// they let us define a series of properties and methods that we want to use.
// only the function signiture, without code body

protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance) km.")
    }
    // so far this construct conform to protocol Vehicle because it follows the blueprint
    // also you can add more functions beyond the protocol, because protocol only define the minimum
    func openSunroof() {
        print("it's a nice day!")
    }
}
                                        // We can write Vehicle here instead of car because we have the protocol
func commute(distance: Int, using vehicle: Vehicle) {
                                        // This indicate it will take any type as long as it conform the protocol Vehicle
    if vehicle.estimateTime(for: distance) > 100 {
        print("too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

// So we can create another type conform Vehicle, and use it in the "commute' func
struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance) km")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)

// Protocol let us when creating a func, don't have to specific the exact type, intead, it allows us to point at a "group" of type behave the similar (who follow the protocol)

// you can also add variable in protocol with if they're readable and/or writeable
// no default value in protocol, so all the type annotation is required
protocol Vehicle_ {
    var name: String { get } // readable
    var currentPassengers: Int { get set } // read-write, no comma here
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car_: Vehicle_ {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance) km.")
    }

    func openSunroof() {
        print("it's a nice day!")
    }
}

struct Bicycle_: Vehicle_ {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance) km")
    }
}

func getTravelEstimates(using vehicles: [Vehicle_], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}
let car_ = Car_()
let bike_ = Bicycle_()

getTravelEstimates(using: [car_, bike_], distance: 150)

// opaque return types
func getRandomNumber() -> some Equatable { // Equqtable: the build-in protocol that allows two objects to be compared using "=="
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}
// using opaque return types mean we are focusing on functionality more than specific type
// meaning: It will return some kind of type that is equatable, but I don't want to write out what it is, you (Swift) figure it out for yourself!
// Why? giving more flexibility to change in the future, also make us no need to write out gigantic return types

// extensions
// Let's use a build-in String function "trimmingCharacters"
var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed)

// let's write a extension to simplify the name of this function
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() { // still need mutating keyword if you intend to change any property
        self = self.trimmed() // in-place change
    }
}
let trimmed_ = quote.trimmed()
print(trimmed_)
quote.trim()
print(quote)

// you can also add properties to types, but ONLY computed properties, not stored peoperties

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""
print(lyrics.lines)
print(lyrics.lines.count)

// Go back to struct: writing a customized init will override the default memberwise init
// but what if we want to keep both customized init and memberwise init?
// write your init as an extension
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let book = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 23)
let book_ = Book(title: "Lord of the Rings", pageCount: 1178)
print(book)
print(book_)

// protocol extension
// extension to protocol means any type conform to this protocol get this function
extension Collection { // Collection is a built-in protocol includes Array, Set and Dictionary
    var isNotEmpty: Bool {
        isEmpty == false // because isEmpty is required for Collection, we can do so
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

let guests_ = [
    "Nintendo": ["Mario", "Luigi", "Peach"],
    "SONY": ["Spider-man"]
]

if guests_.isNotEmpty {
    print("Guest count: \(guests_.count)")
}

// Apple calls: "protocol-oriented programming"

protocol Person {
    var name: String { get }
    func sayHello()
}

// since protocols don't allow use to write code body, but we can do so in an extension:
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
    // no need to write sayHello because we have a default code in that extension
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Checkpoint 8
protocol Building {
    var roomNum: Int { get }
    var cost: Int { get set }
    var agent: String { get set }
    func printSummary()
}

struct House: Building {
    let roomNum: Int
    var cost: Int
    var agent: String
    init(roomNum: Int, cost: Int, agent: String){
        self.roomNum = roomNum
        self.cost = cost
        self.agent = agent
    }
    
    func printSummary() {
        print("******\nThis House has \(roomNum) rooms\nCost: \(cost)\nMore info Contact: \(agent)")
    }
}

struct Office: Building {
    let roomNum: Int
    var cost: Int
    var agent: String
    
    init(roomNum: Int, cost: Int, agent: String){
        self.roomNum = roomNum
        self.cost = cost
        self.agent = agent
    }
    
    func printSummary() {
        print("******\nThis Office has \(roomNum) rooms\nCost: \(cost)\nMore info Contact: \(agent)")
    }
}

let house = House(roomNum: 4, cost: 2000000, agent: "Shawn")
house.printSummary()
let office = Office(roomNum: 40, cost: 2000000, agent: "Shawn")
office.printSummary()
