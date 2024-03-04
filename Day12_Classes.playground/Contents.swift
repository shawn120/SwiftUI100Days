import Cocoa

// class and struct
// Common:
// You get to create and name them.
// You can add properties and methods, including property observers and access control.
// You can create custom initializers to configure new instances however you want.

// Swift build-in type is built in struct: String, Int, Double, Array

// Difference:
// You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
// Because of that first point, Swift won’t automatically generate a memberwise (default) initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties (in this way, the properties will stay the default value).
// When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
// When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
// Even if you make a class constant, you can still change its properties as long as they are variables.

// create class: just like "struct", but swith the keyword into "class"
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}
// inherit from another class
// adding "final" can make this class cannot be inherited by other
final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I work \(hours) hours a day as a developer.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}
// this two class will inherit the "hours" property


let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()
robert.printSummary()

// initializers
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric) // super indicate its parent class
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// copy
class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Shawn"
print(user1.username) // Shawn
print(user2.username) // Shawn
// Not a bug, class instance copies will point at the same data
// Not for struct, if you go change the class keyword into struct, see the difference

// if you need deep copy, you need to implement it by youself
class User_ {
    var username = "Anonymous"
    
    func copy() -> User_ {
        let user = User_()
        user.username = username
        return user
    }
}
var user1_ = User_()
var user2_ = user1_.copy()
user2_.username = "Shawn"
print(user1_.username) // Anonymous
print(user2_.username) // Shawn

// deinitializer
class Product {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Product \(id) is made")
    }
    
    deinit {   // No func keyword just like init, also never put parentheses because deinit never take parameters
        print("Product \(id) is delivered")
    }
}

// any instance created in a loop will be automaticlly destroyed after this loop, that is when the deinit will be called
for i in 1...3 {
    let one = Product(id: i)
    print("Product \(one.id) is shipping")
}

// but if you store them away, even tho the one created in the loop is destroyed, since there is another copy (reference) somewhere else, the deinit won't be called
print()
var log = [Product]()

for i in 1...3 {
    let one = Product(id: i)
    print("Product \(one.id) is shipping")
    log.append(one)
}
print()
// then when you clear the array
log.removeAll()


class User1 {
    var name = "Paul"
}

let user = User1()
user.name = "Shawn"
print(user.name) // the constant user is changed??? Chill, its because the user.name property is a var, we only changed this user.name, not the user instance

// (reminder: this is different with struct, if you create a constant struct instance, you cannot change anything from its properties even tho they are variable)

// if you try to change the user instance
// user = User() // will throw error

// Four combinations
// Constant class______Constant property
//                 \/
//                 /\
// Variable class_/__\_Variable property

// Class don't need/allow "mutating" keyword for functions that change their data

// Checkpoint 7
print("****** ****** Checkpoint 7 ****** ******")
class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("bark bark!")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("bark bark! I am a Corgi")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("bark bark! I am a Poodle")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow~")
    }
    
    func pet() {            // add a pet function to check the isTame property
        if isTame{
            print("Meow~~~~~~~~~~~~~~~~~~")
        } else {
            print("YOU JUST DIED")
        }
    }
}

final class Persian: Cat {
    override func speak() {
        print("Meow~ I am a Persian")
    }
}

final class Lion: Cat {
    override func speak() {
        print("Meow~ I am a Lion, why did I just meow???")
    }
    
    init(legs: Int) {
        super.init(legs: legs, isTame: false)     // change the init for lion to make it always untamed
    }
}

// test
// create an animal
let animal = Animal(legs: 4)
print(animal.legs)

// create a dog
let dog = Dog(legs: 4)
dog.speak()

// create a corgi and poodle
let corgi = Corgi(legs: 4)
corgi.speak()
let poodle = Poodle(legs: 4)
poodle.speak()

// create a cat
let cat = Cat(legs: 4, isTame: true)
cat.speak()
cat.pet()

// create a persian
let persian = Persian(legs: 4, isTame: true)
persian.speak()
persian.pet()

// added an extra feature to make lion always untame and cannot be changed
// create a lion
let lion = Lion(legs: 4) // no need to mention isTame
lion.speak()
lion.pet()

print(lion.isTame)
// lion.isTame = true // cannot change it
