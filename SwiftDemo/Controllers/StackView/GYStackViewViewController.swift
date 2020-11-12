//
//  GYStackViewViewController.swift
//  SwiftDemo
//
//  Created by lyons on 2020/11/11.
//  Copyright © 2020 lyons. All rights reserved.
//

import UIKit

class GYStackViewViewController: UIViewController {
    private lazy var stackView: UIStackView = {
        let stackView  = UIStackView.init(arrangedSubviews: [redView, greenView, blueView])
        // item间距
        stackView.spacing = 30
        // 水平方向布局
        stackView.axis = .horizontal
        // 底部对齐
        stackView.alignment = .bottom
        // 等间距
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var redView: UIView = {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }
        return redView
    }()
    
    private lazy var greenView: UIView = {
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 30, height: 30))
        }
        return greenView
    }()
    
    private lazy var blueView: UIView = {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 50, height: 50))
        }
        return blueView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(stackView)
        // 不设置宽度，让它宽度自适应
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // remove或者隐藏，stackView都会重新布局
        greenView.isHidden = !greenView.isHidden
//        guard greenView.superview == stackView else {
//            stackView.addArrangedSubview(greenView)
//            return
//        }
//        greenView.removeFromSuperview()
    }
}
