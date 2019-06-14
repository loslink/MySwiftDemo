//
//  MTextView.swift
//  MySwiftDemo
//
//  Created by 劳其恋 on 2019/6/12.
//  Copyright © 2019 劳其恋. All rights reserved.
//

import Foundation
import UIKit

class MTextView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear
        
        //要绘制的文字
        let str = "754"
        //文字样式属性
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        var shadow=NSShadow()
        shadow.shadowColor = UIColor.blue
        shadow.shadowBlurRadius = 4
        shadow.shadowOffset = CGSize(width: 3, height: 3)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 60),
            NSAttributedString.Key.foregroundColor: UIColor.orange,
            NSAttributedString.Key.backgroundColor: UIColor.clear,
            NSAttributedString.Key.kern: 10,//设定字符间距
//            NSAttributedString.Key.strikethroughColor: UIColor.white,
//            NSAttributedString.Key.strikethroughStyle: 1,
//            NSAttributedString.Key.strokeColor: UIColor.orange,
//            NSAttributedString.Key.strokeWidth: 1,
            NSAttributedString.Key.shadow: shadow,
            NSAttributedString.Key.paragraphStyle: style] as [NSAttributedString.Key : Any]
        var nstr=str as NSString
        //绘制在指定区域
        nstr.draw(in: self.bounds, withAttributes: attributes)
        //从指定点开始绘制
//        nstr.draw(at: CGPoint(x:0,y:0), withAttributes: attributes)
        
//        drawPatnText()
        
        colorText()
    }
    
    private func drawPatnText(){
        //获取绘图上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        //保存初始状态
        context.saveGState()
        
        //将坐标系系上下翻转
        context.textMatrix = CGAffineTransform.identity
        context.translateBy(x: 0, y: self.bounds.height)
        context.scaleBy(x: 1, y: -1)
        
        //创建并设置路径(排版区域)
        let path = CGMutablePath()
        //绘制椭圆
        path.addEllipse(in: self.bounds.insetBy(dx: 1, dy: 1))
        //绘制边框
        context.addPath(path)
        context.strokePath()
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 60),
                          NSAttributedString.Key.foregroundColor: UIColor.orange,
                          NSAttributedString.Key.backgroundColor: UIColor.clear,
                          NSAttributedString.Key.kern: 10] as [NSAttributedString.Key : Any]
        
        //根据framesetter和绘图区域创建CTFrame
        let str = "欢迎访问hangge.com!欢迎访问hangge.com!欢迎访问hangge.com!欢迎访问hangge.com!欢迎访问hangge.com!欢迎访问hangge.com!欢迎访问hangge.com!"
        let attrString = NSAttributedString(string:str,attributes: attributes)
        let framesetter = CTFramesetterCreateWithAttributedString(attrString)
        let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrString.length),
                                             path, nil)
        
        
        //使用CTFrameDraw进行绘制
        CTFrameDraw(frame, context)
        
        //恢复成初始状态
        context.restoreGState()
    }
    
    func colorText(){
        //创建用于放置文本标签和渐变层的view
        let container = UIView(frame:CGRect(x:10, y:400, width:300, height:70))
        addSubview(container)
        
        //创建文本标签
        let label = UILabel(frame:CGRect(x:0, y:0, width:300, height:70))
        label.text = "hello world"
        label.font = UIFont.boldSystemFont(ofSize: 52.0)
        container.addSubview(label)
        
        //创建渐变层
        //定义渐变的颜色（从黄色渐变到橙色）
        let topColor = UIColor(red: 0xfe/255, green: 0xd3/255, blue: 0x2f/255, alpha: 1)
        let buttomColor = UIColor(red: 0xfc/255, green: 0x68/255, blue: 0x20/255, alpha: 1)
        let gradientColors = [topColor.cgColor, buttomColor.cgColor]
        
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        
        //创建CAGradientLayer对象并设置参数
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        //设置其CAGradientLayer对象的frame，并插入container的layer
        gradientLayer.frame = label.frame
        container.layer.insertSublayer(gradientLayer, at: 0)
        
        //将渐变层的遮罩设置为label
        gradientLayer.mask = label.layer
    }
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
    }
    
}
