//
//  LabelTestViewController.swift
//  baseTest
//
//  Created by macmini on 2018/1/11.
//  Copyright © 2018年 macmini. All rights reserved.
//

import UIKit

class LabelTestViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!

    @IBOutlet weak var testImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UIImage(named:"17.png")?.cornerImage(with: CGSize(width: 120, height: 120), fill: .white, completion: { (img) in
            self.testImageView.image = img
        })
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImage {
    //重绘圆角,优化性能

    /// 重绘图像圆角
    ///
    /// - Parameters:
    ///   - size: 重绘图像尺寸
    ///   - fillColor: 重绘图像背景色
    ///   - completion: 返回重绘好图像
    func cornerImage(with size: CGSize, fill fillColor: UIColor, completion: @escaping (_: UIImage) -> Void) {
        DispatchQueue.global(qos: .default).async(execute: {() -> Void in
//            let start: TimeInterval = CACurrentMediaTime()
            // 1. 利用绘图，建立上下文
            UIGraphicsBeginImageContextWithOptions(size, true, 0)
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            // 2. 设置填充颜色
            fillColor.setFill()
            UIRectFill(rect)
            // 3. 利用 贝赛尔路径 `裁切 效果
            let path = UIBezierPath(ovalIn: rect)
            path.addClip()
            // 4. 绘制图像
            self.draw(in: rect)
            // 5. 取得结果
            let result: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
            // 6. 关闭上下文
            UIGraphicsEndImageContext()
//            print("\(CACurrentMediaTime() - start)")
            // 7. 完成回调
            DispatchQueue.main.async(execute: {() -> Void in
                if result != nil {
                    completion(result!)
                }
            })
        })
    }
}









