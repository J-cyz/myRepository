//: Playground - noun: a place where people can play

import UIKit

enum CompassPoint {
    case north
    case south
    case east
    case west
}
var direction:CompassPoint = .north

//用于初始化配置
switch direction {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = Barcode.qrCode("ABCDEFGHIJKLMNOP")

// 使用switch语句匹配
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

switch productBarcode {
case let  .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}


//Raw Values = String、Int、Double、Float、Character
//默认原始值,首个元素原始值为0
enum Planet: Int {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
var array1 = [Planet]()
array1 = [.mercury, .venus, .earth, .mars, .jupiter, .saturn, .uranus, .neptune]
for index in array1 {
    print(index.rawValue)
}

//原始值是前面情况的原始值加1
enum Planets:Int {
    case mercury = 3, venus, earth, mars, jupiter, saturn, uranus, neptune
}
var array2 = [Planets]()
array2 = [.mercury, .venus, .earth, .mars, .jupiter, .saturn, .uranus, .neptune]
for index in array2 {
    print(index.rawValue)
}


//递归枚举
//enum ArithmeticExpression{
//    case number(Int)
//    indirect case addition(ArithmeticExpression, ArithmeticExpression)
//    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}
////func addition(num1:ArithmeticExpression,num2:ArithmeticExpression) -> Int{
////    return num1.number+num2.number
////}
////
////func multiplication(num1:ArithmeticExpression,num2:ArithmeticExpression) -> Int{
////    return num1.number*num2.number
////}
//
//let five = ArithmeticExpression.number(5)
//let four = ArithmeticExpression.number(4)









