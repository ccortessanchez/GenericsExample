//: Playground - noun: a place where people can play

import Cocoa

func addInts(x: Int, y: Int) -> Int {
    return x + y
}

func addDoubles(x: Double, y: Double) -> Double {
    return x + y
}

let intSum = addInts(x: 1, y: 2)
let doubleSum = addDoubles(x: 1.0, y: 2.0)

 
let numbers = [1, 2, 3]
let firstNumber = numbers[0]

var numbersAgain: Array<Int> = []
numbersAgain.append(1)
numbersAgain.append(2)
numbersAgain.append(3)
let firstNumberAgain = numbersAgain[0]

let countryCodes = ["Arendelle": "AR", "Genovia": "GN", "Freedonia": "FD"]
let countryCode = countryCodes["Freedonia"]

let optionalName = Optional<String>.some("Princess Moana")
if let name = optionalName {}

struct Queue<Element: Equatable> {
    fileprivate var elements: [Element] = []
    
    mutating func enqueue(newElement: Element) {
        elements.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else { return nil }
        return elements.remove(at: 0)
    }
}
var q = Queue<Int>()
q.enqueue(newElement: 4)
q.enqueue(newElement: 2)
q.dequeue()
q.dequeue()

func pairs<Key, Value>(from dictionary: [Key:Value]) -> [(Key, Value)] {
    return Array(dictionary)
}
let somePairs = pairs(from: ["minimum": 199, "maximum": 299])
let morePairs = pairs(from: [1: "Swift", 2: "Generics", 3: "Rule"])

func mid<T: Comparable>(array: [T]) -> T? {
    guard !array.isEmpty else { return nil }
    return array.sorted()[(array.count - 1)/2]
}

mid(array: [3, 5, 1, 2, 4])

protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Summable {}
extension Double: Summable {}
extension String: Summable {}

func add<T: Summable>(x: T, y: T) -> T {
    return x + y
}

let addIntSum = add(x: 1, y: 2)
let addDoubleSum = add(x: 1.0, y: 2.0)
let addString = add(x: "Generics", y: " are awesome!!!")

extension Queue {
    func peek() -> Element? {
        return elements.first
    }
}

q.enqueue(newElement: 5)
q.enqueue(newElement: 3)
q.peek()

extension Queue {
    func isHomogeneous() -> Bool {
        guard let first = elements.first else { return true }
        return !elements.contains { $0 != first }
    }
}

var h = Queue<Int>()
h.enqueue(newElement: 4)
h.enqueue(newElement: 4)
h.isHomogeneous()
h.enqueue(newElement: 2)
h.isHomogeneous()

class Box<T> {
    //Just a plain old box
}

class Gift<T>: Box<T> {
    // By default, a gift box is wrapped with plain white paper
    func wrap() {
        print("Wrap with a plain white paper.")
    }
}

class Rose {
    // Flower of choice for fairytale dramas
}

class ValentinesBox: Gift<Rose> {
    // A rose for your valentine
    override func wrap() {
        print("Wrap with ♥♥♥ paper.")
    }
}

class Shoe {
    // Just regular footwear
}

class GlassSlipper: Shoe {
    // A single shoe, destined for a princess
}

class ShoeBox: Box<Shoe> {
    // A box that can contain shoes
}

let box = Box<Rose>() // A regular box that can contain a rose
let gift = Gift<Rose>() // A gift box that can contain a rose
let shoeBox = ShoeBox()
let valentines = ValentinesBox()

gift.wrap()
valentines.wrap()

enum Result<Value> {
    case success(Value), failure(Error)
}

enum MathError: Error {
    case divisionByZero
}

func divide(_ x: Int, by y: Int) -> Result<Int> {
    guard y != 0 else {
        return .failure(MathError.divisionByZero)
    }
    return .success(x/y)
}

let result1 = divide(42, by: 2)
let result2 = divide(42, by: 0)
