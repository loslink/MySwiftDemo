//
//  File.swift
//  HoroscopeIOS
//
//  Created by 劳其恋 on 2019/5/29.
//  Copyright © 2019 Dotc. All rights reserved.
//

import Foundation
import UIKit
extension CADisplayLink {
    
    // RunTime绑定的键值
    struct UnSafePointString {
        static let key = UnsafeRawPointer(bitPattern: "closures".hashValue)
    }
    
    // RUntime进行属性绑定
    static var closures : [((CADisplayLink) -> Void)]? {
        get {
            return objc_getAssociatedObject(self, UnSafePointString.key!) as? [(CADisplayLink) -> Void]
        }
        set(newValue) {
            objc_setAssociatedObject(self, UnSafePointString.key!, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    //定时器的创建 全局是能调用一次（局限key覆盖）
    static func creatDisplayLink(action:((CADisplayLink) -> Void)?) -> CADisplayLink{
        
        if action != nil {
            
            if self.closures != nil {
                self.closures?.append(action!)
            }else{
                self.closures = [((CADisplayLink) -> Void)]()
                self.closures?.append(action!)
            }
            
        }
        
        let displayLinks = CADisplayLink(target: self, selector: #selector(startTime(_:)))
        displayLinks.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
        
        return displayLinks
    }
    
    
    // 闭包回调 实现计时
    @objc static func startTime(_ displayLink:CADisplayLink){
        
        if  let clo = closures {
            for item in clo{
                item(displayLink)
            }
        }
        
    }
    
    // 定时器的销毁
    func removeFromRunLoop()  {
        self.invalidate()
    }
    
}
