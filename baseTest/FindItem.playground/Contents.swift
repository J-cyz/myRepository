//: Playground - noun: a place where people can play


//遍历查找
import UIKit

let mainView = UIView()
let label1 = UILabel()
label1.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
let label2 = UILabel()
label2.frame = CGRect(x: 20, y: 0, width: 20, height: 20)
let label3 = UILabel()
label3.frame = CGRect(x: 40, y: 0, width: 20, height: 20)
let imageview1 = UIImageView()
imageview1.frame = CGRect(x: 0, y: 20, width: 20, height: 20)
let imageview2 = UIImageView()
imageview2.frame = CGRect(x: 20, y: 0, width: 20, height: 20)
let imageview3 = UIImageView()
imageview3.frame = CGRect(x: 40, y: 0, width: 20, height: 20)

mainView.addSubview(label1)
mainView.addSubview(label2)
mainView.addSubview(label3)
mainView.addSubview(imageview1)
mainView.addSubview(imageview2)
mainView.addSubview(imageview3)

mainView.transform.tx

//遍历子控件的方法
for item in mainView.subviews{
    print("\(item)")
}


//where的使用
//添加判断条件
for label in mainView.subviews where label is UILabel {
    print("\(label)")
}

//筛选
let names = ["duolaemen","john","tax1","tax2","tax3"]
var results:[String] = []

//hasPrefix判断是否含有自定义字符串，返回bool类型
for name in names where name.hasPrefix("tax"){
    results.append(name)
}

let optionNames:[String?] = ["duolaemen",nil,"john","tax1",nil,"tax2","tax3"]

for name in optionNames where name != nil {
//    results.append(name) //此时name是String？，故必须使用！才可以添加进 results:[String]
    print(name)
    results.append(name!)
}

//强制转换的其他方法
for case let name? in optionNames{
    print(name)
}


//普通加载与懒加载
//普通加载
class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    // 字符串反转方法
    // uppercased()转换为大写，reversed()字符串反转
    func reversedName() -> String {
        return "\(name.uppercased()) backwords is :\(String(name.uppercased().characters.reversed()))"
    }
}
let person = Person(name: "ming Swift")
print(person.reversedName())

//懒加载
class LazyPerson {
    let name: String
    //此时并不创建该变量
    lazy var reversedName: String = self.getReversedName()
    init(name: String) {
        self.name = name
    }
    private func getReversedName() -> String { // 字符串反转方法
        return "\(name.uppercased()) backwords is \(String(name.uppercased().characters.reversed()))"
    }
}
let lazyPerson = LazyPerson(name: "ming Swift")
//调用到reversedName，此时创建变量
print(lazyPerson.reversedName)
print("over")

//使用repeating创建元素相同的数组
var array:Array<Array<String>> = [[String]](repeating: [String](repeating: "", count: 10), count: 10)
array[3][5] = "x"

//使用带下标的遍历
var num = 0
for (rowIndex, rowContent) in array.enumerated(){
    for (columnIndex, content) in rowContent.enumerated(){
        num += 1
        if content == "x"{
            print("found the Index:[\(rowIndex)][\(columnIndex)]")
        }
    }
}

//优化多嵌套遍历查找，为for循环添加标记
num = 0
findSignalLoop:for (rowIndex, rowContent) in array.enumerated(){
    for (columnIndex, content) in rowContent.enumerated(){
        num += 1
        if content == "x"{
            print("found the Index:[\(rowIndex)][\(columnIndex)]")
            break findSignalLoop
        }
    }
}


let scroe = 100
var level = ""
if scroe > 20{
    if scroe > 40 {
        if scroe > 60{
            if scroe > 80{
                print("successfully!")
            }
        }
    }
}

//对于多条件判断语句，为了增强可读性，可优化
loop: if scroe > 20 { //大前提
    guard scroe > 40 else { break loop} //中前提
    guard scroe > 60 else { break loop } //小前提
    guard scroe > 80 else { break loop } //最终要求
    print("successfully!")
}












