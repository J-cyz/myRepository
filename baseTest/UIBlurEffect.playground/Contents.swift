//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class Effect {
    func createBackgroundImageView(image:UIImage,frame:CGRect,borderColor:UIColor) -> UIImageView{
        let imageView = UIImageView(frame:frame)
        imageView.layer.borderColor = borderColor.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.image = image
        return imageView
    }
    
    func setEffect(style:UIBlurEffectStyle,frame:CGRect) -> UIVisualEffectView{
        let blurEffect = UIBlurEffect(style: style)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)   //用于使遮罩层内的内容映射图片颜色
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white
        vibrancyView.contentView.addSubview(label)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = frame
        blurView.contentView.addSubview(vibrancyView)
        return blurView
    }
}

let bg = Effect.init()

let b = bg.createBackgroundImageView(image: UIImage(), frame: CGRect(x: 0, y: 0, width: 0, height: 0), borderColor: UIColor.black)