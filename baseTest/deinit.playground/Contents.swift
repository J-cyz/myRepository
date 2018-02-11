//: Playground - noun: a place where people can play

import UIKit

class Bank {    //银行,内部实例,局部静态变量
    static var coinsInBank = 10_000     //硬币
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {      //支出
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {   //收取
        coinsInBank += coins
    }
}

class Player {  //玩家
    var coinsInPurse: Int   //钱包
    init(coins: Int) {      //从银行获取的硬币
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {  //获胜
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {    //返还硬币给银行
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne:Player? = Player(coins: 500)
print("\(Bank.coinsInBank)")
playerOne = nil     //Player销毁前deinit,将coinsInPurse全部返还
print("\(Bank.coinsInBank)")
