//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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
        student.giveAnswerClosure = {[weak self](answer:Int) -> Void in    //闭包弱引用Teacher.isRight,强引用student,student无法释放,内存泄露
            self?.isRight = answer == 1 ? true : false
            print(student.name ?? "")
        }
        student.giveAnswer()
    }
    deinit {
        print("deinit---WeakTeacher")
    }
}

class WeakTeacher_Weakpart:NSObject {
    var isRight:Bool?
    override init() {
        super.init()
        let student = Student() //局部变量
        student.name = "Tony"
        student.giveAnswerClosure = {[weak self,weak student](answer:Int) -> Void in    //闭包弱引用Teacher.isRight,弱强引用student
            self?.isRight = answer == 1 ? true : false
            print(student?.name ?? "")
        }
        student.giveAnswer()
    }
    deinit {
        print("deinit---WeakTeacher")
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let teacher = Teacher()     //循环引用无法释放,内存泄露
        teacher.askQuestion()
    }
}

















