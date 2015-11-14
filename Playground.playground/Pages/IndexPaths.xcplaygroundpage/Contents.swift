import UIKit

func doStuff () {
    
}

let indexPath = NSIndexPath(forRow: 0, inSection: 0)

switch (indexPath.section, indexPath.row) {
    case (0,0):
        doStuff()
    case (0,1):
        doStuff()
    case (1,0):
        doStuff()
    case (1,1):
        doStuff()
    default:
        doStuff()
}

func validate (section:Int) -> Bool {
    return true
}

switch (indexPath.section, indexPath.row) {
    case (0,let row):
        doStuff()//executed for any section 0 and row
    case (let section,0):
        doStuff()//executed for the first row of all sections
    case (let section,0) where section % 2 == 1:
        doStuff()//executed for the first rows of all odd sections
    case (let section,let row) where validate(section):
        doStuff()//executed when validate return true
    default:
        doStuff()
}