//: Playground - noun: a place where people can play

import UIKit

//where判断
let name = ["王小二","张三","李四","麻五"]
name.forEach {
    switch $0 {
    case let x where x.hasPrefix("王") :
        print("获取筛选名字:\(x)")
    default:
        print("删除人选:\($0)")
    }
}

/*
 case中的判断
 1.给传入值定义一个参数
 2.对定义的参数进行where判断
 */

let num = [8,60,80,18,32,nil] //混乱数据
let nu = num.flatMap{$0} //删除nil
let n = nu.sorted() //排序
for score in n where score >= 60{
    print(score)
}

//对序列进行带条件扩展
extension Sequence where Self.Iterator.Element:Comparable{

}

