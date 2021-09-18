//
//  DHGlobeManager.swift
//  GlobalButtonSwift_Example
//
//  Created by jabraknight on 2021/9/14.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

public class DHGlobeManager: NSObject {
    
    typealias restartCallback = (Bool) ->Void //声明闭包

    var restartBlock : restartCallback?//闭包声明为属性
    var startingPosition: CGPoint?
    //?判断后再拆包,不确定有值的时候就可以用 ?
    //!强制拆包,确定有值的时候可以用 !
    //as? 向下转型
    var entryWindow: DHGlobalView?
//    在类中，存储型属性、计算型属性、方法用static修饰，是为类属性、类方法（静态属性、静态方法）。PS: 在使用类属性或类方法时，如果需要子类继承重写，则使用class关键字修饰。
    static var envstring: String?
    static var selectedEnvMap:[String:String] = ["one":"One"]

    //默认环境
    static var envMap = Dictionary<String, Dictionary<String, String>>()
    
    //单例
    static let shared = DHGlobeManager()

//    private override init() {}

    public override func copy() -> Any {
        return self // SingletonClass.shared
    }
    
    public override func mutableCopy() -> Any {
        return self // SingletonClass.shared
    }
    
    //闭包
    @objc fileprivate func callblock(){
        restartBlock?(true)
    }

    func install() {
        let defaultPosition = CGPoint(x: 0, y: UIScreen.main.bounds.size.height / 3.0)
        install(withStartingPosition: defaultPosition)
    }

    // MARK: -按钮初始化
    func install(withStartingPosition position: CGPoint) {
        startingPosition = position
        installWithCustom()
    }
    
    func installWithCustom() {
        initEntry(startingPosition!)
    }
    
    func initEntry(_ startingPosition: CGPoint) {
        
        entryWindow = DHGlobalView(startPoint: self.startingPosition!)
        entryWindow!.isHidden = false
        NotificationCenter.default.addObserver(self, selector: #selector(restart), name: NSNotification.Name(rawValue: "restart"), object: nil)
    }
    @objc func restart() -> Void {
        if (restartBlock != nil) {
            restartBlock!(true)
        }
    }
    func normalDataWithTag(_ tagStr:String) {
        
        var dict:[String:String] = ["one":"One"]
        var envStr :String = "环境"
        for (key, value) in DHGlobeManager.envMap.enumerated() {
            print("字典 key \(key) -  字典 (key, value) 对 \(value)")
//            var someVar = DHGlobeManager.shared.envMap[tagStr]
            print("类型：\(type(of: value))")
            print("默认环境标识：\(value.key)")
            print("对应环境值：\(String(describing: DHGlobeManager.envMap[tagStr]))")
            if value.key == tagStr {
                envStr = value.key
                dict = value.value
                break
            }
        }
        DHGlobeManager.envstring = envStr
        DHGlobeManager.selectedEnvMap = dict
        entryWindow?.globalButton .setTitle(tagStr, for: .normal)
    }
    
    func setEnvironmentMap(_ environmentMap: Dictionary<String, Dictionary<String, String>>, currectEnvironment: String) {
        
        install()
        
        DHGlobeManager.envMap = environmentMap
        if ((DHGlobeManager.envstring?.isEmpty) == nil) {
            DHGlobeManager.envstring = (UserDefaults.standard.object(forKey: "TAG") != nil) ? UserDefaults.standard.object(forKey: "TAG") as? String : currectEnvironment
            normalDataWithTag(DHGlobeManager.envstring!)
            return;
        }
        DHGlobeManager.envstring = DHGlobeManager.envstring;
    }
}
    


    
