//: Playground - noun: a place where people can play

import UIKit

//计算属性
class A {
    var number:Int{
        //获取
        get{
            return self.number
        }
        //设置
        set{
            self.number = newValue
        }
    }
}

//观察属性
class B {
    var number:Int{
        willSet{
            print("B:\(newValue)")
        }
        didSet{
            print("B:\(oldValue)")
        }
    }
    init(number:Int) {
        self.number = number
    }
}

//计算属性+观察属性,两者不可同时在一个类中定义,故只能用继承的方法来实现
class C:A {
    override var number: Int {
        willSet{
            print("C:\(newValue)")
        }
        didSet{
            print("C:\(oldValue)")
        }
    }
}






