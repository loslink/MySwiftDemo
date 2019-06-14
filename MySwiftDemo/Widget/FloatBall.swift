//
//  FloatBall.swift
//  MySwiftDemo
//
//  Created by 劳其恋 on 2019/6/13.
//  Copyright © 2019 劳其恋. All rights reserved.
//

import UIKit

class FloatBall: UIView {
    
    var waveMaskLayer:CAShapeLayer?
    var circleLayer:CAShapeLayer?
    var waveHeight:CGFloat?
    // 波浪宽度系数a
    var waveRate: CGFloat = 0.1
    let offset:CGFloat=0.1
    var moveStep:CGFloat=0
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        initParam()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        initParam()
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initParam()
    }
    
    
    private func initParam() {
        waveMaskLayer = CAShapeLayer()
        waveMaskLayer?.frame = bounds
        waveMaskLayer?.frame.origin.y = self.frame.size.height/2
        waveHeight=self.frame.size.height/2
        waveMaskLayer?.frame.size.height = waveHeight!
//        waveMaskLayer?.fillRule = .evenOdd //除去mask
//        waveMaskLayer?.fillRule = .nonZero //交集
        
        circleLayer = CAShapeLayer()
        circleLayer?.frame = bounds
        circleLayer!.fillColor = UIColor.clear.cgColor
    }
    
    // 开始播放动画
    func start() {
        CADisplayLink.creatDisplayLink { (link) in
            self.draw(link:link)
        }
    }
    
    func draw(link:CADisplayLink){
        moveStep += offset
        
        layer.sublayers = nil
        layer.addSublayer(waveMaskLayer!)
        layer.addSublayer(circleLayer!)
        // 起点y坐标（没有波浪的一侧）
        let startY = waveMaskLayer?.frame.size.height
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: startY!))
        
        var x = CGFloat(0)
        var y = CGFloat(0)
        while x <= (waveMaskLayer?.frame.size.width)! {
            // 波浪曲线
            y = (waveHeight!/8) * sin(x * waveRate + moveStep)
            path.addLine(to: CGPoint(x: x, y: y))
            
            // 增量越小，曲线越平滑
            x += 0.1
        }
        
        // 回到起点对侧
        path.addLine(to: CGPoint(x: (waveMaskLayer?.frame.size.width)!, y: startY!))
        
        // 闭合曲线
        path.close()
        
        let circleRect=self.bounds
        let circlePatn=UIBezierPath(ovalIn: circleRect)
        waveMaskLayer?.path = path.cgPath
        circleLayer?.path = circlePatn.cgPath
        circleLayer?.fillColor = UIColor.red.cgColor
        
        //将渐变层的遮罩设置为进度条
        circleLayer?.mask = waveMaskLayer //交集
        
//        circleLayer?.shouldRasterize = false //默认false抗锯齿
//        waveMaskLayer?.shouldRasterize = false
        
        let ringLayer = CAShapeLayer()
        ringLayer.frame = circleRect
        layer.addSublayer(ringLayer)
        let ringPatn=UIBezierPath(ovalIn: circleRect)
        ringLayer.path = ringPatn.cgPath
        ringLayer.lineWidth = 4
        ringLayer.strokeColor = UIColor.red.cgColor
        ringLayer.fillColor = UIColor.clear.cgColor
    }
    
}
