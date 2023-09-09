import Cocoa

// for look
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

// range
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}
// random tip
print() // print a new line

// ... --> []
// ..< --> [)

for i in 1..<5 {
    print(i)
}

// when you don't use the loop variable, use underscore
var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

// while loop
var countdown = 10
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("Blast off!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
print("Critical hit!")

// continue and break
// continue: skip the current loop iteration
// break: exit the entire loop
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue // skip
    }

    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break // exit
        }
    }
}
print(multiples)

// Checkpoint 3
// fizz buzz
for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    }
    else if i.isMultiple(of: 3) {
        print("Fizz")
    }
    else if i.isMultiple(of: 5) {
        print("Buzz")
    }
    else {
        print(i)
    }
}
