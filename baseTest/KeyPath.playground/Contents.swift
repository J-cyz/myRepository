//: Playground - noun: a place where people can play

import UIKit

//KeyPath 快速索引

struct Person{
    var name:String
}
struct Book {
    var title:String
    var author:[Person]
    var mainAuthor:Person{
        return author.first!
    }
}

let boony = Person(name: "Boony")
let brony = Person(name: "Brony")
let howToBeLittleBro = Book(title: "HowToBeLittleBro", author: [boony,brony])


howToBeLittleBro.title
//howToBeLittleBro[KeyPath: \Book.title]


//http://www.swiftv.cn/
//Codable 可编译协议,使定义的类型可以实现压缩与解缩,注意必须类型内的所有成员类型都必须继承Codble协议
struct Pork:Codable {
    enum Alltype:String, Codable{
        case spade
        case clubs
        case hearts
        case diamonds
    }
    enum Points:Int, Codable{
        case A = 1, 二, 三, 四, 五, 六, 七, 八, 九, 十, J, Q, K
    }
    var type:Alltype
    var point:Points
}
let myCard = [Pork(type: .hearts, point: .K),Pork(type: .spade, point: .三)]

var encoder = JSONEncoder() //实例化JSON编码器
encoder.dataEncodingStrategy  //数据类型的编码策略
encoder.dateEncodingStrategy = .millisecondsSince1970 //日期类型的编码策略
encoder.nonConformingFloatEncodingStrategy //浮点型类型的编码策略
encoder.outputFormatting = .prettyPrinted //输出格式,格式化/紧凑(默认)
encoder.userInfo //可不写
//对于继承Codable协议参数进行编码
let jsonData = try encoder.encode(myCard)
String(data: jsonData, encoding: .utf8)
print(jsonData)
//JSON解码
let dict = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions(rawValue: 0))
print(dict)

//Sequence 最新类型Element
//当Sequence内Element遵循Numeric协议时
extension Sequence where Element:Numeric {
    //添加求和方法
    var sum:Element{
        var result:Element = 0
        for one in self {
            result += one
        }
        return result
    }
}
["a","b","c","d","e"] //此时Element都为String,并不继承Numeric,故不可调用sum
[1,2,3,4].sum

//Collection
//当Collection内Element遵循Equatable协议时
extension Collection where Element: Equatable {
    //添加头尾镜像判断方法
    func mirror() -> Bool {
        let head = prefix(1)
        let end = suffix(1)
        return head.elementsEqual(end) //判断是否相等
    }
}
[1,2,3,4,4,3,2,0].mirror()
let head = [1,2,3,4,4,3,2,0].prefix(1) //正数第1位
let end = [1,2,3,4,4,3,2,0].suffix(1) //倒数第1位

//ZIP合并
let color = ["red","blue","clown","grey","black","white"]
let no = [1,2,3,4,5,6]
let tempCombine = zip(no, color) //合并为元组
let combine =  Array(tempCombine)

//快速构造字典
let dictKey = ["one","two","three","four","five","six","seven","eight","nine"]
let dictValue = [1,2,3,4,5,6,7,8,9]
let dic = Dictionary(uniqueKeysWithValues: zip(dictKey, dictValue))
print(dic)

let technology = [("apple","Swift"),
                  ("google","Kotlin"),
                  ("apple","Playgrounds"),
                  ("google","TensorFlow"),
                  ("google","TensorFlowLite")]
//对于元组数组转字典,当同一key值对应多个value时,可通过uniquingKeysWith来选择使用第一个value或最后一个value
let techDict = Dictionary(technology, uniquingKeysWith: {(first,last) in first})
print(techDict)

//字典的合并merge
let defaultConfig = ["autoLogin":false, "bindPhone":false, "blueTooth":false]
var userConfig = ["autoLogin":true, "bindPhone":false]
//将defaultConfig字典添加进userConfig字典,当出现重复字典时,保留defaultConfig的字典
userConfig.merge(defaultConfig) { (old, new) -> Bool in new }

