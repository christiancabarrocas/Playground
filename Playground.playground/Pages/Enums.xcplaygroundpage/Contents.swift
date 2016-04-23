//: [Previous](@previous)

//##ENUM INFO
//http://appventure.me/2015/10/17/advanced-practical-enum-examples/


//:BASIC ENUM
enum Movement {
    case Left
    case Right
    case Top
    case Bottom
}

//:ENUM WITH VALUES
//:Swift support value types for enums: Integer,String,Boolean, Floating point
enum House: String {
    case Baratheon = "Ours is the Fury"
    case Greyjoy = "We Do Not Sow"
    case Martell = "Unbowed, Unbent, Unbroken"
    case Stark = "Winter is Coming"
    case Tully = "Family, Duty, Honor"
    case Tyrell = "Growing Strong"
}

let house = House.Stark
print(house.rawValue)


//:NESTED ENUMS
enum Character {
    enum Weapon {
        case Bow
        case Sword
        case Lance
        case Dagger
    }
    enum Helmet {
        case Wooden
        case Iron
        case Diamond
    }
    case Thief
    case Warrior
    case Knight
}

let character = Character.Thief
let weapon = Character.Weapon.Bow
let helmet = Character.Helmet.Iron

//:DUPLES
enum Trade {
    case Buy(stock: String, amount: Int)
    case Sell(stock: String, amount: Int)
}

let trade = Trade.Buy(stock: "APPL", amount: 500)
if case let Trade.Buy(stock, amount) = trade {
    print("buy \(amount) of \(stock)")
}



typealias Config = (RAM: Int, CPU: String, GPU: String)

// Each of these takes a config and returns an updated config
func selectRAM(config: Config) -> Config {return (RAM: 32, CPU: config.CPU, GPU: config.GPU)}
func selectCPU(config: Config) -> Config {return (RAM: config.RAM, CPU: "3.2GHZ", GPU: config.GPU)}
func selectGPU(config: Config) -> Config {return (RAM: config.RAM, CPU: "3.2GHZ", GPU: "NVidia")}

enum Desktop {
    case Cube(Config)
    case Tower(Config)
    case Rack(Config)
}

let aTower = Desktop.Tower(selectGPU(selectCPU(selectRAM((0, "", "") as Config))))


//:MULTIPLE TYPES
enum Barcode {
    case UPCA(numberSystem: Int, manufacturer: Int, product: Int, check: Int)
    case QRCode(productCode: String)
}

//:METHODS
enum Wearable {
    enum Weight: Int {
        case Light = 1
    }
    enum Armor: Int {
        case Light = 2
    }
    case Helmet(weight: Weight, armor: Armor)
    func attributes() -> (weight: Int, armor: Int) {
        switch self {
        case .Helmet(let w, _): return (weight: w.rawValue * 2, armor: w.rawValue * 4)
        }
    }
}
let woodenHelmetProps = Wearable.Helmet(weight: .Light, armor: .Light).attributes()


//:PROPERTIES
enum Device {
    case iPad, iPhone
    var year: Int {
        switch self {
        case iPhone: return 2007
        case iPad: return 2010
        }
    }
}

//:STATIC METHODS
enum OtherDevice {
    case AppleWatch
    static func fromSlang(term: String) -> OtherDevice? {
        if term == "iWatch" {
            return .AppleWatch
        }
        return nil
    }
}
print (OtherDevice.fromSlang("iWatch"))


//:MUTATING METHODS
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()


//:ADOPTING PROTOCOLS
//:CustomStringConvertible is a protocol from Standard Library
enum Action: CustomStringConvertible {
    case Atac, Defend
    var description: String {
        switch self {
        case Atac: return "Attacking monster!"
        case Defend: return "Raising Shield!"
        }
    }
}

let action = Action.Defend

//:EXTENSIONS
enum SimpleAction {
    case Atac, Defend
}

extension SimpleAction:CustomStringConvertible {
    var description: String {
        switch self {
        case Atac: return "Attacking monster!"
        case Defend: return "Raising Shield!"
        }
    }
}

//:GENERICS
enum Either<T1, T2> {
    case Left(T1)
    case Right(T2)
}


//:RECURSIVE & INDIRECT TYPES
//:The indirect keyword tells the compiler to handle this enum case indirectly.


enum FileNode {
    case File(name: String)
    indirect case Folder(name: String, files: [FileNode])
}

//:INIT METHODS
enum NumberCategory {
    case Small
    case Medium
    case Big
    case Huge
    init(number n: Int) {
        if n < 10000 { self = .Small }
        else if n < 1000000 { self = .Medium }
        else if n < 100000000 { self = .Big }
        else { self = .Huge }
    }
}
let aNumber = NumberCategory(number: 100)

//: [Next](@next)