//
//  ViewController.swift
//  MySwiftDemo
//
//  Created by 劳其恋 on 2019/5/16.
//  Copyright © 2019 劳其恋. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    lazy var scrollview:UIScrollView={
        var scroll=UIScrollView()
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scroll.backgroundColor = UIColor.clear
        scroll.indicatorStyle = UIScrollView.IndicatorStyle.white
        scroll.bounces = true
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = true
        return scroll
    }()
    
    lazy var button1:UIButton={
        var bt=UIButton()
        bt.setTitle("动画", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bt.backgroundColor = UIColor.blue
        bt.layer.cornerRadius=8
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(scrollview)
        scrollview.delegate = self
        scrollview.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.snp.height).offset(-30)
        }
        scrollview.addSubview(button1)
        button1.addTarget(self, action: Selector("button1Click"), for: .touchUpInside)
        button1.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(20)
            make.height.equalTo(50)
            make.width.equalToSuperview().offset(-40)
        }
    }
    
    @objc func button1Click(){
        print("button1")
        navigationController?.pushViewController(AnimateViewController(), animated: true)
    }

    //只要滚动一直触发contentOffset变化
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("只要滚动就会触发")
    }
    //用户开始拖动scrollview时候被调用
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("开始拖拽试图")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("结束滚动")
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("将要开始减速")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("减速停止了时执行，手触摸时执行执行")
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("滚动动画停止时执行,代码改变时触发,也就是setContentOffset改变时")
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("完成放大缩小时调用")
    }

}

