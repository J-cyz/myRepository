//: Playground - noun: a place where people can play

import UIKit

//斐波纳挈 1 1 2 3 5 8 13...

func f(_ n:Int) -> Int{
    if n==0 {
        return 0
    }else if n==1 {
        return 1
    }else{
        return f(n-1) + f(n-2)
    }
}

func f2(_ n:Int) -> Int{
    if n==1{
        return 1
    }else{
        return f(n) + f2(n-1)
    }
}

//尾递归,递归返回为函数,而非准确的值,从而防止内存爆炸

//mission:使用尾递归设计斐波纳挈递归求和函数
//递归嵌套递归
func f3(_ n:Int, _ total:Int = 0) -> Int{
    //获取值
    func i(_ n:Int, _ total:Int = 0) -> Int{
        if n <= 1{
            return total + n
        }else{
            return i(n-1) + i(n-2)
        }
    }
    //递归
    if n==1{
        return total + 1
    }else{
        return f3(n-1, total + i(n)) //尾递归,返回函数
    }
}

f3(5)



