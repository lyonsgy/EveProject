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
    
    let cellID = "cell"
    var list: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //不想在 tabbarItem 上显示 title 就使用 navigationItem 的方法
        self.navigationItem.title = "首页"
        
        self.list = ["GYGaussianBlurViewController","GYGradualNaviViewController"]
        
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
        let className = self.list[indexPath.row]
        let type = Router(rawValue: className)
        cell?.textLabel?.text = type?.title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let className = self.list[indexPath.row]
        let type = Router(rawValue: className)
        guard let target = type else {
            return
        }
        Page.jump(from: self, to: target, with: ["status" : "ON"]) { (params) in
            print(params)
        }
    }
    
}
