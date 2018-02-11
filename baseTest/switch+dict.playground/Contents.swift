//: Playground - noun: a place where people can play

import UIKit
let dict = ["a":1, "b":2, "c":3, "d":4]
//字典转为数组
let keys = [String](dict.keys)
let values = [Int](dict.values)

//字母Character
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a":
    print("The letter a")
case "A":
    print("The letter A")
default:
    print("Not the letter A/a")
}

//switch的值绑定
let point = (2,0,0)
switch point {
case (let x,0,0):
    print("位于x轴上的\(x)处") //将取到的点的x值赋值
case (0, let y, 0):
    print("位于y轴上的\(y)处") //将取到的点的y值赋值
case (0, 0, let z):
    print("位于z轴上的\(z)处") //将取到的点的z值赋值
default:
    print("并不在轴上")
}


//fallthrough-switch执行完成后继续执行下一个case
switch 0{
case 0:
    print("0")
    fallthrough
case 1:
    print("1")
    fallthrough
default:
    print("default")
}

//switch-添加标签,标签添加在循环体开始位置
let finalSquare = 25

var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02

board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0

var diceRoll = 0

gameLoop: while square != finalSquare {

    diceRoll += 1 //1、2、3、4、5、6、7、2、3、4、5、6、7、1、2、3、4、5、6

    if diceRoll == 7 { diceRoll = 1 }

    diceLoop: switch square + diceRoll {
    case finalSquare:

        // diceRoll will move us to the final square, so the game is over

        print("finalSquare:\(finalSquare)")

        break gameLoop

    case let newSquare where newSquare > finalSquare: //newSquare = square + diceRoll

        // diceRoll will move us beyond the final square, so roll again

        print("final:\(newSquare)")

        continue gameLoop

    default:

        // this is a valid move, so find out its effect

        square += diceRoll

        square += board[square]

        print("default:\(square)")
    }

}

print("Game over!")

//函数参数为可变参数
func a(numbers: Double...){
    for _ in numbers{

    }
}

//函数参数使用引用传递
func swap(_ a: inout Int, _ b: inout Int){
    let temp = a
    a = b
    b = temp
}

//默认情况函数在整个类中作用,嵌套函数则默认对外隐藏
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    //嵌套函数1
    func stepForward(input: Int) -> Int { return input + 1 }
    //嵌套函数2
    func stepBackward(input: Int) -> Int { return input - 1 }
    //返回对应值
    return backward ? stepBackward : stepForward
}

//枚举类型为方法
indirect enum ArithmeticExpression {
    case number(Int) //数值
    case addition(ArithmeticExpression, ArithmeticExpression) //加法
    case multiplication(ArithmeticExpression, ArithmeticExpression) //乘法
}
//根据传入的不同枚举类型,返回不同的值
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

//定义一个新的类或结构体 首字母 大写

// === 用于判断两个类实例是否引用的相同的类

//struct的成员参数是否可变

struct Strt {
    var vary: Int
    let constant: Int
}
var strt = Strt(vary: 5, constant: 10)
strt.vary = 0
//strt.constant = 5
//实例化的结构体为变量时,则根据结构体成员参数的属性来判断是否可以赋值,若实例化的结构体为常量,则一律不能赋值

//使用懒加载必须是变量,对于常量,必须在初始化时既有值,而懒加载是在使用时才初始化













