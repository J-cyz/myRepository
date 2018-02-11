//: Playground - noun: a place where people can play

import UIKit


struct Bounds {
    var width = 0
    var height = 0
}
//值类型,被赋值时,通过拷贝方式传递,不改变原参数  -> 传值
var hd = Bounds(width: 360, height: 180)
var cinema = hd
cinema.width = 720
cinema.height = 360

//hd与cinema指向不同的地址
hd.width
hd.height

var arr = [0,0,0]
var newArr = arr
arr[0] = 1
arr
newArr


struct En {
    var a: String
    func output(){
        print("\(a)")
    }
}


//引用类型,被赋值时,引用同一个类型  -> 传地址
class VideoMode {
    var resolution = Bounds()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var video = VideoMode()
video.resolution = hd
video.interlaced = true
video.frameRate = 2.0
video.name = ""
video.resolution.width
video.resolution.height

let videoCopy = video
//此处虽然改变videoCopy内的数值,但并未改变videoCopy的值,videoCopy其值为地址值
videoCopy.resolution.width = 1024
videoCopy.resolution.height = 2048

var video2 = VideoMode()
print(video2)

//video与videoCopy指向同一个地址
video.resolution.width
video.resolution.height

//判断引用值 === / !==
if video === videoCopy {
    print("video and videoCopy refer to the same VideoMode instance.")
}


//Lazy Stored Properties

class DataImporter {
    var fileName = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")       //暂不初始化 importer
print(manager.importer.fileName)        //此时初始化 importer


// Computed Properties

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {   //center为计算属性,通过计算得到
    var origin = Point()
    var size = Size()
    var center: Point {
        get {       //get-return 获取,set设置
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set{    //可指定名字,以代替newValue
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)     //设置newCenter = Point
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {        //只读计算属性 get、{}可省略
        get{
            return width * height * depth
        }
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


//Property Observers

//步数计算
class StepCounter {
    var totalSteps: Int = 0 {   //newValue-willSet 、 odlValue-didSet
        willSet /*(自定义参数名)*/{       //newValue -> 最新赋值的数
            print("\nnewValue:\(newValue)")
            print("About to set totalSteps to \(newValue)")
        }
        didSet /*(自定义参数名)*/{        //oldValue  -> 上一次赋值的数
            if totalSteps > oldValue  {
                print("oldValue:\(oldValue)")
                print("Added \(totalSteps - oldValue) steps\n")
            }
        }
    }
}
let stepCounter = StepCounter()     //子类,willSet和didSet会在父类的初始化器调用之后被调用
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896


//Type Properties 类似于静态局部变量,有且只初始化一次
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

//Instance Methods
class Counter {     //实例方法
    var count = 0           //实例属性(内部)
    func increment() {      //实例方法(内部)
        self.count += 1     //隐式属性self == Counter,实例属性与参数名相同时使用
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

//mutating - enum & struct

enum Sex{
    case male,female
    mutating func exchange(){
        switch self {
        case .male:
            self = .female
        case .female:
            self = .male
        }
    }
}


struct Student{
    var name: String = ""
    var number: Int = 10001
    var sex: Sex = .female
    mutating func change(number: Int){  //改变自身及实例属性需加mutating
        self.number = number
    }
}

var liMing = Student()
liMing.change(number: 10020)
liMing.sex.exchange()
print(liMing)

var xiaoHong = Student()
print(xiaoHong)










