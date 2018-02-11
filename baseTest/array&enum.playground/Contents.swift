//: Playground - noun: a place where people can play

import UIKit
//一维数组[]
var arrayDone:[String] = ["d","a","a","a","b","c","a"]
arrayDone[4...6] = ["apple","apple"] //替换用法
arrayDone.count
arrayDone[4...4] = ["banana","banana"] //类插入用法
arrayDone.count
arrayDone[4].hashValue
arrayDone[5].hashValue

//二维数组[[]]
let arrayDtwo:Array<Array<String>> = [[String]](repeating:[String](repeating: "c", count: 5),count: 5)

//数组转集合{}，
//该转换方法在输出时候会将相同的进行合并,且只能是一维数组
let all = Set(arrayDone)

//集合转数组[]
let arry = Array(all)

var numbers = [11,55,25,69,14,25,6]
let min = numbers.min()
let max = numbers.max()
var newNumbers = numbers.sorted() //快速排序，默认由小到大,不会改变原始数组的顺序
numbers = numbers.sorted(by: >)

//不连续数组与连续数组
var start = CFAbsoluteTimeGetCurrent()
let fragmentArray = Array<Int>(1...10000)
var time = CFAbsoluteTimeGetCurrent() - start
print("不连续数组创建时间:\(time)")
start = CFAbsoluteTimeGetCurrent()
fragmentArray.reduce(0, +)  //初始值为0,逐个遍历数组并相加
fragmentArray.reduce("Start: "){(acc,item) -> String in "\(acc)\(item)"
}
time = CFAbsoluteTimeGetCurrent() - start
print("不连续数组叠加时间:\(time)")

//连续数组，连续行数的创建时间与查询时间更短
start = CFAbsoluteTimeGetCurrent()
let contiguousArray = ContiguousArray<Int>(1...10000)
time = CFAbsoluteTimeGetCurrent() - start
print("连续数组创建时间:\(time)")
start = CFAbsoluteTimeGetCurrent()
contiguousArray.reduce(0, +)
time = CFAbsoluteTimeGetCurrent() - start
print("连续数组叠加时间:\(time)")

//通过set创建集合,数组[]可以有重复的数，集合{}不能有重复的数
let A = Set(["Voyager", "Serenity"])
let B = Set(["Serenity", "Nostromo", "Enterprise"])
let C = Set(["Voyager", "Serenity", "Executor"])
let union = B.union(C) // 并集
let intersection = B.intersection(C) // 交集
let difference = B.symmetricDifference(C) //补集

A.isSubset(of: C)        //是否为子集
A.isSuperset(of: C)      //是否为父集
B.isDisjoint(with: C)   //是否并无交集
A.isStrictSubset(of: C)  //是否为真子集
A.isSuperset(of: C)      //是否为真父集

var spaceships = ["A", "B", "C"]
spaceships += ["C", "D", "E"]
spaceships += ["B", "C", "F"]
//创建带统计数的集合，自动换行
let countedSet = NSCountedSet(array: spaceships)
print(countedSet)
//查找集合中某个数出现的次数
print(countedSet.count(for: "B"))
print(countedSet.count(for: "C"))

let array = [String]()
let first = array.first

if let num = array.first{
    print("数组不为空")
}
else {
    print("数组不为空")
}










struct People {
    var breed: String
    var age: Int
}

let poppy = People(breed: "Poodle", age: 5)
let rusty = People(breed: "Labrador", age: 2)
let rover = People(breed: "Corgi", age: 11)
var peoples = [poppy, rusty, rover]

let newPeoples = People(breed: "Dret", age: 21)
//两种向数组添加的新元素的办法
peoples.append(newPeoples)
peoples += [newPeoples]

//删除数组最后一个元素
for _ in 0..<peoples.count + 1{
    var delete = peoples.popLast() //popLast() -> Base._Element? 删除的数组中若为nil不报错,故得到的返回值也是一个可选类型
//    var delete = peoples.removeLast() //removeLast() -> Self.Iterator.Element 删除的数组若为nil则报错
}
peoples.insert(People(breed: "dedala", age: 12), at: 0)
//删除指定位置元素
peoples.remove(at: 0)












//枚举的两种写法
enum ColorOne:String {
    case White = "白色"
    case Black = "黑色"
    case Pink = "粉色"
    case Red = "红色"
}

var white = ColorOne(rawValue: "白色")

enum ColorTwo {
    case White,Black,Pink,Red
}

//对于类型为Int的枚举，未对枚举定义值，则其值为前一个枚举值加1，首个枚举值默认为0
//rawValue是取得枚举类型的值，否则则是直接定义一个枚举变量
enum ColorThree:Int {
    case White,Black,Pink=3,Red
}
var t = ColorThree.Black //定义枚举类型变量
var tt = ColorThree.Pink.rawValue //定义Int类型变量
let ttt  = ColorThree(rawValue: 3) //通过枚举类型的值来获取枚举类型
print(tt)

//String类型的枚举变量，其值默认为其名字
enum PaperSize: String {
    case A4, A5, Letter, Legal
}
let selectedSize = PaperSize.A4
print(selectedSize.rawValue)
print(selectedSize == PaperSize(rawValue: selectedSize.rawValue))

//判断集合中是否存在
if all.contains("a"){
    
}









