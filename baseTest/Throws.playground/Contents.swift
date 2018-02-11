enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {     //没有找到该选项
            throw VendingMachineError.invalidSelection      //返回枚举类型
        }
        
        guard item.count > 0 else {     //卖完了
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {       //余额不足
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks:Dictionary = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)   //对于能抛出错误的,可使用try
}
/*  do-catch
      do {
        try (func)
        成功执行    //可省略
      } 
      catch error {
        错误执行
      }
*/

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8       //余额
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)   //snackName = "Chips"
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

//try? 对于成功的,直接返回结果,对于失败的,返回nil,用于使代码更加简洁
//    func fetchData() -> Data? {
//        if let data = try? fetchDataFromDisk() { return data }
//        if let data = try? fetchDataFromServer() { return data }
//        return nil
//    }



//try! ???????????


//defer-执行离开代码块后的清理,不论如何离开代码块 return / break / error

//    func processFile(filename: String) {
//        if exists(filename) {
//            let file = open(filename)
//            defer {
//                close(file)
//            }
//            // close(file) is called here, at the end of the scope.
//        }
//    }



//自定义具有抛出错误信息的函数
//需要定义错误返回枚举
enum situation :Error{
    case 错误情况1
    case 错误情况2
    case 错误情况3
}

func canThrowAnError(数字:Int) throws {
    guard 数字 > 1 else{
        throw situation.错误情况1
    }
    guard 数字 > 10 else{
        throw situation.错误情况2
    }
    guard 数字 > 100 else{
        throw situation.错误情况3
    }
}

do {
    try canThrowAnError(数字: 20)
    //无错误抛出
    print("没有发生错误")
} catch situation.错误情况1{
    //错误情况1:
    print("错误情况1")
} catch situation.错误情况2{
    //错误情况2:
    print("错误情况2")
} catch situation.错误情况3{
    //错误情况3:
    print("错误情况3")
}

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"



































