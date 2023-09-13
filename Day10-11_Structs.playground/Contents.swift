import Cocoa

//var greeting = "Hello, playground"

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int = 14 // you can give default value just like a function
    
    // "mutating" indicate this will change the data in this struct
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I am going on vacation!")
            print("Vacation days remaining: \(vacationRemaining)")
        } else {
            print("There aren't enough vacation days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14) // initialize
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

let archer_ = Employee(name: "Sterling Archer", vacationRemaining: 14)
// archer_.takeVacation(days: 5) // will throw error because archer_ is a constant
print(archer_.vacationRemaining)

struct Employee_ {
    // stored property
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    // computed/dynamic property
    var vacationRemaining: Int {
        // getter
        get {
            vacationAllocated - vacationTaken // just like writing function, so there is a omitted "return"
        }
        // setter
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
    
}

var archer__ = Employee_(name: "Sterling Archer", vacationAllocated: 14)
archer__.vacationTaken += 4
print(archer__.vacationRemaining)
archer__.vacationTaken += 4
print(archer__.vacationRemaining)
archer__.vacationRemaining = 5
print(archer__.vacationRemaining)
print(archer__.vacationAllocated)

// property observers: take action when property change
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
var game = Game()
game.score+=10
game.score+=3
game.score+=1

//willSet - newValue: take action before changing
//didSet - oldValue: take action after changing
struct App {
    var contacts = [String]() {
        willSet {
            print("****** during willSet ******")
            print("Current value is: \(contacts)")
            print("Next value will be: \(newValue)")
            print("***end willSet***")
        }
        
        didSet {
            print("****** during didSet ******")
            print("Current value is now: \(contacts)")
            print("Last contacts are: \(oldValue)")
            print("****** end didSet ******")
        }
    }
}

var app = App()
app.contacts.append("A-B")
app.contacts.append("C-D")
app.contacts.append("E-F")

// how to customize initializer ?
// golden rule: all properties must have a value by the time the initializer ends!
struct Player {
    let name: String
    let number: Int
    
    init(for name: String) { // no "func" keyword for initializer
        self.name = name
        number = Int.random(in: 1...99) // no need to write self when there is no confusion
    }
}

let player = Player(for: "Megan R")
print(player)

// another good example
struct Cabinet {
    var height: Double
    var width: Double
    var area: Double
    init (itemHeight: Double, itemWidth: Double) {
        height = itemHeight
        width = itemWidth
        area = height * width
    }
}
let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)
print(drawers)

struct BankAccount {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)
if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

account.funds -= 1000 // this kind of code will pypass the logic of our function, to make change of the property. So this shouldn't be allowed logically

// access control
// private “don’t let anything outside the struct use this.”
// private(set) "don’t let anything outside the struct write this, but read is Okay"
// fileprivate “don’t let anything outside the current file use this.”
// public “let anyone, anywhere use this.”

struct BankAccount_ {
    private(set) var funds = 0 // anything outsite the struct cannot write this, but can read

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account_ = BankAccount_()
// account_.funds -= 1000 // will throw errors

// ⚠️ when using private variable, the default initializer will be disabled
// you will have to write your own initializer function
// did do this for the case above because there is nothing to initialize

// What if you want to create properties or functions that applied on the struct instead of a instance of this struct?

// static properties and methods
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Shawn")
print(School.studentCount)
// notice that we use it on the struct itself instead of on an instance
// notice there is no mutating keyword on add function

// Rules:
// static code can NOT access non-static code (you really cannot write a code to do that)
// non-static code CAN access static code (you can "Self" to refer the struct type itself)

// Why do we use them?
// 1. store common info
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
print(AppData.version)

// 2. create an instance examples of your structs as preview (a common thing you will do when develop SwiftUI)

struct Employee__ {
    let username: String
    let password: String

    static let example = Employee__(username: "cfederighi", password: "hairforceone")
}

print(Employee__.example) // will be a ready instance example you can use to preview or test

// Checkpoint 6
struct Car {
    let model: String
    let seatsNum: Int
    let gearUpto: Int
    private(set) var currentGear: Int = 0 // make sure the Gear cannot be changed illegally
    
    static let planetOfInvention = "earth" // just practice static property
    
    init (model: String, seatsNum: Int, gearUpto: Int = 5) {
        self.model = model
        self.seatsNum = seatsNum
        self.gearUpto = gearUpto
    }
    
    mutating func gearUp(){
        if currentGear < gearUpto {
            currentGear+=1
            print("swithed to gear \(currentGear), let's go!")
        } else {
            print("Stick is stucked!!")
        }
    }
    
    mutating func gearDown(){
        if currentGear > 0 {
            currentGear-=1
            if currentGear == 0 {
                print("Parked!")
            } else {
                print("slowed down to gear \(self.currentGear)")
            }
        } else {
            print("Bro, the car is literally parked.")
        }
    }
}

print(Car.planetOfInvention)

var myCar = Car(model: "Toyota", seatsNum: 5)
print(myCar.model)
print(myCar.seatsNum)
print(myCar.gearUpto)
print(myCar.currentGear)
myCar.gearUp()
myCar.gearUp()
myCar.gearUp()
myCar.gearUp()
myCar.gearUp()
myCar.gearUp()
print(myCar.currentGear)
myCar.gearDown()
myCar.gearDown()
myCar.gearDown()
myCar.gearDown()
print(myCar.currentGear)
myCar.gearDown()
myCar.gearDown()
myCar.gearDown()
print(myCar.currentGear)
