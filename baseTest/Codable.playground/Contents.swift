//: Playground - noun: a place where people can play

import UIKit

let str = "😈❌👹⏹"
let count = Float(str)

//判断defer的执行顺序
func hel(){
    defer{
        print("结束")
    }
    print("开始")
}
hel()

//String、NSString 值类型? 引用类型?
let nstr = str as NSString
str.count
nstr.length

//定义为String
let jsonString = """
{
"name": "小明",
"age": 12,
"weight": 43.2,
"space": ""
}
"""

struct StudentA: Codable {
    var name:String
    var age:Int
    var weight:Float
}

let xiaoming = try JSONDecoder().decode(StudentA.self, from: jsonString.data(using: .utf8)!)

//定义为Data
//Encodable-可编译 Decodable-可解码
struct studentB:Codable { //Codable包含Encodable与Decodable
    var name:String
    var age:Int
    var weight:Float
}
let xiaoLin = studentB(name: "小林", age: 15, weight: 45.8)
let jsonData = try JSONEncoder().encode(xiaoLin)
do{
    let xiaolinCopy = try JSONDecoder().decode(studentB.self, from: jsonData)
} catch {
    print("解析失败")
}

/*解码方式
        1.string->Data->decode-》类/结构(继承Decodable协议)
        2.Data->decode->类/结构(继承Decodable协议)
 与JSONSerialization.jsonObject解码进行比较
 */

//对于结构体嵌套结构体的,需要在外部定义好结构体,否则没办法自动解码
struct School: Decodable {
    var name: String
    var address: String
}
struct Student: Decodable {
    var name: String
    var age: Int
    var weight: Float
    var school: School //被嵌套结构体
}






