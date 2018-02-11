//
//  CircleReferenceTest.swift
//  baseTest
//
//  Created by macmini on 2017/8/23.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class CircleReferenceTest: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //循环引用,不释放
//        let teacher = Teacher()
//        teacher.askQuestion()
//        
//        //强引用+弱引用,释放 : deinit---WeakTeacher、deinit---Student
//        let weakTeacher = WeakTeacher()
//        weakTeacher.askQuestion()
//        
//        //强引用+弱引用+局部强引用
//        //弱引用释放,局部强引用(student)不释放,实例化完成后马上判断释放 : deinit---WeakTeacher_part
//        _ = WeakTeacher_part()
//        
//        //强引用+弱引用+局部弱引用,释放 : deinit---Student、deinit---WeakTeacher_Weakpart
//        _ = WeakTeacher_Weakpart()
//        
//        //强引用+弱引用+局部弱引用+异步线程
//        _ = WeakTeacher_Weakpart_Dispatch()
        
        //强引用+弱引用+局部弱引用+Strong异步线程
        _ = WeakTeacher_Weakpart_StrongDispatch()
    }
}
/*内存释放顺序
    1.不进行引用,实例化完成后直接释放
    2.函数体执行完成后,从后向前,逐个释放
 */



/// 循环引用
class Student {
    var name: String?   //String or nil
    var giveAnswerClosure: ((Int) -> Void)?     //func or nil
    func giveAnswer() {
        // 调用闭包
        giveAnswerClosure?(1)
    }
    deinit {
        print("deinit---Student")
    }
}

class Teacher: NSObject {
    var student: Student?   //强引用student,全局变量
    var isRight: Bool?
    override init() {
        super.init()
        student = Student()
        // 闭包回调
        student?.giveAnswerClosure = { (answer:Int) -> Void in    //闭包强引用Teacher.isRight
            self.isRight = answer == 1 ? true : false
        }
    }
    func askQuestion() {
        student?.giveAnswer()
    }
    deinit {
        print("deinit---Teacher")
    }
}

class WeakTeacher:NSObject {
    var student:Student?    //强引用student
    var isRight:Bool?
    override init() {
        super.init()
        student = Student()
        student?.giveAnswerClosure = {[weak self](answer:Int) -> Void in    //闭包弱引用Teacher.isRight,先释放Teacher,后释放Student,未被引用的优先释放
            self?.isRight = answer == 1 ? true : false
        }
    }
    func askQuestion(){
        student?.giveAnswer()
    }
    deinit {
        print("deinit---WeakTeacher")
    }
}

class WeakTeacher_part:NSObject {
    var isRight:Bool?
    override init() {
        super.init()
        let student = Student() //局部变量
        student.name = "Tony"
        student.giveAnswerClosure = {[weak self](answer:Int) -> Void in    //闭包弱引用Teacher.isRight
            self?.isRight = answer == 1 ? true : false
            print(student.name ?? "")   //强引用student,student无法释放,内存泄露
        }
        student.giveAnswer()
    }
    deinit {
        print("deinit---WeakTeacher_part")
    }
}

class WeakTeacher_Weakpart:NSObject {
    var isRight:Bool?
    override init() {
        super.init()
        let student = Student() //局部变量
        student.name = "Tony"
        student.giveAnswerClosure = {[weak self,weak student](answer:Int) -> Void in    //闭包弱引用Teacher.isRight,弱引用student
            self?.isRight = answer == 1 ? true : false
            print(student?.name ?? "")
        }
        student.giveAnswer()
    }
    deinit {
        print("deinit---WeakTeacher_Weakpart")
    }
}

class WeakTeacher_Weakpart_Dispatch:NSObject {
    var isRight:Bool?
    override init() {
        super.init()
        let student = Student() //局部变量
        student.name = "Dispatch"
        student.giveAnswerClosure = {[weak self,weak student](answer:Int) -> Void in    //闭包弱引用Teacher.isRight,弱引用student
            self?.isRight = answer == 1 ? true : false
            //异步线程,2s后执行,此时student已经释放
            DispatchQueue.global().asyncAfter(deadline: .now()+2, execute: { 
                print(student?.name ?? "nil")
            })
        }
        student.giveAnswer()
    }
    deinit {
        print("deinit---WeakTeacher_Weakpart_Dispatch")
    }
}

class WeakTeacher_Weakpart_StrongDispatch:NSObject {
    var isRight:Bool?
    override init() {
        super.init()
        let student = Student() //局部变量
        student.name = "StrongDispatch"
        student.giveAnswerClosure = {[weak self,weak student](answer:Int) -> Void in    //闭包弱引用Teacher.isRight,弱强引用student
            self?.isRight = answer == 1 ? true : false
            let strongStudent = student     //strongStudent是闭包内的强引用,故不会产生循环引用
            //异步线程,强引用闭包内参数,异步执行完毕后,释放strong_
            DispatchQueue.global().asyncAfter(deadline: .now()+2, execute: {
                print(strongStudent?.name ?? "nil")
            })
        }
        student.giveAnswer()
    }
    deinit {
        print("deinit---WeakTeacher_Weakpart_StrongDispatch")
    }
}

//http://www.jianshu.com/p/36ecc33df9c9







