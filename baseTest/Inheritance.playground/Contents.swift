//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        get{     //只读属性
           return "traveling at \(currentSpeed) miles per hour"
        }
    }
    func makeNoise() {
    }
}

//继承并添加新特性
class Bicycle:Vehicle{
    var hasBasket = true
}

//重写方法
class Train:Vehicle{
    override func makeNoise() {
        print("Choo Choo")
    }
}

class Car: Vehicle {
    var gear = 1
    override var description: String {
        get{
            return super.description + " in gear \(gear)"
        }
        set{
            //只读属性可以重新为读写属性,但读写属性不能改为只读属性
        }
    }
}

//final 防止重写 - func、var、let
class AutomaticCar: Car {
    final override var currentSpeed: Double {     //重写观察者属性
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
        willSet{
            //
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")





