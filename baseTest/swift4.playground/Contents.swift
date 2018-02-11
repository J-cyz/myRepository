//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let dic = ["When":"a","you":"b","write":"c","a":"d"]
let filter = dic.filter { (key,value) -> Bool in
    value == "b"
}

var numbers = [0,1,2,3,4,5,6,7,8]
//swap(&numbers[1], &numbers[8])

var titles:Set<String> = []
var titless = [String]()
titles.insert("热门")
titles.insert("奢华")

//插入阶段
titless.append("热门")
titless.append("奢华")
let st = "冷门"
if !titless.contains(st){
    titless.append(st)
}

let t = "热门,奢华"
let array : Array = t.components(separatedBy: ",")

//分割阶段
var groups = [String]()
let giftsgroups = ["热门","热门,奢华","专属","冷门"]
for info in giftsgroups{
    let array = info.components(separatedBy: ",")
    for one in array{
        if !groups.contains(one){
            groups.append(one)
        }
    }
}
print(groups)

struct model {
    var level:Int
    init(_ level:Int){
        self.level = level
    }
}

let temps = [model]()
var lists = temps.sorted(by: { ($0 as AnyObject).level > $1.level }).first
print(lists)


let window = UIApplication.shared.keyWindow





