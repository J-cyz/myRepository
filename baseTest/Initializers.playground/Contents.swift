//: Playground - noun: a place where people can play

import UIKit


struct Celsius {    //多个初始化器,根据参数匹配对应的初始化器
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
//初始化必须使用标签
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

struct gaxly {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {   //参数标签用_代替,则初始化时可不使用标签
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = gaxly(37.0)


class SurveyQuestion {
    let text: String    //常量属性,只可在init中赋值
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.response     //初始化时为nil
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

class ShoppingListItem {    //结构和类若每个值都有初始值,则提供默认初始化器
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
item = ShoppingListItem()

struct Size {   //结构体会自动获得逐个成员初始化器,类不会生成逐个成员初始化器
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {       //值类型的初始化
    var origin = Point()
    var size = Size()
    init() {}   //默认初始化
    init(origin: Point, size: Size) {   //逐个成员初始化
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {   //自定义,引用逐个成员初始化
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)    //值类型初始化器代理,引用自身的初始化器self.init
    }
}

var basicRect = Rect()
basicRect = Rect(origin: Point(), size: Size())
basicRect = Rect(center: Point(), size: Size())

/*类的初始化器
    init : 指定初始化器必须纵向代理
    convenience init : 便利初始化器必须横向代理
*/





class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}       //自动生成默认初始化器

class Bicycle: Vehicle {
    override init() {
        super.init()    //numberOfWhells在此处初始化
        numberOfWheels = 2      //其父类必须是变量
    }
}


/*
    Caution：
    1:
        使用super.init前,需对新添属性初始化
    2:
        需要调用父类初始化器后,才可对父类属性进行赋值,否则属性被父类初始化器重写
    3：
        便利初始化器在给属性赋值前,先调用指定初始化器,否则属性被指定初始化器重写
    4：
        在属性并未全部初始化完成前,无法调用任何实例方法，以及任何实例属性的值
*/

class Grandpa{
    var grandpaMoney:Float
    init(grandpaMoney:Float){
        self.grandpaMoney = grandpaMoney
    }
    func grandpaExpense(){
        grandpaMoney -= 1
    }
}

class Dad:Grandpa{
    var dadMoney:Float
    init(dadMoney:Float, grandpaMoney:Float){       //指定初始化器
//        super.init()                           1️⃣❌
        self.dadMoney = dadMoney
        super.init(grandpaMoney:grandpaMoney)  //1️⃣⭕️  父类初始化器
    }
    convenience init(dadMoney:Float){   //遍利初始化器
        self.init(dadMoney:dadMoney, grandpaMoney:1000)
    }
    func dadExpense(){
        dadMoney -= 1
    }
}

class Son:Dad {
    var sonMoney:Float
    
    init(sonMoney:Float, dadMoney:Float) {
        self.sonMoney = sonMoney
        super.init(dadMoney: dadMoney, grandpaMoney: 1000)
    }
    
    init(sonMoney:Float, dadMoney:Float, grandpaMoney:Float){
        self.sonMoney = sonMoney
//        self.dadMoney = 0    2️⃣❌
//        dadExpense()         4️⃣❌
        super.init(dadMoney:dadMoney, grandpaMoney:grandpaMoney)
        dadExpense()         //4️⃣⭕️
        self.dadMoney = 0    //2️⃣⭕️
    }
    func sonExpense(){
        sonMoney -= 1
    }
    convenience init(sonMoney:Float) {
//        self.sonMoney = 10   3️⃣❌
        self.init(sonMoney: 10, dadMoney: 100, grandpaMoney: 1000)
        self.sonMoney = sonMoney   //3️⃣⭕️
    }
}

/*
 rule
 1:
    子类没有定义初始化器,但子类设定的属性都有默认值,则自动继承所有父类的指定初始化器
 2:
    子类实现所有父类的指定初始化器,则自动继承父类的所有便利初始化器
*/

class Generation:Son {
    var gold = 0.0
}

var man = Generation.init(sonMoney:10)

//初始化优先顺序 子类convenience > 子类Designated > 父类Designated

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    //便利初始化器的参数名与父类的相同,故需要使用override
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

struct Animal {
    let species: String
    init?(species: String) {        //对于有可能报错的初始化加'?'
        if species.isEmpty { return nil }   //只有错误时用return nil
        self.species = species
    }
}

let horn = Animal.init(species: "horn")
let dog = Animal(species: "")


class SomeClass {   //required 代表其子类必须重写该初始化,且无需override
    required init() {
        
    }
}
class SomeSubclass: SomeClass {    //与父类对应必须写 required
    required init() {
    
    }
}

struct Chessboard {     //使用闭包进行初始化
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()     //此处必须在闭包后加(),否则则是将整个闭包传给实例属性
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()        //执行闭包,使用闭包结果初始化
                    print(board)















