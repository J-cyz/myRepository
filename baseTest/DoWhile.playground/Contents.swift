//: Playground - noun: a place where people can play

import UIKit

//do-while 变更为 repeat-while
var num = 10
repeat {
    num -= 1
    print(num)
} while num > 0

var number:Int = 0
//字符串转数字
Scanner(string: "12345678").scanInt(&number)
print(number)


let web = UIWebView()
web.scrollView.showsVerticalScrollIndicator = false

//接收可变参数的函数,[Int] == [Int...]
func sum(input:[Int]) -> Int {
    return input.reduce(0) {(Result, newNum) -> Int in
        return Result + newNum
    }
}

let result = sum(input: [1,2,3,4,5])

extension Int {
    init?(string:String){    //对于初始化返回结果可能为nil的,在init后加?
        return nil
    }
}
let t = Int("水电费")

/* 多类型和容器
    数组:Array<Element>
    字典:Dictionary<Key:Hashable, Value>
    集合:Set<Element>
*/

let s:Set<Int> = [1,1,1,2,3,4,5,6]
print(s)

200*1024/700











