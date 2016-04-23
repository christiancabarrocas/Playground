//: [Previous](@previous)

import UIKit

var username: String?
var password: String?

switch (username, password) {
case let (username?, password?):
    print("Success!")
case let (username?, nil):
    print("Password is missing")
case let (nil, password?):
    print("Username is missing")
case (nil, nil):
    print("Both username and password are missing")
}

//: [Next](@next)