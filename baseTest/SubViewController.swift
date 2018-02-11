//
//  SubViewController.swift
//  baseTest
//
//  Created by macmini on 2017/6/29.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class SubViewController: UIViewController{
    let testView = UIView()
    let NwImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        testView.x = 20
        testView.y = 20
        testView.height = 20
        testView.width = 20
        
        NwImageView.isUserInteractionEnabled = true
        NwImageView.isMultipleTouchEnabled = true
        
        
        NwImageView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        NwImageView.backgroundColor = UIColor.blue
        self.view.addSubview(NwImageView)
        
        introduceTapGestureRecognizer()
        introducePinchGestureRecognizer()
        introduceLongPressGestureRecognizer()
        introducePanGestureRecognizer()
        introduceSwipeGestureRecognizer()
        introduceRotationGestureRecognizer()
    }
    
    // MARK : 各个手势的代理事件
    // TODO : 控制是否允许手势的触发
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // TODO : 是否允许多个手势同时触发
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // TODO : 两个手势挥斥的时候，第一个失效，执行第二个
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // TODO : 两个手势挥斥的时候，第一个执行，第二个失效
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    
    // TODO : 手指触摸屏幕，开始手势的识别
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
        return true
    }
    
    // MARK :UITapGestureRecognizer 的介绍
    func introduceTapGestureRecognizer() {    //快速双击
        // 初始化
        print("tap")
        let NwTapGestureRecongnizer = UITapGestureRecognizer(target: self, action: #selector(tapGestureClick))
        // 点击几次触发事件
        NwTapGestureRecongnizer.numberOfTapsRequired = 2
        // 几根手指点击触发事件
        NwTapGestureRecongnizer.numberOfTouchesRequired = 2
        // 手势的添加
        NwImageView.addGestureRecognizer(NwTapGestureRecongnizer)
    }
    
    // MARK : UIPinchGestureRecognizer 捏合手势的介绍
    func introducePinchGestureRecognizer() -> Void {     //双指同时按下
        // 初始化
        let NwPinchGestureRecognizer = UIPinchGestureRecognizer.init(target: self, action: #selector(pinchGestureClick(_ :)))
        // 设置缩放比值
        NwPinchGestureRecognizer.scale = 2
        // 手势添加
        NwImageView.addGestureRecognizer(NwPinchGestureRecognizer)
    }
    
    // MARK : UILongPressGestureRecognizer 长按手势的介绍
    func introduceLongPressGestureRecognizer() -> Void {
        // 初始化
        let NwLongPressGestureRecognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressGestureClick))
        // 设置几次长按触发事件
        NwLongPressGestureRecognizer.numberOfTapsRequired = 2
        // 设置几个手指长按
        NwLongPressGestureRecognizer.numberOfTouchesRequired = 2
        // 设置长按的时间间隔
        NwLongPressGestureRecognizer.minimumPressDuration = 0.4
        // 设置长按期间可移动的距离
        NwLongPressGestureRecognizer.allowableMovement = 20
        // 添加手势
        NwImageView.addGestureRecognizer(NwLongPressGestureRecognizer)
    }
    
    // MARK : UISwipeGestureRecognizer  清扫手势
    func introduceSwipeGestureRecognizer() -> Void {
        // 初始化
        let NwSwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(swipeGestureClick))
        // 设置几个手指轻扫触发
        NwSwipeGestureRecognizer.numberOfTouchesRequired = 2
        /**
         设置轻扫的方向
         UISwipeGestureRecognizerDirection 方向
         left : 向左
         right :向右
         up : 向上
         down : 向下
         */
        NwSwipeGestureRecognizer.direction = .left
        // 添加手势
        NwImageView.addGestureRecognizer(NwSwipeGestureRecognizer)
    }
    
    // MARK : UIPanGestureRecognizer 拖拽手势
    
    func introducePanGestureRecognizer() -> Void {
        // 初始化
        let NwPanGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(panGestureClick(_ :)))
        // 设置最多几个手指和最少几个手指触发
        NwPanGestureRecognizer.maximumNumberOfTouches = 2
        NwPanGestureRecognizer.minimumNumberOfTouches = 1
        // 设置将某个对象拖拽到那个点
        NwPanGestureRecognizer.setTranslation(CGPoint.init(x: 100, y: 100), in: NwImageView)
        // 添加手势
        NwImageView.addGestureRecognizer(NwPanGestureRecognizer)
    }
    // TODO : panGestureClick 拖拽手势
    func panGestureClick(_ panGesture:UIPanGestureRecognizer) -> Void {
        // 获取用户拖拽的点
        let panPoint =  panGesture.translation(in: NwImageView)
        print(panPoint.x + panPoint.y)
        // 获取拖拽速率
        let panVelocity = panGesture.velocity(in: NwImageView)
        print(panVelocity)
        
    }
    
    // MARK : UIRotationGestureRecognizer 旋转手势
    func introduceRotationGestureRecognizer() -> Void {
        // 初始化
        let NwRotationGestureRecognizer = UIRotationGestureRecognizer.init(target: self, action: #selector(rotationGestureClick(_ :)))
        // 设置旋转的弧度
        NwRotationGestureRecognizer.rotation = 2
        // 添加手势
        NwImageView.addGestureRecognizer(NwRotationGestureRecognizer)
    }
    // TODO : rotationGestureClick 旋转手势的触发
    func rotationGestureClick(_ rotationGesture:UIRotationGestureRecognizer) -> Void {
        let rotationVelocity = rotationGesture.velocity
        print(rotationVelocity)
    }
    
    // TODO : 双击的事件
    func tapGestureClick() -> Void {
        print("被点击了")
    }
    
    // TODO : pinchGestureClick 的事件
    func pinchGestureClick(_ pinchGesture : UIPinchGestureRecognizer) -> Void {
        // 获取缩放比率
        let velocityValue = pinchGesture.velocity
        print("我的捏合速率是" + "\(velocityValue)")
    }
    
    // TODO : longPressGestureClick
    func longPressGestureClick() -> Void {
        print("长按手势点击")
    }
    //
    func swipeGestureClick() -> Void {
        print("轻扫触发")
        
    }
}
