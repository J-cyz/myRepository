struct BlackjackCard {
    
    // nested Suit enumeration
    enum Suit: Character {
        case spades = "♠"   //原始值为Character类型
        case hearts = "♡"
        case diamonds = "♢"
        case clubs = "♣"
    }
    
    // nested Rank enumeration
    enum Rank: Int {    //原始值为Int类型
        case two = 2, three, four, five, six, seven, eight, nine, ten   //rawValue = 2,3,4,5,6,7,8,9,10
        case jack, queen, king, ace //rawValue = 11,12,13
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {    //实例计算属性
            switch self {   //self = Rank
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }       //enum中的struct
    
    // BlackjackCard properties and methods 属性与方法
    let rank: Rank, suit: Suit      //存储属性
    var description: String {       //实例计算属性
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let rawValue = BlackjackCard.Rank.jack.rawValue

let queenOfdiamonds = BlackjackCard(rank: .queen, suit: .diamonds)
queenOfdiamonds.rank.values.first













