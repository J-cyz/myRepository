//: Playground - noun: a place where people can play

import UIKit

class ReverseIterator<T>: IteratorProtocol {
    typealias Element = T
    
    var array:[Element]
    var currentIndex = 0
    
    init(array: [Element]){
        self.array = array
    }
    
    //继承IteratorProtocol,重写,自定义遍历顺序
    func next() -> Element? {
        if currentIndex < array.count {
            let element = array[currentIndex]
            currentIndex += 1
            return element
        }
        else {
            return nil
        }
    }
}

struct ReverseSequence<T>: Sequence {   //缺少继承方法
    var array: [T]
    
    init(array: [T]) {
        self.array = array
    }
    
    typealias Iterator = ReverseIterator<T>
    
    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
}

let arr = [0,1,2,3,4]

for i in ReverseSequence(array: arr){
    print("Index \(i) is \(arr[i])")
}


















