//
//  DHHomeDataListView.swift
//  GlobalButtonSwift_Example
//
//  Created by jabraknight on 2021/9/16.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit


class DHHomeDataListView: UIWindow {
    
    typealias ResultCallBack = (_ title: String?) -> Void // 声明闭包

    var buttontitleCallBlock: ResultCallBack? // 闭包声明为属性

    let listView = UIView()
    //单例
    static var instance: DHHomeDataListView? = {
        var instance = DHHomeDataListView(frame: UIScreen.main.bounds)
        return instance
    }()

    private override init(frame: CGRect) {
        super.init(frame: frame)
        windowLevel = UIWindow.Level.statusBar - 1.0
        backgroundColor = UIColor.clear
        isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func copy() -> Any {
        return self // SingletonClass.shared
    }
    
    override func mutableCopy() -> Any {
        return self // SingletonClass.shared
    }
    
    func show(resultCallBack: @escaping ResultCallBack) {
        self.buttontitleCallBlock = resultCallBack
//    open func show(resultBack:@escaping locationCallBack) {
        addSubview(listView)
        let H: CGFloat = 200
        listView.frame = CGRect(x: 20, y: center.y - H / 2, width: frame.size.width - 20 * 2, height: H)
        listView.backgroundColor = UIColor.orange
        listView.layer.cornerRadius = 10
        let subviewHeight: CGFloat = 30
        let subviewX: CGFloat = 10
        let subviewY: CGFloat = 10
        let subviewSpace: CGFloat = 10

        for (index, item) in DHGlobeManager.envMap.keys.enumerated() {
            let chooseEnvironment = UIButton(frame: CGRect(x: subviewX, y: subviewY + (subviewSpace + subviewHeight) * CGFloat(index), width: listView.frame.size.width - subviewX * 2, height: subviewHeight))
            chooseEnvironment.setTitle(item, for: .normal)
            chooseEnvironment.setTitleColor(UIColor.white, for: .normal)
            //一个闭包被作为一个参数传递给一个函数:逃逸闭包(本质就是一个参数)
//            chooseEnvironment.dh_addAction { (_ sender: UIButton) in
//                self.changeEnvironmentWithTag(item)
//                self.hide();
//                resultCallBack(item)
//            }
            //OK
//            chooseEnvironment.dh_addAction { [self] (_ sender: UIButton) in
//                changeEnvironmentWithTag(item)
//                hide();
//                resultCallBack(DHGlobeManager.envstring!)
//            }
            chooseEnvironment.addTarget(target, action: #selector(changeIndex(segment:)), for: .touchUpInside)
            listView.addSubview(chooseEnvironment)
        }
        isHidden = false
    }
    
    @objc func changeIndex(segment: UIButton) {
        guard let title = segment.currentTitle else { return }
        changeEnvironmentWithTag(title)
        hide();
        buttontitleCallBlock?(DHGlobeManager.envstring)
    }
    
    func hide() {
        
        if rootViewController?.presentedViewController != nil {
            rootViewController?.presentedViewController?.dismiss(animated: false)
        }
        isHidden = true
    }
    
    func changeEnvironmentWithTag(_ title: String) -> Void {
        
        var envKeys = [String]()
        for item in DHGlobeManager.envMap.keys {
            envKeys.append(item)
        }
        if envKeys.isEmpty {
                   return
               }
        var currentIndex: Int = 0
        if envKeys.contains(title) {
            currentIndex = envKeys.firstIndex(of: title)!
        }
        let nextEnvIndex: NSInteger = (currentIndex ) % envKeys.count;
        let currentEnv: String = envKeys[nextEnvIndex];
        UserDefaults.standard.setValue(currentEnv, forKey: "TAG")
        DHGlobeManager.envstring = currentEnv
        DHGlobeManager.selectedEnvMap = DHGlobeManager.envMap[title]!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        listView.backgroundColor = UIColor.randomColor()
    }
}
extension UIColor {
    public static func randomColor() -> UIColor {
        let ran = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        return ran
    }
}
