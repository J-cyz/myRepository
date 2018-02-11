


//子类权限不能高于父类权限,但可以提高父类成员权限

//全局权限
public class A {
    fileprivate func someMethod() {}    //文件内权限
}

//模块内权限
internal class B: A {
    override internal func someMethod() {}  //提高至模块内权限
}

//全局权限
public class C {
    fileprivate func someMethod() {}    //文件内权限
    
}

//模块内权限
internal class D: C {
    override internal func someMethod() {   //提高至模块内权限
        super.someMethod()
    }
}

//成员默认权限private
private struct  SomePrivate{
    var a:Int
    var b:Int
}

//成员默认权限internal
public struct  SomeInternal{
    var a:Int
    var b:Int
}

//方法访问权限取决于方法的参数与返回值的最低访问权限,需要自行标注
private func someFunction() -> (SomePrivate,SomeInternal) {
    let someP = SomePrivate(a: 1, b: 1)
    let someI = SomeInternal(a: 2, b: 2)
    return (someP,someI)
}

//枚举成员权限继承枚举权限
public enum CompassPoint {
    case north      //public
    case south
    case east
    case west
}


public class embrace_1 {
    var item_default = "internal"
    public var item = "_"
    
    internal struct embrace_2 {
        var item_default = "internal"
        public var item = "_"
        
        private struct embrace_3 {
            var item_default = "private"
            public var item = "_"
            
            fileprivate struct embrace_4 {
                var item_default = "fileprivate"
                private var item = ""
            }
        }
    }
}

/*
 defualt type:
        public      ->  internal
        internal    ->  internal
        private     ->  private
        fileprivate ->  fileprivate
 */


struct TrackedString {
    //private(set),定义其只可在声明内部设置
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
//stringToEdit.numberOfEdits = 10 error
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

public struct TrackedString_2 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}

public struct model {   //标准情况
    var str : String {
        set{    //internal
            str = ""
        }
        get{
            return self.str
        }
    }
}

public struct model_simple{
    internal(set) var str = ""      //internal set & internal get
}

public struct model_simple_2{   //设置set与get权限不同
    public private(set) var str = ""  //private set & internal set
}

//协议内要求的权限与协议权限相同,包括public
public protocol test {
    func someFunction()  //public
}

internal protocol Inter {
    func someFunction()
}

private protocol Pri:Inter{}     //子协议访问权限不能高于父协议访问权限
    
public class main:Pri{      //类只能遵循低于自身权限的协议
    func someFunction() {   //internal
    }
}
/*
private class sub:Inter{    error 遵循的协议高于自身权限
    func someFunction()
}
*/

public class Public {
    var item = "internal"
}
internal class Internal {}
fileprivate class Fileprivate {}
private class Private {}

extension Public:Pri {    //拓展遵循Pri协议
    func someFunction() {   //private func someFunction
    }
}
/*
    拓展无法明确ExtensionsInProtocol的权限,故协议要求的权限同协议权限
 */

extension Public{ func anotherFunction(){} }    // == internal func anotherFunction(){}
extension Internal{ func someFunction(){} }     // == internal func someFunction(){}
extension Fileprivate{ func someFunction(){} }  // == fileprivate func someFunction(){}
extension Private{ func someFunction(){} }      // == private func someFunction(){}


//拓展中添加的类型成员访问权限必须低于或等于原类型访问权限
private extension Internal{ func anotherFunction(){} }  // == private func anotherFunction(){}

public struct Type{}
private typealias privateType = Type
fileprivate typealias fileprivateType = Type











