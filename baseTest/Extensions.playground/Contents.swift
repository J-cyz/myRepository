


extension Double {      //只可添加计算属性,不可添加存储属性和属性观察者
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

// extension ,可添加便利初始化器,不可添加指定、反初始化器????

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {   //指定初始化器????
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)    //调用逐一成员初始化器
    }
}

extension Int {
    func repetitions(_ task: () -> Void) {  //函数作为参数
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions ({print("Hello!")})   //闭包

5.repetitions {print("world!")}     //尾随闭包

extension Int {
    mutating func square() {    //该函数会改变自身,添加mutating
        self = self * self
    }
}

var someInt = 2
someInt.square()


extension Int {     //取对应位数的数字
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

/*
self                1563
digitIndex          4
decimalBase         *10 10
                    *10 100
                    *10 1000

self/decimalBase    1563/1000 = 1
*/

//Int = struct

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {    //实例计算属性
        switch self {   //self = Int
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")     //terminator,结束符号
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])


protocol motherShip{
    //定义时函数
    func methodA() -> String
}
extension motherShip{
    //重写定义时函数
    func methodA() -> String {
        return "im function of motherShip"
    }
    //拓展时函数
    func methodB() -> String {
        return "im extension function of motherShip"
    }
}

//定义新结构体
struct No_1:motherShip{
    func methodA() -> String {
        return "方法改装A"
    }
    func methodB() -> String {
        return "方法改装B"
    }
}

let m1 = No_1()
m1.methodA()
m1.methodB()
let m2 = m1 as motherShip //转换
m2.methodA()
m2.methodB()










