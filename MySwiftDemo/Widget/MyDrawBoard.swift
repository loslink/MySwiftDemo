//
//  MyDrawBoard.swift
//  MySwiftDemo
//
//  Created by 劳其恋 on 2019/5/16.
//  Copyright © 2019 劳其恋. All rights reserved.
//

import Foundation
import UIKit

class MyView: UIView {
    
    var uiImage:CGImage? = UIImage(named: "004.jpg")?.cgImage
    var path = CGMutablePath()
    //----简易画板-----
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

//        var p=touches.first?.location(in: self)
//        var context = UIGraphicsGetCurrentContext()
//        context?.addLine(to: p ?? <#default value#>)
        
        //获取点击的坐标位置
        for touch:AnyObject in touches {
            let t:UITouch = touch as! UITouch
            print(t.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

//        var p=touches.first?.location(in: self)
//        var context = UIGraphicsGetCurrentContext()
//        context?.addLine(to: p ?? <#default value#>)
//        //执行重绘的操作
//        setNeedsDisplay()
        
        //获取点击的坐标位置
        for touch:AnyObject in touches {
            let t:UITouch = touch as! UITouch
            print("touchesMoved: \(t.location(in: self))")
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        
        //        CGContextSetRGBStrokeColor(context, 1, 0, 1, 1)//设置线的颜色
        //        CGContextSetLineWidth(context, 5)//设置线的宽度
        //        CGContextStrokePath(context)
        //
        //        /*----fillpath为填充StrokePath为画线----*/
        //
        //        //画线
        //        CGContextMoveToPoint(context, 100, 100)
        //        CGContextAddLineToPoint(context, 100, 200)
        //        CGContextAddLineToPoint(context, 200, 200)
        //        CGContextStrokePath(context)
        //
        //        CGContextMoveToPoint(context, 100, 300)
        //        CGContextAddLineToPoint(context, 100, 400)
        //        CGContextAddLineToPoint(context, 200, 500)
        //        CGContextStrokePath(context)
        //
        //        //画方块
        //        CGContextAddRect(context, CGRect(x: 200, y: 100, width: 100, height: 100))
        //        CGContextSetRGBFillColor(context, 1, 0, 0, 1)//改变方块的颜色
        //        /*--先把方块添加进去然后加边框，否则只显示边框--*/
        //        CGContextFillPath(context)
        //        CGContextStrokeRect(context, CGRect(x: 200, y: 100, width: 100, height:100))
        //
        //        //画圆---弧线
        //        CGContextAddArc(context, 220, 350, 100, 0, 3.14*2, 0)
        //        CGContextSetRGBFillColor(context, 1, 0, 0, 1)
        //        CGContextFillPath(context)
        //
        //        CGContextAddArc(context, 220, 350, 100, 0, 3.14*2, 0)//最后的0为顺时针，1为逆时针
        //        CGContextStrokePath(context)
        //        //---椭圆---宽高相等为圆形，宽高不等为椭圆
        //        CGContextAddEllipseInRect(context, CGRect(x: 50, y: 450, width: 200, height: 200))
        //        CGContextStrokePath(context)
        //
        //        //------画图片
        //        //保存context------如果不保存与恢复图形会影响到后续的画图
        //        CGContextSaveGState(context)
        //        //画布的调整
        //        CGContextTranslateCTM(context, 10, 400)
        //        CGContextScaleCTM(context, 1, -1)
        //        CGContextDrawImage(context, CGRect(x: 100, y: 100, width: 200, height: 200), uiImage)
        //        //恢复context
        //        CGContextRestoreGState(context)
        
        
        //------简易画板
        //画板上的简单画线
        //        var path = CGPathCreateMutable()
        //        CGPathMoveToPoint(path, nil, 100, 100)
        //        CGPathAddLineToPoint(path, nil, 200, 200)
//        (context ?? <#default value#>).addPath(path)
//        (context ?? <#default value#>).strokePath()
    }
    
}
