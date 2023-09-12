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
            vacationAllocated - vacationTaken // just like writing function, there is a omitted "return"
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

