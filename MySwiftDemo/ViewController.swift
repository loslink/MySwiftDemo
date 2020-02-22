//
//  ViewController.swift
//  MySwiftDemo
//  Created by 劳其恋 on 2019/5/16.
//  Copyright © 2019 劳其恋. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    let BUTTON_HEIGHT=50
    
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
    
    lazy var button2:UIButton={
        var bt=UIButton()
        bt.setTitle("自定义view", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bt.backgroundColor = UIColor.blue
        bt.layer.cornerRadius=8
        return bt
    }()
    
    lazy var button3:UIButton={
        var bt=UIButton()
        bt.setTitle("文字", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bt.backgroundColor = UIColor.blue
        bt.layer.cornerRadius=8
        return bt
    }()
    
    lazy var button4:UIButton={
        var bt=UIButton()
        bt.setTitle("温度进度", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bt.backgroundColor = UIColor.blue
        bt.layer.cornerRadius=8
        return bt
    }()
    
    lazy var button5:UIButton={
        var bt=UIButton()
        bt.setTitle("波浪", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bt.backgroundColor = UIColor.blue
        bt.layer.cornerRadius=8
        return bt
    }()
    
    lazy var button6:UIButton={
        var bt=UIButton()
        bt.setTitle("多路径绘图", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bt.backgroundColor = UIColor.blue
        bt.layer.cornerRadius=8
        return bt
    }()
    
    lazy var button7:UIButton={
        var bt=UIButton()
        bt.setTitle("波浪球", for: .normal)
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
            make.height.equalTo(BUTTON_HEIGHT)
            make.width.equalToSuperview().offset(-40)
        }
        
        scrollview.addSubview(button2)
        button2.addTarget(self, action: Selector("button2Click"), for: .touchUpInside)
        button2.snp.makeConstraints { (make) in
            make.top.equalTo(button1.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(BUTTON_HEIGHT)
            make.width.equalToSuperview().offset(-40)
        }
        
        scrollview.addSubview(button3)
        button3.addTarget(self, action: Selector("button3Click"), for: .touchUpInside)
        button3.snp.makeConstraints { (make) in
            make.top.equalTo(button2.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(BUTTON_HEIGHT)
            make.width.equalToSuperview().offset(-40)
        }
        
        scrollview.addSubview(button4)
        button4.addTarget(self, action: Selector("button4Click"), for: .touchUpInside)
        button4.snp.makeConstraints { (make) in
            make.top.equalTo(button3.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(BUTTON_HEIGHT)
            make.width.equalToSuperview().offset(-40)
        }
        
        scrollview.addSubview(button5)
        button5.addTarget(self, action: Selector("button5Click"), for: .touchUpInside)
        button5.snp.makeConstraints { (make) in
            make.top.equalTo(button4.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(BUTTON_HEIGHT)
            make.width.equalToSuperview().offset(-40)
        }
        
        scrollview.addSubview(button6)
        button6.addTarget(self, action: Selector("button6Click"), for: .touchUpInside)
        button6.snp.makeConstraints { (make) in
            make.top.equalTo(button5.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(BUTTON_HEIGHT)
            make.width.equalToSuperview().offset(-40)
        }
        
        scrollview.addSubview(button7)
        button7.addTarget(self, action: Selector("button7Click"), for: .touchUpInside)
        button7.snp.makeConstraints { (make) in
            make.top.equalTo(button6.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(BUTTON_HEIGHT)
            make.width.equalToSuperview().offset(-40)
        }
    }
    
    @objc func button1Click(){
        navigationController?.pushViewController(AnimateViewController(), animated: true)
    }
    
    @objc func button2Click(){
        navigationController?.pushViewController(DrawViewController(), animated: true)
    }
    
    @objc func button3Click(){
        let vc=CustomViewController()
        vc.extra = CustomViewController.EXTRA_TEXT
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func button4Click(){
        let vc=CustomViewController()
        vc.extra = CustomViewController.EXTRA_TEMP
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func button5Click(){
        let vc=CustomViewController()
        vc.extra = CustomViewController.EXTRA_WAVE
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func button6Click(){
        let vc=CustomViewController()
        vc.extra = CustomViewController.EXTRA_MUTI_PATH
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func button7Click(){
        let vc=CustomViewController()
        vc.extra = CustomViewController.EXTRA_FLOAT_BALL
        navigationController?.pushViewController(vc, animated: true)
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

    func onBuyBtnClick(_ sender: Any) {
        
        SwiftyStoreKit.purchaseProduct("商品ID", quantity: 3, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                
                let receipt = AppleReceiptValidatorX(service: .production)
                let password = "公共秘钥在 itunesConnect App 内购买项目查看"
                SwiftyStoreKit.verifyReceipt(using: receipt, password: password, completion: { (result) in
                    switch result {
                    case .success(let receipt):
                        print("receipt--->\(receipt)")
                        break
                    case .error(let error):
                        print("error--->\(error)")
                        break
                    }
                })
                
            case .error(let error):
                switch error.code {
                case .unknown: print("Unknown error. Please contact support")
                case .clientInvalid: print("Not allowed to make the payment")
                case .paymentCancelled: break
                case .paymentInvalid: print("The purchase identifier was invalid")
                case .paymentNotAllowed: print("The device is not allowed to make the payment")
                case .storeProductNotAvailable: print("The product is not available in the current storefront")
                case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
                case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
                case .cloudServiceRevoked: print("User has revoked permission to use this cloud service")
                case .privacyAcknowledgementRequired: print("Unknown error. privacyAcknowledgementRequired")
                case .unauthorizedRequestData: print("Unknown error. unauthorizedRequestData")
                case .invalidOfferIdentifier: print("Unknown error. invalidOfferIdentifier")
                case .invalidSignature: print("Unknown error. invalidSignature")
                case .missingOfferParams: print("Unknown error. missingOfferParams")
                case .invalidOfferPrice: print("Unknown error. invalidOfferPrice")
                }
            }
        }
    }
    
    func getList() {
        SwiftyStoreKit.retrieveProductsInfo(["商品ID"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
            } else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            } else {
                print("Error: \(result.error)")
            }
        }
    }
}