//对于空字典,返回自定义值
//userConfig["savePassWord", default: "unknow"]

//字典nil自定义值的使用场景
var passage = """
On Friendship
And a youth said, "Speak to us of Friendship."
Your friend is your needs answered.
He is your field which you sow with love and reap with thanksgiving.
And he is your board and your fireside.
For you come to him with your hunger, and you seek him for peace.
When your friend speaks his mind you fear not the "nay" in your own mind, nor do you withhold the "ay."
And when he is silent your heart ceases not to listen to his heart;
For without words, in friendship, all thoughts, all desires, all expectations are born and shared, with joy that is unacclaimed.
"""
var frequency:[Character:Int] = [:]
//删除文章中的空格与换行字符
//components,使用特定字符进行分隔 joined,将字符串进行拼接
let arr = passage.components(separatedBy: CharacterSet.whitespacesAndNewlines)
let all = arr.joined()
for letter in all{
    frequency[letter, default: 0] += 1
}
//遍历字典
for (letter,times) in frequency{
    print("letter:\(letter)","times:\(times)")
}

//对于字典filter筛选的返回结果依旧为字典而非数组
let filtered = dic.filter({$0.value > 4})
print(filtered)
//map筛选返回数组,mapValue筛选返回字典(新方法)
let mapValued = dic.mapValues { value in
    value > 3
}
print(mapValued)
//排序？
//Set集合{}
//Array数组[]
//Dictionary字典[:]

//字典的分组
let communicater = ["sanfen zhang","sisi li","sufang zhang","feifei wang","xiaojun zhang"]
let addressList =  Dictionary(grouping: communicater) { (name:String) -> String in
    let temp = name.components(separatedBy: .whitespaces)
    return temp.last!
}

//交换数组中元素
var changeBefore = [1,2,3,4,5]
changeBefore.swapAt(0,1)

//reduce,数组元素合并方式
var arrStr = ["i"," ","am"," ","fine"]
var strs = arrStr.reduce("") { (result, one) -> String in
    return result + one
}
strs = arrStr.reduce("", { (用于保存结果的临时参数, 遍历数组的单个元素) -> String in
    return 用于保存结果的临时参数 + 遍历数组的单个元素
})

//区别?
extension Sequence where Element: Equatable {
    func uniq() -> [Element] {
        return reduce(into: [], { (result: inout[Element], element) in
            if result.last != element {
                result.append(element)
            }
        })
    }
}

[1,1,1,2,3,3,4].uniq()

//泛型下标,可以根据解析时的情况返回指定的类型,不需要使用 as?
struct JSON {
    var storage: [String:Any]
    init(_ dict: [String:Any]) {
        self.storage = dict
    }
    //自定义泛型下标
    subscript<T>(Key: String) -> T? {
        return storage[Key] as? T
    }
}

let json = JSON([
    "城市名": "福州",
    "国家代码": "cn",
    "人口": 100_100_100
    ])

let city: String = json["城市名"] ?? ""

extension Collection {
    //根据所选下标返回指定的数组方法
    subscript<继承序列类型的泛型_T: Sequence>(泛型数组: 继承序列类型的泛型_T) -> [Element] where 继承序列类型的泛型_T.Element == Index {
        var 保存结果的临时数组: [Element] = []
        for index in 泛型数组 {
            保存结果的临时数组.append(self[index])
        }
        return 保存结果的临时数组
    }
}
//使用分割方法来创建
let collectionWords = "新 功 能 泛 型".split(separator: " ")
let choseWords = collectionWords[[2,4]]

//超过整形范围时,不再进行损失精度处理,而直接返回nil
let n = UInt32(301)
let v = n as? Int8

//同时继承多个协议
protocol delegateA: class {
    func polyFunction()
}

protocol delegateB: class {
    func polyFunction()
}

class delegater: delegateA {
    func polyFunction() {
        print("")
    }
}







