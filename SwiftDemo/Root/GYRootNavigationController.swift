//
//  GYRootNavigationController.swift
//  EveProject
//
//  Created by lyons on 2018/12/29.
//  Copyright © 2018 lyons. All rights reserved.
//

import UIKit

class GYRootNavigationController: UINavigationController {
    
}

extension GYRootNavigationController
{
    override func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        //设置如果跳转页面不为第一页，隐藏tabbar
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
