
import UIKit
import Foundation


func isPrime(number: Int) -> Bool {
    let squareroot = Int(sqrt(Double(number)))
    for var i = 2; i <= squareroot; i += 1 {
        if (number % i) == 0 {
            return false
        }
    }
    return true
}


//ARRAY METHODS
let numbers = [1, 52, 4, 90, 17, 42, 72, 101, 55, 3]
let strings = ["Test","Cost","Tweak","Half","Trigonometry"]


//SORT
numbers.sort { (lhs, rhs) -> Bool in
    return lhs < rhs
}

numbers.filter{$0 % 2 == 0}

numbers.sort(>)
strings.sort(<)



numbers.reverse()


//REDUCE
numbers.reduce(0, combine: +)
numbers.reduce(0, combine: +) / numbers.count


//FILTER
numbers.filter(isPrime)

//MAP
numbers.map{(num:Int) in
    num+200
}


//CHAINING
func multi(num:Int) -> Int {
    return num*num
}


let array = [13,3,4,1,230,68,150]
let ordered = array.sort({$0 > $1})

numbers.map(multi).sort(<)
numbers.map(multi).sort(<).filter(isPrime)
numbers.sort(<).filter(isPrime)
numbers.sort(<).filter(isPrime).map(multi)


//CUSTOM OBJECTS
struct Person {
    var name:String!
    var userName:String!
    var age:Int!
    
    init(name:String,userName:String,age:Int) {
        self.name = name
        self.userName = userName
        self.age = age
    }
}

let pedro = Person(name: "Pedro", userName: "Pedrito", age: 27)
let manolo = Person(name: "Manolo", userName: "Faro", age: 23)
let alberto = Person(name: "Alberto", userName: "Torrente", age: 21)
let jose = Person(name: "Jose", userName: "Pepe", age: 45)

let people = [pedro,manolo,alberto,jose]

people.filter { (person) -> Bool in
    return person.age < 25
}
//same as
people.filter {$0.age < 25}


people.sort {(person1,person2) -> Bool in
    return person1.name < person2.name
}
//same as
func sortbyName(person1:Person,person2:Person) -> Bool {
    return person1.name < person2.name
}

people.sort(sortbyName)

people.sort{$0.name < $1.name}

//: [Next](@next)
