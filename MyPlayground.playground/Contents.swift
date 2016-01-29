//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Swift"

let constStr = str

var nextYear: Int
var bodyTemp: Float
var hasPet: Bool
var arrayOfInts: [Int]
var dictionaryOfCapitalsByCountry: [String:String]
var winningLotteryNumbers: Set<Int>
let number = 42
let fmStation = 91.1
var countingUp = ["one", "two"]
let secondElement = countingUp[1]
countingUp.count

countingUp.append("three")

let nameByParkingSpace = [13: "Alice", 27: "Bob"]

for (space, name) in nameByParkingSpace{
    let permit = "Space \(space): \(name)"
}

if let space13Assignee = nameByParkingSpace[13]{
    print("Key 13 is assigned to \(nameByParkingSpace[13]!)")
}

let space42Assignee: String? = nameByParkingSpace[42]

let emptyString = String()
emptyString.isEmpty

let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()
let defaultNumber = Int()
let defaultBool = Bool()
let number42 = 42
let meaningOfLife = String(number)
let availableRooms = Set([205, 411, 412])
let defaultFloat = Float()
let floatFromLiteral = Float(3.14)
let Pi3 = 3.14
let floatFromDouble = Float(Pi3)
let floatingPi: Float = 3.14

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

//let avgReading = (reading1! + reading2! + reading3!) / 3
if let r1 = reading1, r2 = reading2, r3=reading3{
    let avgReading = (r1 + r2 + r3) / 3
}else{
    let errorString = "Instrument reported as reading that was nil."
}


enum PieType: Int{
    case Apple = 0
    case Cherry
    case Pecan
}

let favoritePie = PieType.Apple

let name: String
switch favoritePie {
case .Apple:
    name = "Apple"
case .Cherry:
    name = "Cherry"
case .Pecan:
    name = "Pecan"
}

let pieRawValue = PieType.Pecan.rawValue
//pieRawValue is an Int with a value of 2
