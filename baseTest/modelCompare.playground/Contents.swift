//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//模式匹配
//~= 函数名
//<T:Equatable> 表示泛型T是可比较类型
func ~=<T:Equatable>(a:T, b:T) -> Bool {
    return true
}

let interval = "a"..."z"
print(interval)

class  A {
    
}
let typeA: A.Type = A.self  //A.self 取得类型本身

3+3+3+3+3
4+4+4+4*5+6
147*0.3
7*1.5
(84+44+3*7)*2.5*4

//声明可继承协议
protocol Copyable {
    func copy() -> Self //协议内方法
}

//定义一个类,并继承协议

class MyClass: Copyable {
    //类成员函数
    var num = 1
    //定义继承协议方法
    func copy() -> Self {
        let result = type(of: self).init()  //获取对应类的类型并初始化
        result.num = num
        return result   //返回对应的类
    }
    //final, 若之后有子类,则可添加final
    //required, 若之后有子类,则必须强制定义必须的init
    required init() { }
}

let object = MyClass()  //定义一个MyClass类
object.num = 100

let copyObject = object.copy()  //使用类中的拷贝方法成功创建MyClass类

class Pet {}
class Cat:Pet {}
class Dog:Pet {}

//重载函数,根据输入函数的不同匹配不同的函数
func printPet(_ pet:Pet){
    print("Pet")
}
func printPet(_ cat:Cat){
    print("Miao")
}
func printPet(_ dog:Dog){
    print("Won")
}

func printThem(_ pet:Pet, _ cat:Cat) {
    if let aCat = pet as? Cat {
        printPet(aCat)
    }else if let aDog = pet as? Dog {
        printPet(aDog)
    }
    
    printPet(cat)
}
//Dog继承了Pet
//函数输入参数为父类, 则其子类亦可作为函数的参数进行匹配?
printThem(Dog(), Cat())

class Observe {
    var date:NSData {
        //给date赋值前操作
        //赋值前新值为newValue,旧值为本身
        willSet(newValue){
            //newValue为默认参数名,可自定义
            let d = date
            print("即将从日期从 \(d) 设定至 \(newValue)")
        }
        //给date赋值后操作
        //赋值后新值为本身,旧值为oldValue
        didSet{
            //oldValue为默认参数名,可自定义
            print("已经将日期从 \(oldValue) 设定至 \(date)")
        }
    }
    init() {
        date = NSData()
    }
}

let eyes = Observe.init()
eyes.date = NSData()



