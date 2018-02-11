//: Playground - noun: a place where people can play

import UIKit

protocol Copyable {
    func copy() -> Self
    func clamp(intervalToClamp: Self) -> Self
}

class ABVD: Copyable {

    var num = 1

    required init() {

    }

    func copy() -> Self {
        let typea = type(of: self)
        print(typea)
        let result = typea.init()
        result.num = num
        return result
    }

    func clamp(intervalToClamp: ABVD) -> Self {
        let result = type(of: self).init()
        result.num = num
        return result
    }
}

let a = ABVD()
a.self

//type(of: self) 获取当前对象类型. self当前对象,Self当前对象类型








