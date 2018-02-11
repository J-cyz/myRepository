//: Playground - noun: a place where people can play

import UIKit

//自定义操作符,对特定对象进行操作

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

func + (item1:Vector2D,item2:Vector2D) -> Vector2D {
    return Vector2D(x:item1.x+item2.x, y:item1.y+item2.y)
}

let v1 = Vector2D(x: 10.0, y: 10.0)
let v2 = Vector2D(x: 25.0, y: 35.0)
let v3 = v1 + v2
print(v3)

//以上是对系统默认的存在的运算符的重载,对于系统中不存在的运算符,需要声明操作符
//操作符要定义在全局范围
precedencegroup DotProductPrecedence {  //定义一个优先级
    associativity: none     //定义结合律,当多个相同的操作符时,计算顺序
        /*
            left:从左向右结合
            none:不与其他的进行结合
        */
    
    higherThan: MultiplicationPrecedence    //设置高于何优先级
    //lowerThan、higherThan设置低于/高于优先级
    //AdditionPrecedence,加法优先级
    //MultiplicationPrecedence,乘法优先级
}
infix operator +*: DotProductPrecedence     //定义中位操作符,其余子类定义 prefix、postfix

//方法中不写修饰符(let/var),默认使用let声明
func incrementor(varible:Int) -> Int {
    return varible + 1
}

/*错误示范
 func incrementor_error(varible:Int) -> Int {
    varible += 1
    return varible
 }
 
            || equal

func incrementor(varible: let Int) -> Int {
    varible += 1
    return varible
}
*/

func incrementor_var(varible:inout Int){
    varible += 1
}

var number = 0
incrementor_var(varible: &number)
print(number)

func createIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor_v(varible: inout Int) -> () {
        varible += addNumber
    }
    return incrementor_v
}

let calculationAddTen = createIncrementor(addNumber: 10)
number = 10
calculationAddTen(&number)
print(number)

//代替名,	对于泛型无法进行重新定义名字
typealias 数字 = Int
let num:数字 = 1


/*
 ExpressibleByArrayLiteral
 ExpressibleByBooleanLiteral
 ExpressibleByDictionaryLiteral
 ExpressibleByFloatLiteral
 ExpressibleByNilLiteral
 ExpressibleByInteherLiteral
 ExpressibleByStringLiteral
 继承标准空中协议以达到自定义
 */

enum MyBool {
    case myTrue,myFalse
}

extension MyBool:ExpressibleByBooleanLiteral {  //继承Bool
    //根据传入的Bool来设置self
    init(booleanLiteral value: Bool) {
        self = value ? MyBool.myTrue : MyBool.myFalse
    }
}

let myTrueL:MyBool = true
let myFalse:MyBool = false

//extension 无法定义required初始化方法,
class Person:ExpressibleByStringLiteral {   //继承String
    let name:String
    init (name: String) {
        self.name = name
    }
    
    required convenience init(stringLiteral value: String) {
        self.init(name: value)
    }
    
    required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(name: value)
    }
    
    required convenience init(unicodeScalarLiteral value: String) {
        self.init(name: value)
    }
}

let client:Person = "littleM"

//拓展数组,使数组可以跳跃获取
extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {    //切片数组
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }
        set {
            for (index,i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}

var arr = ["a","b","c","d","e","f","g"]
var fliter_arr = arr[[0,5,6]]























