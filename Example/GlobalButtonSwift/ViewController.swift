//
//  ViewController.swift
//  GlobalButtonSwift
//
//  Created by Mr. Zhao on 09/14/2021.
//  Copyright (c) 2021 Mr. Zhao. All rights reserved.
//

import UIKit
import GlobalButtonSwift

class ViewController: UIViewController {
    @objc
    static var baseURLString = "https://api-uat.bnto.rent"
    
    fileprivate let submitButton: UIButton = {
        let label = UIButton()
        label.titleLabel?.textAlignment = .center
        label.setTitle("JOIN NOW", for: .normal)
        label.setTitleColor(UIColor.black, for: .normal)
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(joinnowAction(_:)), for: .touchUpInside)
        
//        let dictUAT:[String:String] = ["devbaseURLString":"https://api-uat.bnto.rent"]
//        let dictPRO:[String:String] = ["baseURLString":"https://api.bnto.rent"]
//        
//        let dict:[String:Dictionary<String, String>] = ["UAT":dictUAT, "PRO":dictPRO]
//        
//        GlobalButtonSwift.DHGlobeManager.shared.setEnvironmentMap(dict, currectEnvironment: "UAT")
//        GlobalButtonSwift.DHGlobeManager.shared.restartBlock = { restartBlock in
//            print("设置完环境需要清理本地数据并关闭该应用 \(restartBlock)---\(type(of: restartBlock))")
//        }
//        // 获取当前环境的标识，比如 "UAT" 或 "PRO"
////        let currentEnvironment = GlobalButtonSwift.DHGlobeManager.envstring
//
//        // 获取当前环境对应的配置字典
//        let currentEnvironmentConfig = GlobalButtonSwift.DHGlobeManager.selectedEnvMap
//
//        // 设想使用场景：获取当前环境的 HostDomain
//        if let hostDomain = currentEnvironmentConfig["devbaseURLString"] {
//            print("当前环境的HostDomain为: \(hostDomain)")
//            ViewController.baseURLString = hostDomain
//        }
        
        
    }
    @objc
    func joinnowAction(_ sender: UIButton) {
        loadEnvironment()
    }
    func loadEnvironment(){
        // 获取当前环境的标识，比如 "UAT" 或 "PRO"
        let currentEnvironment = DHGlobeManager.envstring

        // 获取当前环境对应的配置字典
        let currentEnvironmentConfig = DHGlobeManager.selectedEnvMap

        // 设想使用场景：获取当前环境的 HostDomain
        if let hostDomain = currentEnvironmentConfig["devbaseURLString"] {
            print("当前环境的HostDomain为: \(hostDomain)---\(String(describing: currentEnvironment))")
        }
        print("ViewController.baseURLString\(ViewController.baseURLString)")

    }

    func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

