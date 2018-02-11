//: Playground - noun: a place where people can play

import UIKit

// 懒加载
func lazy(){
    class A {
        lazy var str:String = { //lazy修饰时,只能声明为变量
            let str = "Hello"
            print("这是首次访问str")
            return str
        }()
    }
    let tempA = A()
    _ = tempA.str   //只有在获取成员时,才开始实例化
    _ = tempA.str   //只赋值一次
    
    func map_withOutLazy(){
        let array = 1...3
        let result = array.map { (i:Int)->Int in
            print("正在处理\(i)")
            return i*2
        }
        for i in result {
            print("处理后数据\(i)")
        }
        print("处理完毕")
    }
    func map_withInLazy(){
        let array = 1...3
        //只有对需要使用到的result进行map处理
        let result = array.lazy.map { (i:Int)->Int in
            print("正在处理\(i)")
            return i*2
        }
        for i in result {
            print("处理后数据\(i)")
        }
        print("处理完毕")
    }
    map_withInLazy()
}
//lazy()

//获取类型
func reflection_Mirror(){
    struct Person {
        let name:String
        let age:Int
    }
    let dad = Person(name: "ba", age: 40)
    //拷贝镜像
    let r = Mirror(reflecting: dad)
    //镜像类型,可选值
    print("r的类型是\(r.displayStyle!)")
    //r.children,镜像内的成员集合
    print("属性个数:\(r.children.count)")
    for child in r.children {
        print("属性名:\(child.label!),值:\(child.value)")
    }
    //标准输出
    dump(dad)
}
//reflection_Mirror()

//多重option
func option(){
    let aNil:String? = nil
    let secNil:String?? = aNil  //盒子中的盒子中的空气
    let thrNil:String?? = nil   //盒子中的空气
    if secNil != nil {
        print("secNil")
    }
    if thrNil != nil {
        print("thrNil")
    }
//    //无法对可选值进行map
//    let array：Int? = 3
//    let result = array.map {
//        $0 * 2
//    }
}
//option()

protocol TestProtocol {
    func method()
}
//对Protocol直接进行拓展
extension TestProtocol {
    func method() {
        print("extension")
    }
}

struct protoStruct: TestProtocol {}
protoStruct().method()

protocol A1 {
    func method() -> String
}

struct B1:A1 {
    func method() -> String {
        return "hello"
    }
}



var arrA = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

var start = CFAbsoluteTimeGetCurrent()
for (index,one) in arrA.enumerated(){
    arrA[index] = max(0,one-1)
}
var time = CFAbsoluteTimeGetCurrent() - start
print("创建时间:\(time)")

var arrB = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

start = CFAbsoluteTimeGetCurrent()
for index in 0..<arrB.count{
    arrB[index] = max(0,arrB[index]-1)
}
time = CFAbsoluteTimeGetCurrent() - start
print("创建时间:\(time)")

let ar = [Int]()
let one = ar.first

let st = "蓝色"
let st_strlen = st.count
for one in st.unicodeScalars{ //遍历ascii码
    print(one.value)
}

func operation(a:Int) -> Int {
    return a*2
}

let op = operation(a: 2)

let opt:Int? = nil

if let i = opt{

}




