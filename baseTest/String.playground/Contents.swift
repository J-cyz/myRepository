//: Playground - noun: a place where people can play

//字符串的应用

import UIKit

var string = "www.baidu.tw"

//获取字符串的长度
var length = string.characters.count
length = string.lengthOfBytes(using: String.Encoding.utf8)

//获取字符串下标，index点 0 range前闭后开区间 [4~9)，两者顺序都是从0开始
var index = string.index(string.startIndex, offsetBy: 0)
var range = string.range(of: "baidu")

//向字符串插入特定字符,若插入字符串则选用contentsOf: "".characters
string.insert(contentsOf: "http://".characters, at: string.startIndex)
string.insert("_", at: index)

//删除字符串内特定字段
for _ in 0..<string.characters.count{
    if let temp = string.range(of: "t"){
        print(temp)
        string.removeSubrange(temp)
    }
}
range = string.range(of: "baidu")
string.removeSubrange(range!)

//字符串比较
let str = "hello,"
let str1 = "Hello,"
let str2 = "don't strave."
let str3 = "Hello,don't strave."
var compare = str > str1
compare = str1 == str2
compare = str1+str2 == str3
compare = str1 < str2

60*9*24

string = "www.baidu.tw"
range = string.range(of: "baidu")

//获取字段头、尾下标
let lowerStr = string.substring(to: (range?.lowerBound)!)
let upperStr = string.substring(from: (range?.upperBound)!)

//替换字符串内特定字段
string.replaceSubrange(range!, with: "google")

//字符串转数组，通过特定字符
string
let array = string.components(separatedBy: ".")

//数组转字符串，使用特定字符拼接
let newStr = array.joined(separator: "/")
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)


string.capitalized //将断开的字母首字大写
string.localizedUppercase //将所有字母大写
string.localizedLowercase //将所有字母小写

//截取字符串
let indexStart = string.index(string.startIndex, offsetBy: 3)
let indexEnd = string.index(string.startIndex, offsetBy: 6)
let clipStr = string.substring(with:indexStart..<indexEnd)


string = " mandela.\n\n\n "
print(string)
print("输出完毕")
//删除空格与换行
let trimStr1 = string.trimmingCharacters(in: .whitespacesAndNewlines)
let trimStr2 = string.trimmingCharacters(in: .whitespaces)
//单独使用newlines无效？
let trimStr3 = string.trimmingCharacters(in: .newlines)

//自定义修剪
let charset = NSCharacterSet(charactersIn: "\n")
//let trimStr4 = string.trimmingCharacters(in: charset)

//string转换为其他类型
var strInt = "000165454"
var int = (strInt as NSString).intValue
var flaot = (strInt as NSString).floatValue
var bool = (strInt as NSString).boolValue

/*字符串的拼接:
    1. "+"
    2. "append()"
*/
let string1 = "hello"
let string2 = ", world"

let joint1 = string1+string2
let joint2 = string1.appending(string2)

//访问字符串中字符索引
for index in string1.characters.indices{
    let temp = string1.substring(to: (index))
    print(temp)
}

//字符串前缀hasPrefix、后缀hasSuffix
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

let _str = "clearNav"+"4"
print(_str)

let msg:NSDictionary? = nil
let action = msg?["action"] as? NSDictionary
let tempMsgid = action?["msgid"] as? Int


//最大值最小值获取
let minValue = UInt8.min
let maxValue = UInt8.max

//各进制 0b = binary, 0o = octal, 0x = hexadecimal
let exponentDouble = 1.21875e1

