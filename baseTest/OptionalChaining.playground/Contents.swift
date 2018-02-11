//: Playground - noun: a place where people can play

class Person {
    var residence: Residence?   //可选链
}
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?   //可选链
}
class Room {
    let name: String
    init(name: String) { self.name = name }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
let john = Person()
//john.residence = nil,调用失败,后面终止执行
john.residence?.address = createAddress()

let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse     //实例引用
john.residence?.address = createAddress()
print("\(john.residence?.address?.street)")

class Toy {
    let name: String
    init(name: String){
        self.name = name
    }
}

class Pet {
    var toy: Toy?
}

class Child {
    var pet:Pet?
}

let xiaoMing = Child()

//此处虽然name不是可选值,但由于在获取打name前有可能为nil,故toyName为String?
let toyName = xiaoMing.pet?.toy?.name

// Optional Binding 排除nil的情况
if let toyName2 = xiaoMing.pet?.toy?.name {
    //此时toyName2为String
}








