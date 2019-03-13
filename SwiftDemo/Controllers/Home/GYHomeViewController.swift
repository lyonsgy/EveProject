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
        navigationItem.title = NSLocalizedString("首页", comment: "")
        
        setNaviBarItem()
        
        list = ["GYGaussianBlurViewController","GYGradualNaviViewController"]
        // 4.注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}

extension GYHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func setNaviBarItem() {
        // 在右侧添加一个按钮
        let barButtonItem = UIBarButtonItem(title: GYLanguageHelper.getLanguage(), style: UIBarButtonItem.Style.plain, target: self, action: #selector(change))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    @objc func change(){
        GYLanguageHelper.changeLanguage(language: language.en.rawValue)
        navigationItem.rightBarButtonItem?.title = GYLanguageHelper.getLanguage()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        let className = list[indexPath.row]
        let type = Router(rawValue: className)
        cell?.textLabel?.text = type?.title
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let className = list[indexPath.row]
        let type = Router(rawValue: className)
        guard let target = type else {
            return
        }
        Page.jump(from: self, to: target, with: ["status" : "ON"]) { (params) in
            print(params)
        }
    }
    
}
