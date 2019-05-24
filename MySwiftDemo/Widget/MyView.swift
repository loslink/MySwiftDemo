//
//  MyView.swift
//  MySwiftDemo
//
//  Created by 劳其恋 on 2019/5/16.
//  Copyright © 2019 劳其恋. All rights reserved.
//

import Foundation
import UIKit

class MView: UIView {
    override func draw(_ rect: CGRect) {
        UIColor.white.setFill()
        UIRectFill(rect)//填充绘制
        
//        UIColor.white.setStroke()
//        let frame=CGRect(x: 20, y: 30, width: 100, height: 300)
//        UIRectFrame(frame)//边框绘制
        
        //图片绘制
//        let image=UIImage.init(named: "ic_main_phone_booster")
//        let imageRect=CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        image?.draw(in: imageRect)
//        image?.draw(at: CGPoint(x: 0, y: 40))
//        image?.drawAsPattern(in: CGRect(x: 0, y: 40, width: 320, height: 400))//平铺绘制
        
        //文本绘制
        let title:NSString="我的小狗"
        let font=UIFont.systemFont(ofSize: 28)
        let attr=[NSAttributedString.Key.font:font]
        let size=title.size(withAttributes: attr)
        //水平居中x坐标
        let xpos=UIScreen.main.bounds.midX - size.width/2
        //绘制字符串
        title.draw(at: CGPoint(x: xpos, y: 70), withAttributes: attr)
        //在区域绘制文本
        let stringRect=CGRect(x: xpos, y: 120, width: 100, height: 40)
        title.draw(in: stringRect, withAttributes: attr)
        
        
        //Quartz绘制
        let context=UIGraphicsGetCurrentContext()
//        context?.move(to: CGPoint(x: 75, y: 10))
//        context?.addLine(to: CGPoint(x: 10, y: 150))
//        context?.addLine(to: CGPoint(x: 160, y: 150))
//        context?.closePath()
//
//        UIColor.black.setStroke()
//        UIColor.red.setFill()
//        context?.drawPath(using: CGPathDrawingMode.fillStroke)
        
        let pto=CGPoint(x: 300, y: 0)
        let conp1=CGPoint(x: 100, y: 200)
        let conp2=CGPoint(x: 200, y: 200)
        UIColor.red.setFill()
        drawCircle(p: pto)
        drawCircle(p: conp1)
        drawCircle(p: conp2)
        context?.move(to: CGPoint(x: 0, y: 0))
        //to:右端点（最后点）  control1:左控制的。control2:中间控制点
        context?.addCurve(to:  pto,control1: conp1, control2: conp2)
//        context?.addLine(to: CGPoint(x: 400, y: 0))
//        context?.closePath()
        UIColor.blue.setStroke()
//        context?.drawPath(using: CGPathDrawingMode.stroke)
        context?.strokePath()
        
        
        //画圆/椭圆
//        UIColor.red.setFill()
//        // 根据传人的矩形画出内切圆／椭圆
//        let aPath = UIBezierPath(ovalIn: CGRect(x: 40, y: 40, width: 100, height: 100)) // 如果传入的是正方形，画出的就是内切圆
////        let aPath = UIBezierPath(ovalIn: CGRect(x: 40, y: 40, width: 100, height: 160)) // 如果传入的是长方形，画出的就是内切椭圆
//        aPath.lineWidth = 5.0 // 线条宽度
////        aPath.stroke() // Draws line 根据坐标点连线，不填充
//        aPath.fill() // Draws line 根据坐标点连线，填充
    }
    
    func drawCircle(x:CGFloat , y:CGFloat){
        let radius:CGFloat=6
        let aPath = UIBezierPath(ovalIn: CGRect(x: x-radius, y: y-radius, width: radius*2, height: radius*2))
        aPath.fill()
    }
    
    func drawCircle(p:CGPoint){
        let radius:CGFloat=6
        let aPath = UIBezierPath(ovalIn: CGRect(x: p.x-radius, y: p.y-radius, width: radius*2, height: radius*2))
        aPath.fill()
    }
}
