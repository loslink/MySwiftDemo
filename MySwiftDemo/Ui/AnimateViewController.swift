//
//  AnimateViewController.swift
//  MySwiftDemo
//
//  Created by 劳其恋 on 2019/5/24.
//  Copyright © 2019 劳其恋. All rights reserved.
//

import Foundation
import UIKit

class AnimateViewController: UIViewController ,CAAnimationDelegate{
    
    lazy var mView=CustomView()
    lazy var imageview=UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //basicAnimate()
        //keyFrameAnimate()
        
        view.addSubview(mView)
        mView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(110)
            make.left.right.bottom.equalToSuperview()
        }
        
        //        view.addSubview(imageview)
        //        imageview.snp.makeConstraints { (make) in
        //            make.top.equalToSuperview().offset(110)
        //            make.left.right.bottom.equalToSuperview()
        //        }
        //
        //        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 0)
        //        let con2 = UIGraphicsGetCurrentContext()!
        //        con2.addRect(CGRect(x: 0, y: 0, width: 100, height: 100))
        //        con2.setFillColor(UIColor.red.cgColor)
        //        con2.fillPath()
        //        let image = UIGraphicsGetImageFromCurrentImageContext()
        //        UIGraphicsEndImageContext()
        //
        
        
//        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 0)
//        let p2 = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100))
//        UIColor.brown.setFill()
//        p2.fill()
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        imageview.image = image
    }
    
    //基础动画
    func basicAnimate(){
        //手工创建layer
        let redLayer:CALayer=CALayer.init()
        //设置背景颜色
        redLayer.backgroundColor = UIColor.red.cgColor
        //设置大小和位置
        redLayer.position = CGPoint.init(x: 100, y: 100)
        redLayer.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        view.layer.addSublayer(redLayer)
        //基本动画--旋转
        //1.创建动画对象
        let basic:CABasicAnimation=CABasicAnimation.init()
        //2.设置属性 (默认绕着z轴旋转)
        // fromValue--------------起始值;
        //        toValue----------------移动到多少;
        //        byValue----------------  移动了多少
        basic.keyPath = "transform.rotation";
        //设置开始、结束值
        basic.fromValue=0.1
        basic.toValue = 0.5
        //**缩放
        basic.keyPath="transform.scale"
        basic.byValue=0.65
        //**
        basic.keyPath="position"//或者 basic.keyPath="transform.translation"
        
        basic.fromValue=NSValue.init(cgPoint: CGPoint.init(x: 0, y: 10))
        basic.toValue=NSValue.init(cgPoint: CGPoint.init(x: 10, y: 10))
        
        //2.2 设置动画时间
        basic.duration = 2
        basic.repeatCount=5//重复5次
        basic.repeatDuration=1//
        //设置代理（隐式代理）
        basic.delegate=self
        //设置动画结束后保持当前状态
        basic.isRemovedOnCompletion=true
        basic.fillMode = CAMediaTimingFillMode.forwards
        //3.添加到要作用的layer上
        redLayer.add(basic, forKey: nil)
        
    }
    
    //动画开始时间
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    //动画结束时间
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
    }
    
    // 关键帧动画
    func keyFrameAnimate()
    {
        //手工创建layer
        let  redLayer:CALayer=CALayer.init()
        //设置背景颜色
        redLayer.backgroundColor = UIColor.red.cgColor
        //设置大小和位置
        redLayer.position = CGPoint.init(x: 100, y: 100)
        redLayer.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        view.layer.addSublayer(redLayer)
        
        //1.创建动画对象
        let basic:CAKeyframeAnimation=CAKeyframeAnimation.init()
        //2.设置属性 (默认绕着z轴旋转)
        
        //        fromValue--------------起始值;
        
        //        toValue----------------移动到多少;
        
        //        byValue----------------  移动了多少
        basic.keyPath = "transform.rotation";
        //
        //     //**缩放
        basic.keyPath="transform.scale"
        
        //**
        basic.keyPath="position"//
        
        
        //帧的路径一，value和path只能选一个
        
        //        let value1: NSValue = NSValue(cgPoint: CGPoint(x: 100, y: 100))
        //        let value2: NSValue = NSValue(cgPoint: CGPoint(x: 200, y: 100))
        //        let value3: NSValue = NSValue(cgPoint: CGPoint(x: 200, y: 200))
        //        let value4: NSValue = NSValue(cgPoint: CGPoint(x: 100, y: 200))
        //        let value5: NSValue = NSValue(cgPoint: CGPoint(x: 100, y: 300))
        //        let value6: NSValue = NSValue(cgPoint: CGPoint(x: 200, y: 400))
        //        basic.values = [value1, value2, value3, value4, value5, value6]
        
        
        //创建路径对象(如果设置了path,value就被忽略了,path只对anchorpoint和position起作用)
        let path:UIBezierPath=UIBezierPath.init(ovalIn: CGRect.init(x: 20, y: 100, width: 300, height: 200))
        basic.path = path.cgPath;
        
        //速度控制函数,控制动画的节奏
        
        basic.timingFunction=CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
        //2.2 设置动画时间
        basic.duration = 2
        basic.repeatCount=5//重复5次
        basic.repeatDuration=1//
        //设置代理（隐式代理）
        basic.delegate=self
        //设置动画结束后保持当前状态
        basic.isRemovedOnCompletion=true
        basic.fillMode = CAMediaTimingFillMode.forwards
        //3.添加到要作用的layer上
        redLayer.add(basic, forKey: nil)
        
    }
    
}
