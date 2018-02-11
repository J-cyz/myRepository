


//<类型参数名>类型参数,a与b必须是相同类型,inout表示传引用
//多类型参数<类型参数名1,类型参数名2>
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

//push - 推出, pop - 弹出

//泛型栈
struct Stack<element> {
    var items = [element]()
    mutating func push(_ item: element){    //进栈
        items.append(item)
    }
    mutating func pop() -> element{  //出栈并返回值
        return items.removeLast()
    }
}

//泛型拓展,不用提供类型参数<element>
extension Stack {
    var topItem:element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

var stackOfString = Stack<String>()
stackOfString.push("one")
stackOfString.push("two")
stackOfString.push("three")
stackOfString.push("four")
stackOfString.push("five")

for _ in 0..<stackOfString.items.count-1{
    stackOfString.topItem
    stackOfString.pop()
}

//Equatable,代表类型T遵循可比较协议,T参数类型必须是可比较的,类型约束
func findIndex<T:Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {   //==运算符对适用类型有要求
            return index
        }
    }
    return nil
}

protocol Container {
    associatedtype Item     //关联类型,此时Item类型未知,可理解为协议中的泛型<Item>
    mutating func append(_ item: Item)      //遵循该协议的对象中体现Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct Instack: Container {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    typealias Item = Int    //与协议中associatedtype匹配,由于能自动识别,故亦可不用写明
    mutating func append(_ item: Int) {     //类型推断Item对应Int类型
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stacks<element>: Container {     //满足协议元素,遵循协议
    var items = [element]()
    mutating func push(_ item: element) {
        items.append(item)
    }
    mutating func pop() -> element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: element) {     //协议元素1
        self.push(item)
    }
    var count: Int {        //协议元素2
        return items.count
    }
    subscript(i: Int) -> element {      //协议元素3
        return items[i]
    }
}

func allItemsMatch<C1: Container, C2: Container> (_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item:Equatable, C2.Item:Equatable {
    if someContainer.count != anotherContainer.count { return false }
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] { return false }
    }
    return true
}

var stackOfStrings = Stacks<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

var arrayOfStrings = ["uno","dos","tres"]
extension Array:Container{}     //数组具有:1.append 2.count 3.subscript[_:Int] -> _ ,满足协议

if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}

extension Stack where element: Equatable {      //当element为可比较类型时,方法存在
    func isTop(_ item: element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

if stackOfString.isTop("one"){
    print("Top element is one.")
} else {
    print("Top element is something else.")
}

extension Container where Item: Equatable {     //当关联类型为可比较类型时,方法存在
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item     //先判断元素个数,防止元素个数为0时self[0]报错
    }
}

if [9, 9, 9].startsWith(42) {   //Array已经遵循Container协议
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
print([1260.0, 1200.0, 98.6, 37.0].average())



/*
 总结:
	1.func 泛型函数名<参数类型代名>(参数名:参数类型代名){_}
	2.Struct 泛型结构体名<参数类型代名>{}
        2.1
            对于其拓展,自动继承参数类型代名    extension 泛型结构体名{}
        2.2
            初始化泛型结构体    var _ = 泛型结构体名<参数类型代名>()
	3.为泛型添加协议  <参数类型代名:遵循协议>
	4.泛型类型在单个结构体中多次使用情况
        4.1 为泛型类型创建协议
            protocol 协议名{
                associatedtype 泛型类型代名
                func 函数名(_ 参数名:泛型类型代名)
                var 数组名 = [泛型类型代名]()
            }
        4.2 结构体或类遵循协议
            4.2.1 创建并遵循协议
                struct 结构体名<参数类型代名>: 协议名{
                    //因类型推断,该部分可省略
                    typealias 泛型类型代名 = 参数类型代名
                    func 函数名(_ 参数名:参数类型代名)
                    var 数组名 = [参数类型代名]()
                    _ 自定义属性
                }
            PS:注意要遵循协议必须满足协议内的所有属性
            4.2.2 对已创建进行拓展遵循协议
                extension 结构体名: 协议名{
                    _	//协议属性
                    _	//自定义属性
                }
	5.泛型类型添加条件
        extension 协议名 where 带泛型类型的条件{
            _	//特定条件下属性
        }
 */







