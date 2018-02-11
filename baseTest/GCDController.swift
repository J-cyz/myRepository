//
//  GCDController.swift
//  baseTest
//
//  Created by macmini on 2017/7/7.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class GCDController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         队列分类:
            1.主队列 main 串行,主要用来操作UI页面相关信息,不要随便添加耗时任务进来
            2.全局队列 global 串行,可以设置优先度
            3.自定义队列
         */
        
        let main = DispatchQueue.main
        let global = DispatchQueue.global()
        
        /*
         属性解释：
            label:队列标签,标签名推荐,反向DNS符号,"com.appcoda.myqueue"
            qos:设置队列的优先级
                .background < .utility < .unspecified <
                .deault < .userInitiated < .userInteractive
            attributes:队列形式,若不设置则默认串行
                .concurrent代表是并行队列
                .initiallyInactive代表是需要开发者手动触发
         触发代码->队列名.activate()
         */
        
        let queue = DispatchQueue(label: "queue", qos: .default, attributes: .concurrent)
//        let needActiveQueue = DispatchQueue(label: "multQueue", qos: .utility, attributes: [.concurrent,.initiallyInactive])
        
        /*
         sync:同步,阻塞线程,后台线程执行,执行完毕后返回主线程
         async:异步,不阻塞线程,开辟不同线程
         asyncAfter:延迟异步,不阻塞线程,开辟不同线程
         并发或串行由创建队列时设定,同步或异步由添加任务时设定
         */
        
        queue.sync {
            for i in 0..<10{
                print("🔴同步,  阻塞线程  sync:\(i)")
            }
        }
        
        queue.async {
            for i in 100..<111{
                print("🔵异步,不阻塞线程 async:\(i)")
            }
        }
        
        /*
         1.时间预定义
         .asyncAfter(deadline:.now() + additionalTime)
         let additionalTime:DispatchTimeInterval = .seconds(2)
         .seconds/.microseconds/.milliseconds/.nanoseconds
         2.直接定义
         .asyncAfter(deadline:.now() + 2)
         */
        
        print(Date())   //主线程执行
        queue.asyncAfter(deadline: .now() + 0.5){
            print(Date())
        }
        
        /*
         队列组:
         1.为队列添加事件,并添加进队列组
         队列名.async(group:队列组名){//事件}
         2.队列组通知,队列组内所有队列完成后执行
         队列组名.notify(queue:队列名){//事件}
         
         */
        let group = DispatchGroup()
        
        queue.async(group: group){
            print("尾随闭包")
        }
        
        queue.sync {
            for i in 1000..<1010{
                print("🔴同步,  阻塞线程  sync:\(i)")
            }
        }
        
        group.notify(queue: queue) { 
            queue.sync {
                print("同步?异步?")
            }
        }

    }

}
