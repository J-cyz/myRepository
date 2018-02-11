//: Playground - noun: a place where people can play


// Automatic Reference Counting 自动引用计数

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "johnny")     //创建一个Person类实例
reference2 = reference1                 //强引用+1 = 2
reference3 = reference1                 //强引用+1 = 3

reference3 = nil        //强引用-1 = 2
reference2 = nil        //强引用-1 = 1
reference1 = nil        //强引用-1 = 0,此时ARC释放


//强引用循环
class People {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: People?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: People? = People(name: "John Appleseed")
var unit4A: Apartment? = Apartment(unit: "4A")
john!.apartment = unit4A
unit4A!.tenant = john       //两者相互引用

john = nil      //ARC释放失败,此时正在强引用unit4A
unit4A = nil    //ARC释放失败,此时正在强引用john



//弱引用 (Weak References) 当弱引用引用的实例被释放之后，ARC会自动把弱引用设置为nil,适用于引用的实例比自身实例生命周期短的
class AnotherPeople {
    let name: String
    init(name: String) { self.name = name }
    var weakApartment: WeakApartment?
    deinit { print("\(name) is being deinitialized") }
}

class WeakApartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: AnotherPeople?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var johnny: AnotherPeople? = AnotherPeople(name: "Johnny")
var unitWeak4A: WeakApartment? = WeakApartment(unit: "Weak4A")
johnny!.weakApartment = unitWeak4A
unitWeak4A!.tenant = johnny

print(unitWeak4A?.tenant)
johnny = nil        //unitWeak4A对johnny的引用是弱引用,johnny释放成功
print(unitWeak4A?.tenant)
unitWeak4A = nil    //johny对unitWeak4A的引用是强引用,unitWeak4A释放失败,若johnny已经释放,对unitWeak4A的引用为0,可释放


//无主引用 (Unowned References)
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}
var Chen: Customer? = Customer(name: "Chen Appleseed")
Chen!.card = CreditCard(number: 1234_5678_9012_3456, customer: Chen!)

Chen = nil

class Country {
    let name: String
    var capitalCity: City!      //隐式解包,只有当Country初始化完成后,City才可以引用,添加隐式解包,使其带有默认值nil
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)       //调用City初始化器
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var China = Country(name: "China", capitalName: "Beijing")

//闭包的强引用循环 (Strong Reference Cycles for Closures)
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {       //闭包引用
//        [unowned self] in     //⭕️把捕获的self作为无主引用
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var paragraph: HTMLElement? = HTMLElement(name: "Html", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil //ARC释放失败,强引用循环,若使用闭包无主引用,则释放成功


/*注意:
    1.引用对象生命周期大于原对象,则使用unowned
    2.引用对象生命周期小于原对象,则使用weak
    3.引用对象从不变成nil,则使用unowned
*/








