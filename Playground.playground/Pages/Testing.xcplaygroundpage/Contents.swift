//: [Previous](@previous)

import XCTest

class Example {
    func exampleFunction() -> String {
        return "Example"
    }
}

//Stub class. Fakes a response call to a method
class StubExample:Example {
    override func exampleFunction() -> String {
        return "TestExample"
    }
}

//Mock class. Check for method calls or property set
class MockExample:Example {
    var exampleCalled = false
    override func exampleFunction() -> String {
        exampleCalled = true
        return "Testexample"
    }
}

class ExampleTestingClass {
    //Stub testing
    let example = StubExample()
    let stringReturned = example.exampleFunction()
    func testExampleFunction() {
        XCTAssertTrue(stringReturned == "TestExample")
    }
    
    //Mock testing
    let exampleTwo = MockExample()
    exampleTwo.exampleFunction()
    func testExampleFunctionIsCalled() {
        XCTAssertTrue(exampleTwo.exampleCalled)
    }
}

//: [Next](@next)
