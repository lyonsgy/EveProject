//
//  GYGaussianBlurViewController.swift
//  SwiftDemo
//
//  Created by lyons on 2019/3/8.
//  Copyright © 2019 lyons. All rights reserved.
//

import UIKit

class GYGaussianBlurViewController: GYRootViewController {
    private var callback: Complated!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "高斯模糊"
        callback = getExtra(Page.callback)!
        self.imageView.setGaussianBlurImage(with: URL(string: "https://i7.wenshen520.com/c/42.jpg"), blurNumber: self.slider.value)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.callback(["name": "lyons"])
    }
    @IBAction func sliderChange(_ sender: UISlider) {
        self.imageView.setGaussianBlurImage(with: URL(string: "https://i7.wenshen520.com/c/42.jpg"), blurNumber: sender.value)
    }
}
