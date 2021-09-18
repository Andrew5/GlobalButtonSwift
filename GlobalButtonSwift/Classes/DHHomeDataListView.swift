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
    
    typealias resultCallBack = (_ title: String?) ->() //声明闭包
    var buttontitleCallBlock : resultCallBack?//闭包声明为属性

    //单例
    static var instance: DHHomeDataListView? = {
        var instance = DHHomeDataListView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        return instance
    }()

    class func shareInstance() -> DHHomeDataListView? {

        return instance
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        windowLevel = UIWindowLevelStatusBar - 1.0
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
    func show(aResultCallBack resultCallBack:@escaping resultCallBack){
        self.buttontitleCallBlock = resultCallBack;
//    open func show(resultBack:@escaping locationCallBack) {
        let listView = UIView()
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
        changeEnvironmentWithTag(segment.currentTitle!)
        hide();
        self.buttontitleCallBlock!(DHGlobeManager.envstring!)
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
        if envKeys.count <= 0 {
            return;
        }
        var currentIndex: NSInteger = 0
        if envKeys.contains(title) {
            currentIndex = envKeys.index(of: title)!
        }
        let nextEnvIndex: NSInteger = (currentIndex ) % envKeys.count;
        let currentEnv: String = envKeys[nextEnvIndex];
        UserDefaults.standard.setValue(currentEnv, forKey: "TAG")
        DHGlobeManager.envstring = currentEnv
        DHGlobeManager.selectedEnvMap = DHGlobeManager.envMap[title]!
    }
}
