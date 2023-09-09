import Cocoa

var greeting = "Hello, playground"

func showWelcome() {
    print("hello")
    print("welcome")
    print("Thank you")
}

showWelcome() // Our function's call site

func printTimesTable(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTable(number: 5, end: 9)

// return value
let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func ifSameLetter(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted() // only when there is only one return line, you can omit "return"
}

print(ifSameLetter(string1: "abc", string2: "acb"))

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

print(pythagoras(a: 3, b: 4))

// return multiple values
// best way: using tuple: fixed length of values with labels/keys
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
// or
print("Name: \(user.0) \(user.1)")

func getUser2() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift") // the lables can be omitted
}

let user2 = getUser2()
print("Name: \(user2.firstName) \(user2.lastName)")

// destructure
let (firstname, lastname) = getUser2()
print("Name: \(firstname) \(lastname)")

// when destructure, you can use underscore to omit the var you dont need
let (name, _) = getUser2()
print("Hi! \(name)")

// you could use tuple without labels:
let exTuple = (1,2)
print(exTuple.0, exTuple.1)

// it is valid for swift to have functions with same names, but with different parameter labels
func people(name: String) {}
func people(gender: String) {}
func people(location: String) {}

let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see")) // where is the parameter labels here? How to do that?

// add underscore before the label
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
print(isUppercase(string))

// how to overwrite system function name if you want to use that keyword for your customized parameter lables?

// "for": external name, argument label
// "number": in-function/internal name, parameter name
func printTimesTables(for number: Int) {
    for i in 1...9 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

// default values

func printTimesTables2(for number: Int, end: Int = 9) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables2(for: 5)
printTimesTables2(for: 8, end: 2)

var characters = ["A", "B", "C", "D"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
// will help in performance impact (memory usage and runtime) if you plan to add similar amount elements back to this array
print(characters.count)

// handle errors
// step1: define errors
// step2: define a func that can be triggered by these errors
// step3: call this func using "do-try-catch"

enum PasswordError: Error {   // remember to use the build-in type "Error"
    case short, obvious // just the label/name, doesn't mean anything
}

func checkPassword(_ password: String) throws -> String { // must add "throws" keyword make this function a "error-throwing function"
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let password = "12345"

do {
    let result = try checkPassword(password)
    print("Password is \(result)")
} catch {
    print("There was an error")
}

do {
    let result_ = try checkPassword(password)
    print("Password is \(result_)")
} catch PasswordError.short {
    print("Password is too short!")
} catch PasswordError.obvious {
    print("Password is too obvious!")
} catch {
    print("There was an error.")
}

// you can use "try!" to omit do and catch when you are SUPER sure your throwing function won't go wrong, but this is not recommanded because what if you are wrong, then the app will crash
let result__ = try! checkPassword("12345aaaaaaa")
print(result__)

// checkpoint 4

enum mySqrtError: Error{
    case outOfBounds, noRoot
}
// input take 1...10_000, so the answer will be 1...100
func mySqrt(of target: Int) throws -> Int {
    if target < 1 || target > 10_000{
        throw mySqrtError.outOfBounds
    }
    for i in 1...100{
        if i*i == target{
            return i
        }
    }
    throw mySqrtError.noRoot
}
let target = 0
do {
    let answer = try mySqrt(of: target)
    print("the square root of \(target) is \(answer)")
} catch mySqrtError.outOfBounds {
    print("the target is out of bounds")
} catch mySqrtError.noRoot {
    print("the target has no integer root")
}
