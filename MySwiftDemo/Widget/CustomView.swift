//
//  CustomView.swift
//  MySwiftDemo
//
//  Created by 劳其恋 on 2019/5/26.
//  Copyright © 2019 劳其恋. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //1
        let p = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100))
        UIColor.blue.setFill()
        p.fill()
        
        //2
        let con = UIGraphicsGetCurrentContext()!
        con.addRect(CGRect(x: 110, y: 0, width: 100, height: 100))
        con.setFillColor(UIColor.red.cgColor)
        con.fillPath()
        
        //3 创建一个画板绘制在画板上，得到image
//        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 0)
//        let p2 = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100))
//        UIColor.brown.setFill()
//        p2.fill()
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
        //to do something with the image
        
        //4 创建一个画板绘制在画板上，得到image
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 0)
        let con2 = UIGraphicsGetCurrentContext()!
        con2.addRect(CGRect(x: 0, y: 0, width: 100, height: 100))
        con2.setFillColor(UIColor.red.cgColor)
        con2.fillPath()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
        //5
        UIGraphicsPushContext(ctx) //将ctx设置为当前context
        let p = UIBezierPath(ovalIn: CGRect(x: 0, y: 110, width: 100, height: 100))
        UIColor.blue.setFill()
        p.fill()
        UIGraphicsPushContext(ctx)
        
        //6
        ctx.addRect(CGRect(x: 110, y: 110, width: 100, height: 100))
        ctx.setFillColor(UIColor.red.cgColor)
        ctx.fillPath()
    }
    
}
