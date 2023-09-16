import Cocoa

// null reference - optionals: this thing might have a value or might not

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"] // nil: no value
print(type(of: peachOpposite)) // Optional<String>: write as "String?" in code

// empty is different with no value, e.g. empty array [] / string '' is still a array/string, but no value really means nothing here

// swift likes code to be predictable, so we want to unwrap the optional
// Method 1: use "if let"
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
} else {
    print("I dont know!")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let number = number {
    print(square(number: number)) // called: shadowing
}

// Method 2: use "guard let"
func printSquare(of number: Int?) {
    
    guard let number = number else {
        print("Missing input")
        // 1: We *must* exit the function here
        return // early return
    } // run when there is no value
    
    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}
printSquare(of: nil)
printSquare(of: 2)

//var myVar: Int? = 3
//
//guard let unwrapped = myVar else {
//    print("Run if myVar doesn't have a value inside")
//} => will be error here, because there is no way to early return

// guard also can be used in other cases, like checking if an array is empty
// e.g.
// let someArray = []
// guard someArray.isEmpty else { return }

// Method 3: nil coalescing operator
// providing default value
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"
// this will make the return be a real "String" instead of a "String?"
print(type(of: new)) // String
// Compare to this:
let new_ = captains["Serenity", default: "N/A"] // same result, but not all the case will have this alternative way to do so

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let tvShows_ = [String]()
// randomElement() returns an optional because the array might be empty.
let favorite = tvShows.randomElement() ?? "None"
let favorite_ = tvShows_.randomElement() ?? "None"
print(favorite)
print(favorite_)

// use this in your customer type
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number_ = Int(input) ?? -1
print(number_)

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0

// optional chaining
// for reading optionals inside optionals

let names = ["Arya", "Bran", "Robb", "Sansa"]
//let names = [String]() // try toggle this line and the upper line
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// add and ONLY add question mark after optional type. Because we names must be an Array, so no question mark after it

// an extreme long optional chaining example
// get the first letter of a author of books
struct Book_ {
    let title: String
    let author: String?
}

// var book_: Book? = nil
// var book_: Book? = Book(title: "aaa", author: "")
// var book_: Book? = Book(title: "aaa", author: "bell")
var book_: Book? = Book(title: "aaa", author: nil)
let author_ = book_?.author?.first?.uppercased() ?? "A" // "A" as for anonymous
// if we have a book, and the book has an author, and the author has a first letter, then uppercase it and send it back, otherwise send back A
print(author_)


// handle function failure with optionals: "try?"
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

// "try?" will return optional type, the correct return type or nil
// use it to catch failure and return nil, use this when you don't care the error type because you cannot know which error it is
if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

// use this with nil coalescing
let user_ = (try? getUser(id: 23)) ?? "Anonymous"
print(user_)

// Checkpoint 9
// one line challenge
func randomPick(input: [Int]?) -> Int { input?.randomElement() ?? Int.random(in: 1...100) }

let input_ = [1,2,3,4]
let input__ = [Int]()
let input___: [Int]? = nil

let result_ = randomPick(input: input_)
print(result_)
let result__ = randomPick(input: input__)
print(result__)
let result___ = randomPick(input: input___)
print(result___)
