

//定义协议,遵循协议的对象,必须存在协议定义的属性(名字、类型)及读写性
protocol Protocol { //协议属性必须是变量
    var property1: Int { get}   //可读 - 继承的对象属性可以为可读可写或可读
    var property2: Int { get set }  //可读可写 - 遵循对象属性只能为可读可写,不可为可读
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {     //遵循协议FullyNamed
    var fullName: String    //协议定义只读,但继承的对象为可读可写
}
let john = Person(fullName: "John Appleseed")       //逐一成员初始化器

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {      //遵循协议属性,计算属性
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName
//fullName = USS Enterprise

protocol RandomNumberGenerator {    //协议方法
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {      //继承协议类
    var lastRandom:Double = 42.0
    let m:Double = 139968.0
    let a:Double = 3877.0
    let c:Double = 29573.0
    func random() -> Double {
        //FloatingPoint.truncatingRemainder 用于Double类型,浮点型取余
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
   42.0 * 3887.0 + 29573.0
  (42.0 * 3887.0 + 29573.0) / 139968
(((42.0 * 3887.0 + 29573.0) / 139968)-1) * 139968   //精度丢失
// Prints "Here's a random number: 0.37464991998171"

print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"

protocol Togglable {
    mutating func toggle()  //改变遵循协议对象的实例
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {  //self = OnOffSwitch
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    var parameter:Int
    required init(someParameter: Int) {     //required确保继承该类的类,同意遵循协议
        parameter = someParameter
    }
}


protocol AnotherProtocol {
    init()
}

class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}

class SomeSubClass: SomeSuperClass, AnotherProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {      //子类重新父类初始化器->override,匹配协议初始化器->required
        // initializer implementation goes here
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1      //row:42
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}






class Mothership:MothershipDelegate{
    struct battleplane {
        let attch:Int
        let heath:Int
        let defend:Int
        init(attch:Int,heath:Int,defend:Int) {
            self.attch = attch
            self.heath = heath
            self.defend = defend
        }
    }
    
    var hosts:[battleplane] = []
    var wingmans:[battleplane] = []
    
    //循环引用,内存泄露
    func openFactory() {
        let factory = Factory() //Mothership强引用Factory
        factory.delegate = self //factory强引用Mothership
    }
    
    func createHost(){
        let host = battleplane(attch: 10, heath: 100, defend: 20)
        hosts.append(host)
    }
    func createWingman() {
        let wingman = battleplane(attch: 5, heath: 50, defend: 30)
        wingmans.append(wingman)
    }
    
}

//protocol存在循环引用
protocol MothershipDelegate{
    func createHost()
    func createWingman()
}

class Factory{
    var delegate:MothershipDelegate?
}



