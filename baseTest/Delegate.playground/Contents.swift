


protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}


class LinearCongruentialGenerator: RandomNumberGenerator {  //点数算法part1(单独文件)
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

protocol RandomNumberGenerator {    //生成随机点数协议
    func random() -> Double
}

class Dice {     //点数算法part2
    let sides: Int
    let generator: RandomNumberGenerator        //类let delegate = _
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

class DiceGameTracker: DiceGameDelegate {    //游戏进度跟踪(单独文件)
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

class SnakesAndLadders: DiceGame {      //游戏主算法
    let finalSquare = 25    //终点方格
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0      //到达位置方格
    var board: [Int]    //棋盘设置特定方格设置
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)     //创建位置属性数组,除指定位置,其余值为0
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)    //提示游戏开始
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()  //获取摇得点数
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:   //到达最后位置
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}


let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()



//???????????


