//: Playground - noun: a place where people can play

import UIKit

//LinkedList 枚举类型
//Comparable 可比较协议
//Element 泛型参数
indirect enum LinkedList<Element:Comparable>{
    case empty //空
    case node(Element, LinkedList<Element>) //指针
}


let list = LinkedList.node(1, //表头
                           LinkedList.node(2,
                                           LinkedList.empty)) //表尾


//不使用实例来调用类方法
class MyClass{
    func method(number:Int) -> Int{
        return number + 1
    }
}
//实例化方法
let obj = MyClass() //实例化
let res = obj.method(number: 2)
//非实例化方法
let f = MyClass.method
let result = f(obj)












