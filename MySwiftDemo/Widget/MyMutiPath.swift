//
//  MyMutiPath.swift
//  MySwiftDemo
//
//  Created by 劳其恋 on 2019/6/13.
//  Copyright © 2019 劳其恋. All rights reserved.
//

import UIKit

class MyMutiPath: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //设置背景色为透明，否则是黑色背景
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //为两个组成部分定义矩形
        let squareRect = self.bounds.insetBy(dx: self.bounds.size.width * 0.05,
                                             dy: self.bounds.size.height * 0.45)
        
        let circleRect = self.bounds.insetBy(dx: self.bounds.size.width * 0.3,
                                             dy: self.bounds.size.height * 0.3)
        
        //创建一条空Bezier路径作为主路径
        let bezierPath = UIBezierPath()
        
        //创建子路径
        let circlePath = UIBezierPath(ovalIn: circleRect)
        let squarePath = UIBezierPath(roundedRect: squareRect, cornerRadius: 20)
        let arcPath = UIBezierPath(arcCenter: CGPoint(x: bounds.midX-100, y: bounds.midY), radius: 50, startAngle: 0, endAngle: 190, clockwise: true)
        //将它们添加到主路径
        bezierPath.append(circlePath)
        bezierPath.append(squarePath)
//        bezierPath.append(arcPath)
        
        //设定颜色，并绘制它们
        UIColor.green.setFill()
        UIColor.black.setStroke()
        bezierPath.fill()
        //bezierPath.stroke()
    }
}
