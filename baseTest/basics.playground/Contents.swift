//: Playground - noun: a place where people can play

import UIKit

//加强数字可读性
let num1 = 0000123.456
let num2 = 1_000_000_000

//默认为64位Int，与操作系统匹配
let numIntMax = Int.max

//类型名别名
typealias bit16 = Int16

//元组的定义
let http404Error:(Int,String) = (404,"Not Found")
print(http404Error.0)
print(http404Error.1)

//拆分的元组,用于多元素一次性赋值
let (code,error) = (404,"Not Found")
print("\(code):\(error)")
print(code,error)

//带命名的元组
let http200Status = (statusCode: 200, description: "OK")
print(http200Status.statusCode)

//nil只可以赋值给可选值
var serverResponseCode: Int? = 404
serverResponseCode = nil

//通过if guard解包，防止解析错误
var option:String?
if let result = option{
    print(result)
}

//多条件判断,需同时满足
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}


//函数后添加throws,使发生错误抛出异常,再使用do-catch调用
func canThrowAnError() throws {
    //是否要写上错误时的返回值?
}
do{
    try canThrowAnError()
}
//catch类似与switch的case,可以对抛出的异常进行判断,若不填写，则直接执行
catch {
    print(error)
    //函数调用发生错误时的返回值"error"
}

//断言调试,类似与打断点,会在编译时禁用
//assert(条件, false执行代码)
let age = 3
assert(age >= 0, "人的年龄不能小于0")
//取余运算符，返回结果的正负号只取决于被取数
let a = -9 % 4
let b = -9 % -4

//优先判断元素首，全部相同再整体考虑
(4, "apple") > (2, "zebra")
(3, "apple", "apple") < (3, "apple", "zebra")
(3, "apple", "zebra") < (3, "apple", "zebra")
(4, "dog") == (4, "dog")
(4, "dog") == (4, "apple")

//空合并运算符
var opa:Int?
opa ?? 50
opa != nil ? opa!: 50







