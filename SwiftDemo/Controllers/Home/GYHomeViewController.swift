//
//  GYHomeViewController.swift
//  SwiftDemo
//
//  Created by lyons on 2019/1/31.
//  Copyright © 2019 lyons. All rights reserved.
//

import UIKit
import Kingfisher
import Accelerate

class GYHomeViewController: GYRootViewController {

    @IBOutlet weak var tableView: UITableView!
    struct item {
        var title: String
        var className: String
    }
    let cellID = "cell"
    var list: Array<item> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //不想在 tabbarItem 上显示 title 就使用 navigationItem 的方法
        self.navigationItem.title = "首页"
        
        self.list = [item(title: "高斯模糊", className: "GYGaussianBlurViewController"),
                     item(title: "渐变导航", className: "GYGaussianBlurViewController")]
        
        // 2.设置数据源代理
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // 4.注册cell
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}

extension GYHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = self.list[indexPath.row].title
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let className = self.list[indexPath.row].className
        self.navigationController?.pushViewController(className.stringChangeToVC()!, animated: true)
        print("点击了\(indexPath.row)")
    }
    
}
