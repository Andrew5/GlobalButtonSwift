//
//  DHGlobalView.swift
//  GlobalButtonSwift_Example
//
//  Created by jabraknight on 2021/9/14.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

var screenW: CGFloat = 0
var screenH: CGFloat = 0
let buttonW: CGFloat = 40
let NavBar_H: CGFloat = 44 + 44
let BottomBar_H: CGFloat = 49 + 34

class DHGlobalView: UIWindow {
    
    var envstring: String?
    
    init(startPoint startingPosition: CGPoint) {
        
        let y = startingPosition.y
        super.init(frame: CGRect(x: 0, y: y, width: buttonW, height: buttonW))
        screenW = UIScreen.main.bounds.size.width
        screenH = UIScreen.main.bounds.size.height

        backgroundColor = UIColor.clear
        windowLevel = UIWindowLevelAlert
        layer.masksToBounds = true

        rootViewController = UIViewController()
        rootViewController?.view.addSubview(globalButton)

        let pan = UIPanGestureRecognizer(target:self,action:#selector(panAction(panGesture:)))
        addGestureRecognizer(pan)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var globalButton: UIButton = {
        
        let button = UIButton(type: UIButtonType.custom)
        button.frame = self.bounds
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = buttonW/2
        button.addTarget(self, action: #selector(tagAddAlert), for: .touchUpInside)
        return button
        
    }()
    
    @objc func tagAddAlert(){
        
        if ((DHHomeDataListView.instance?.isHidden) != nil) {
            DHHomeDataListView.instance?.show(aResultCallBack: { [self] (title: String?) in
                globalButton.setTitle(title, for: .normal)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "restart"), object: nil)
            })
        }else{
            DHHomeDataListView.instance?.hide()
        }
    }
    
    @objc func panAction(panGesture:UIPanGestureRecognizer) {
        
        let point = panGesture.translation(in: self)
        
        if panGesture.state == UIGestureRecognizerState.began{
           
        }else if panGesture.state == UIGestureRecognizerState.changed{
            
            if self.frame.origin.x + point.x <= 0 || self.frame.origin.x + point.x >= screenW - self.frame.size.width {
                if self.frame.origin.y + point.y <= NavBar_H || self.frame.origin.y + point.y >= screenH - BottomBar_H - self.frame.size.height - 44  {
                    self.transform = transform.translatedBy(x: 0, y: 0)
                }else {
                    self.transform = transform.translatedBy(x: 0, y: point.y)
                    panGesture.setTranslation(CGPoint.zero, in: self)
                }
            }else if self.frame.origin.y + point.y <= NavBar_H || self.frame.origin.y + point.y >= screenH - BottomBar_H - self.frame.size.height - 44 {
                if self.frame.origin.x + point.x <= 0 || self.frame.origin.x + point.x >= screenW - self.frame.size.width {
                    self.transform = transform.translatedBy(x: 0, y: 0)
                }else {
                    self.transform = transform.translatedBy(x: point.x, y: 0)
                    panGesture.setTranslation(CGPoint.zero, in: self)
                }
            }else {
                self.transform = transform.translatedBy(x: point.x, y: point.y)
                panGesture.setTranslation(CGPoint.zero, in: self)
            }
        }else { // 手离开屏幕
            if (self.frame.origin.x >= screenW / 2.0 - self.frame.size.width / 2) {
                UIView.animate(withDuration: 0.3, animations: { [self] in
                    frame = CGRect(x: screenW - frame.size.width, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
                })
            } else {
                UIView.animate(withDuration: 0.3, animations: { [self] in
                    frame = CGRect(x: 0, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
                })
            }
        }
    }
    
    @objc override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if self.isUserInteractionEnabled == false || self.alpha < 0.05 || self.isHidden == true {
            return nil;
        }
        
        if self.point(inside: point, with: event) {
            for subView in self.subviews {
                let coverPoint = subView.convert(point, from: self)
                let hitTestView = subView.hitTest(coverPoint, with: event)
                if (hitTestView != nil) {
                    return hitTestView
                }
            }
            return self
        }
        return nil
    }
}
