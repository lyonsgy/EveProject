//
//  GYHomeViewController.swift
//  SwiftDemo
//
//  Created by lyons on 2019/1/31.
//  Copyright © 2019 lyons. All rights reserved.
//

import UIKit

class GYHomeViewController: GYRootViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //不想在 tabbarItem 上显示 title 就使用 navigationItem 的方法
        self.navigationItem.title = "首页"
        
        self.label.gy_top = 150
        self.label.gy_left = 50
        self.label.gy_bottom = 150
        self.label.gy_right = 50
    }

}
