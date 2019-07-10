//
//  GYWebViewViewController.swift
//  SwiftDemo
//
//  Created by lyons on 2019/5/29.
//  Copyright © 2019 lyons. All rights reserved.
//

import UIKit
import WebKit

class GYWebViewViewController: UIViewController {
    private var callback: Complated!
    private var url : String!

    lazy var webView: WKWebView! = {
        let webView = WKWebView()
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        callback = getExtra(Page.callback)!
        url = getExtra("url")
        webView.frame = CGRect(x: 0, y: 0, width: GYScreenWidth, height: GYScreenHeigth)
        view.addSubview(webView)
        webView.loadUrl(url)
    }
}

extension WKWebView {
    open func loadUrl(_ url: String) {
        let url = URL.init(string: url)!
        let request = URLRequest.init(url: url)
        load(request)
    }
}
