//: Playground - noun: a place where people can play
//http://www.jb51.net/tools/zhengze.html


import UIKit

/*
 
 ()             表示子表达式的头尾
 []             表示中括号表达式的头尾,一个中括号内表示一个字符
 {}             表示限定符表达式的头尾

 
 \\.              表示匹配除换行符 \n 之外的的任何单字符
 |              表示指明两项之间的一个选择
 
 //贪婪限定符
 *              表示匹配前面的子表达式0次或多次
 +              表示匹配前面的子表达式1次或多次
 ?              表示匹配前面的子表达式0次或1次,或指明一个非贪婪限定符号,即在贪婪表达式后放置?
 
 //非贪婪限定符
 {n}            表示匹配前面的子表达式n次
 {n,}           表示匹配前面的子表达式至少n次
 {n,m}          表示匹配前面的子表达式n到m次
 
 //定位符
 //不可与限定符共用
 ^$             表示总表达式的头尾,行首行尾
 \\b            表示匹配一个字边界,字与空格间的位置,可前可后 \\bHead or end\\b
 \\B            表示非字边界匹配 \Bapt != aption, == chapter or ed\B != bed == edit
 
 \\m            表示复用前面的第m位子表达式匹配好的字符串
 
 ?:             表示消除子表达式缓存,匹配的子表达式会被缓存,故有时需要消除
 ?=             表示正向预查,在开始匹配子表达式的位置来匹配搜索字符串
 ?!             表示负向预查,在不匹配子表达式的位置来匹配搜索字符串
 实例:"^(?:Chapter|Section) [1-9][0-9]?$

 
 (子表达式1)|(子表达式2)    表示匹配子表达式1或子表达式2
 [xyz]          表示匹配xyz中任意一个字符
 [^xyz]         表示匹配除xyz外任意一个字符
 [^a-z]         表示匹配除a-z外任意一个字符
 \\d            表示匹配一个数字字符
 \\D            表示匹配一个非数字字符
 \\f            表示匹配一个换页符
 \\n            表示匹配一个换行符
 \\r            表示匹配一个回车符
 \\s            表示任何空白字符,等价[\\f\\n\\r\\t\\v]
 \\S            表示匹配任何非空白字符,等价[^\\f\\n\\r\\t\\v]
 \\t            表示匹配一个制表符，Tab
 \\v            表示匹配一个垂直制表符,|
 \\w            表示匹配包括下划线的任何单词字符,等价[A-Za-z0-9_]
 \\W            表示匹配任何非单词字符,等价[^A-Za-z0-9_]
 \\xn           表示匹配十六进制转义值
 \\\\           表示匹配一个反斜杠\
 
 //字符族
 //只有使用字符族时使用[],否则单个字符不使用[]
 [AaEeIiOoUu]   表示匹配[]内的任意一个字符
 [0-9._]        表示匹配数字 + . + _
 
 ps:swift中,需要匹配具有转义意义的特殊符号,不需要使用斜杠,直接输入即可,
    例: 
        \\.  -> 任意字符
        .    -> 字符.
 
 ^[^"']\\w*$    表示匹配非"'开头的
 [^12345]
 
 Q:如何设置不匹配 \\.开头的字符串
    A: ^[^([\\][.])]
 
 
 //实例
 "\\b([a-z]+) \1"  ->  \1自动匹配第一个子表达式所匹配成功的字符串
    this thisss island -> \b([a-z]+) 匹配为 "this this"
 
 "(\\w+)://([^/:]+)(:\d*)?([^# ]*)"
 子表达式1:"(\\w+)"     ->  至少一个任意字符
 子表达式2:"([^/:]+)"   ->  至少一个任意不为/:的字符
 子表达式3:"(:\d*)"     ->  :数字次数0到正无穷
 子表达式4:"([^# ]*)"   ->  不以#开头的
 http : //www.w3cschool.cn:80/html/html-tutorial.html
 http :// www.w3cschool.cn :80 /html/html-tutorial.html
*/

//"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
//邮箱匹配 
//首字符为字母a-z / 0-9 / _ / . / - :   ^([a-z0-9_\\.-]+)            onev
//AT: @                                         @
//xxx.xxx number / a-z / . / - . a-z/. x2~6:([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$    onevcat.com




//let str = "this is is"
//let str = "123@qq.com.cn.cn.cn.cn.cn.cn.cn.cn"
let str = "\\\\\\."
//let pattern = "\\b([a-z]+) \\b([a-z]+) \\2\\b"
let pattern = "^\\\\+."
//let pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)(.([a-z0-9])*){2,6}$"
let regex = try? NSRegularExpression(pattern: pattern, options: [])
let results = regex!.matches(in: str, options: [], range: NSRange(location:0, length:str.characters.count))
print(results)
for result in results {
    print(result.range) //对应位置
    let string = (str as NSString).substring(with: result.range)
    print(string)
}




/*实例
 0.0.0.0    //IP
 ((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)
 part1
    ((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}   //括号内重复3次
    ((2[0-4]\d|25[0-5]|[01]?\d\d?)\.)      //
     (2[0-4]\d|25[0-5]|[01]?\d\d?)
 
*/





