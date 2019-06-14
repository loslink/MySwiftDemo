//
//  CustomViewController.swift
//  MySwiftDemo
//
//  Created by 劳其恋 on 2019/6/12.
//  Copyright © 2019 劳其恋. All rights reserved.
//

import UIKit
import Foundation

class CustomViewController:  UIViewController{
    
    var extra:Int=0
    static let EXTRA_TEXT = 1
    static let EXTRA_TEMP = 2
    static let EXTRA_WAVE = 3
    static let EXTRA_MUTI_PATH = 4
    static let EXTRA_FLOAT_BALL = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let text=MTextView()
        view.addSubview(text)
        text.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.left.right.bottom.equalToSuperview()
        }
        text.isHidden = true
        
        //创建并添加温度计组件
        let meter = TemperatureMeter()
        self.view.addSubview(meter)
        meter.setPercent(percent: CGFloat(50))
        meter.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        meter.isHidden = true
        
        let mutiPath = MyMutiPath()
        self.view.addSubview(mutiPath)
        mutiPath.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        mutiPath.isHidden = true
        
        let floatBall = FloatBall()
        self.view.addSubview(floatBall)
        floatBall.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        floatBall.isHidden = true
        
        switch extra {
        case CustomViewController.EXTRA_TEXT:
            text.isHidden = false
        case CustomViewController.EXTRA_TEMP:
            meter.isHidden = false
        case CustomViewController.EXTRA_WAVE:
            wave()
        case CustomViewController.EXTRA_MUTI_PATH:
            mutiPath.isHidden = false
        case CustomViewController.EXTRA_FLOAT_BALL:
            floatBall.isHidden = false
            floatBall.start()
        default:
            break
        }
    }
    
    func wave(){
        // 创建文本标签
        let label = UILabel()
        label.text = "正在加载中......"
        label.textColor = .black
        label.textAlignment = .center
        label.frame = CGRect(x: (screenWidth() * 0.5 - 100), y: 0, width: 200, height: 50)
        
        // 创建波浪视图
        let waveView = WaveView(frame: CGRect(x: 0, y: 200, width: screenWidth(),
                                              height: 130))
        // 波浪显示在上方
        waveView.waveOnBottom = false
        // 波浪动画回调
        waveView.closure = {centerY in
            // 同步更新文本标签的y坐标
            label.frame.origin.y = waveView.frame.height + centerY
        }
        
        // 添加两个视图
        self.view.addSubview(waveView)
        self.view.addSubview(label)
        
        // 开始播放波浪动画
        waveView.startWave()
    }
    
    // 返回当前屏幕宽度
    func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
}
