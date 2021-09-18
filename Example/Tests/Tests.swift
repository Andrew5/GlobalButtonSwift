import XCTest
import GlobalButtonSwift
//@testable import DHGlobeManager

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testEnv(){
//        //环境数据模版
//        let dictUAT:[String:String] = ["HostDomain":"我是UAT环境网络Domain接口","HostURL":"我是UAT环境网络URL接口","HtmlURL":"我是UAT环境H5URL"]
//        let dictPRO:[String:String] = ["HostDomain":"我是PRO环境网络Domain接口","HostURL":"我是PRO环境网络URL接口","HtmlURL":"我是PRO环境H5URL"]
//        let dictSIT:[String:String] = ["HostDomain":"我是SIT环境网络Domain接口","HostURL":"我是SIT环境网络URL接口","HtmlURL":"我是SIT环境H5URL"]
//
//        let dict:[String:Dictionary<String, String>] = ["UAT":dictUAT, "PRO":dictPRO, "SIT":dictSIT]
//        DHGlobeManager.shared.setEnvironmentMap(dict, currectEnvironment: "UAT")
//        DHGlobeManager.shared.restartBlock = {restartBlock in
//            print("设置完环境需要清理本地数据并关闭该应用 \(restartBlock)")
//        }
//    }
//    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
