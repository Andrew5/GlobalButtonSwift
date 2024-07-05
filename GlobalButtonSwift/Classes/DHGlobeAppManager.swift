//
//  DHGlobeAppManager.swift
//  GlobalButtonSwift
//
//  Created by rillakkuma on 7/5/24.
//

import Foundation
import UIKit

open class DHGlobeAppManager {
    
    // 清理本地数据
    static func clearLocalData() {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
    }
    
    // 模拟应用重启
    static func restartApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if let window = UIApplication.shared.windows.first {
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let initialViewController = storyboard.instantiateInitialViewController()
                    window.rootViewController = initialViewController
                }) { completed in
                    exit(0)
                }
            }
        }
    }
}
