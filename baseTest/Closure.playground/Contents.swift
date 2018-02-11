//: Playground - noun: a place where people can play

import UIKit

//Sorted Methods

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 < s2
}
var reverseNames = names.sorted(by: backward)

reverseNames = names.sorted(by: { (s1:String, s2:String) -> Bool in
    return s1 > s2
})

reverseNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})      //Inferring Type From Context

reverseNames = names.sorted(by: { s1, s2 in s1 > s2 })  //Implicit Returns from Single-Expression Closures

reverseNames = names.sorted(by: { $0 < $1 })    //Shorthand Argument Names

reverseNames = names.sorted() {$0 < $1}   //Trailing Closures

reverseNames = names.sorted(by: >)      //Operator Methods


///Map Methods
//map,对于多数组嵌套,返回结果也为多数组嵌套格式,保留nil
//flatmap,先执行map操作，再将得到结果的值单独合成一个数组,删除nil
//重复的值依旧会添加进数组

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

// 3:00~3.30 - 4:00~4:30
let strings = numbers.map { (number) -> String in   //number != out-in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

let biArr = [[1,2,3,nil],[1,5,4]]
let mapResult = biArr.map{$0}
let flattenResult = biArr.flatMap{$0}
mapResult
flattenResult

//NSDate(time) -> String
let date: NSDate? = NSDate()    //获取当前时间
let formatter = DateFormatter()
formatter.dateFormat = "YYYY-MM-dd"
var formatted: String? = nil
if let date = date {
    formatted = formatter.string(from: date as Date)
}

//对于处理Optional值,为了减少判断,直接使用map处理,使得代码更加简短
let date2: NSDate? = NSDate()
let formatter2 = DateFormatter()
formatter2.dateFormat = "YYYY-MM-dd"
let formatted2 = date2.map(formatter2.string)    //map可以作用于optional对象


// Capturing Values
/*
    调用该方法时,同时创建对应的runningTotal
    runningTotal的值不会在调用方法执行完后消失
    两个不同函数对应的runningTotal不同incrementByTen != incrementByFive
*/
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0            //内部变量,不随函数销毁
    func incrementer() -> Int {     //方法参数
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

var total = incrementByTen()
total = incrementByTen()

let incrementByFive = makeIncrementer(forIncrement: 5)
total = incrementByFive()




//Escaping Closures

var completionHandlers: [() -> Void] = []
//completionHandler: () -> Void 闭包参数,函数类型,方法返回后调用,逃逸
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)


//Autoclosures

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

//闭包方法作为参数传入,此时不执行
let customerProvider =  {customersInLine.remove(at: 0)}
print("Now serving \(customerProvider())!")

func serve1(customer customerProvider:  () -> String) {
    print("Now serving \(customerProvider())!")
}
serve1(customer: { customersInLine.remove(at: 0) })     //手动闭包

func serve2(_ customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
//自动闭包,会自动对语句进行闭包,不需要添加{}
serve2(customersInLine.remove(at: 0))








