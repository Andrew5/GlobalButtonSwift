//
//  ViewController.swift
//  GlobalButtonSwift
//
//  Created by Mr. Zhao on 09/14/2021.
//  Copyright (c) 2021 Mr. Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        func viewDidLoad() {
            super.viewDidLoad()

        }
        demo(name: "", age: 16)

        func demo(name: String?, age: Int?) {
            /*
             'name'至此会有两个
              * 1.String  name('guard let'守护,等号右边的'name')
              * 2.String? name('guard let'守护,等号右边的'name')
              * 3.这里正常应该选择不带'?'的'name',但是即便是选择了('Optional'的'name'),编译器也会帮你更正过来,这就是取名的技巧
             */
            guard let name = name,
                let age = age else {
                print("姓名或年龄为nil")
                return
            }
            print(name + String(age))   // 输出:老王11('name'和'age'为不带'Optional'的)
        }
        func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

