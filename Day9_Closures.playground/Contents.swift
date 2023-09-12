import Cocoa

// functions
func greetUser() {
    print("Hi there!")
}

// what is the type of a function?
var greetCopy: ()->Void = greetUser
greetCopy()

// closures: a constant-like function
let sayHello = {
    print("Hi there!")
}

sayHello()

let sayHello_ = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello_("Shawn") // for closures, we don't/can't use parameter label, which means also NO external labels

// so why we need closures?
// here is an example

let characters = ["C", "D", "A", "B"]
let sortedCharacters = characters.sorted() // ["A", "B", "C", "D"]
print(sortedCharacters)
// We can customize the sort function by passing in a function which:
    // take two input string, if string1 should come first, return true, otherwise, false

// Let's say we want D to always be the first character because why not
func DAlwaysFirst(string1: String, string2: String) -> Bool {
    if string1.hasPrefix("D") {
        return true
    } else if string2.hasPrefix("D") {
        return false
    }
    return string1 < string2
}

let DSortedChar = characters.sorted(by: DAlwaysFirst) // ["D", "A", "B", "C"]
print(DSortedChar)

// so we can also use just pass in a closure instead of creating a whole new function, this will have same result
let DSortedChar_ = characters.sorted(by: {(string1: String, string2: String) -> Bool in
    if string1.hasPrefix("D") {
        return true
    } else if string2.hasPrefix("D") {
        return false
    }
    return string1 < string2
})
// what's inside the braces {} are the closure
// what's inside the parenthesis after "by:" (by:) are the parameters we pass in to sorted function
print(DSortedChar_)

// but how to make it easier to read?
// firstly, because for the function/closure type a function can take, the input type and output type are already fixed, e.g. in this case, sorted function can only take a (String, String) -> Bool function/closure, so we don't need to include the type anymore
// secondly, we can also omit the whole (by: ) parenthesis and parameter label
// This is called "trailing closure syntax"
let DSortedChar__ = characters.sorted { string1, string2 in
    if string1.hasPrefix("D") {
        return true
    } else if string2.hasPrefix("D") {
        return false
    }
    return string1 < string2
}
print(DSortedChar__)
// thirdly, we can use:
// "shorthand syntax"
let DSortedChar___ = characters.sorted {
    if $0.hasPrefix("D") {
        return true
    } else if $1.hasPrefix("D") {
        return false
    }
    return $0 < $1
}
print(DSortedChar___)
// actually less clear in this case, BUT when we only need to use the parameters once, it will be more simpler
// e.g. if we want a reverse sort
let reverseChar = characters.sorted {
    return $0 > $1
}
print(reverseChar)
// remind: in swift function, if there is only one line then we can omit the return, this also apply for closure so
let reverseChar_ = characters.sorted { return $0 > $1 }
print(reverseChar_)

// more examples
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let tOnly = team.filter{ $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

// then how to write this kind of function that can take other function as input?
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

// use closure
let arr = makeArray(size: 5) {
    Int.random(in: 1...10)
}
print(arr)

// traditional way still work
func generateNumber() -> Int {
    Int.random(in: 1...10)
}
let newArr = makeArray(size: 5, using: generateNumber)
print(newArr)

// you can also let function accecpt multiple function parameters
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}
// how to call
// have to write the external parameter name/label from the second parameter
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

// Checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let answer: [()] = luckyNumbers.filter{
    !$0.isMultiple(of: 2)
}.sorted().map{
    print("\($0) is a luck number") // when you perform an operation instead of returning values, the output will become a empty array of tuple [()], so it's pretty to add this type annotation to avoid warning
}
