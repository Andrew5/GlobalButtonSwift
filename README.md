# GlobalButtonSwift

## Disclaimer
GlobalButtonSwift纯swift版本,实现全局按钮切换环境，仅为提供环境切换带来便捷入口

## Usage method 

```
        // 环境数据模版
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
            exit(0)
//            // 清理本地数据
//            DHGlobeAppManager.clearLocalData()
//             
//             // 模拟应用重启
//            DHGlobeAppManager.restartApp()
        }

```

## Installation

GlobalButtonSwift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GlobalButtonSwift',:git => 'git@github.com:Andrew5/GlobalButtonSwift.git'
```

## Author

Mr. Zhao, localhost3585@gmail.com

## License

GlobalButtonSwift is available under the MIT license. See the LICENSE file for more info.
