//
//  ViewController.swift
//  WBAlertView
//
//  Created by Zwb on 16/4/9.
//  Copyright © 2016年 zwb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.title="WBAlertView"
        
        // 初始化
        let alert=WBAlertView()

        // 设置属性(可不设置)
        alert.color=UIColor.cyanColor()  // 设置背景颜色，默认为天蓝色
        alert.font=15   // 设置字体大小，默认为17
        alert.disTime=3.0  // 设置需要持续显示的时间，默认为1.5s
        
        // 显示
        alert.showTop("这只是一个测试!") // 顶部显示
//        alert.showBottom("这只是一个测试!")  // 底部显示
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

