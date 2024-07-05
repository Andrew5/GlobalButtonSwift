//
//  AppDelegate.swift
//  GlobalButtonSwift
//
//  Created by Mr. Zhao on 09/14/2021.
//  Copyright (c) 2021 Mr. Zhao. All rights reserved.
//

import UIKit
import GlobalButtonSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //环境数据模版
        let dictUAT:[String:String] = ["baseURLString":"https://api-uat.baidu.v1"]
        let dictPRO:[String:String] = ["baseURLString":"https://api.baidu.v1"]
        
        let dict:[String:Dictionary<String, String>] = ["UAT":dictUAT, "PRO":dictPRO]
        
        GlobalButtonSwift.DHGlobeManager.shared.setEnvironmentMap(dict, currectEnvironment: "UAT")
       
        GlobalButtonSwift.DHGlobeManager.shared.restartBlock = { restartBlock in
            print("设置完环境需要清理本地数据并关闭该应用 \(restartBlock)---\(type(of: restartBlock)) --这里执行EXIT")
            // 获取当前环境对应的配置字典
            let currentEnvironmentConfig = GlobalButtonSwift.DHGlobeManager.selectedEnvMap

            // 设想使用场景：获取当前环境的 HostDomain
            if let hostDomain = currentEnvironmentConfig["baseURLString"] {
                print("当前环境的baseURLString为: \(hostDomain)")
                ViewController.baseURLString = hostDomain
            }
//            // 清理本地数据
//            DHGlobeAppManager.clearLocalData()
//             
//             // 模拟应用重启
//            DHGlobeAppManager.restartApp()
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
//        print("当前环境配置：\(DHGlobeManager.selectedEnvMap)")
//        print("当前环境标识：\(String(describing: DHGlobeManager.envstring))")

        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

