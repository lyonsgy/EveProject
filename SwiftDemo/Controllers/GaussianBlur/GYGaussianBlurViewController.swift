//
//  GYGaussianBlurViewController.swift
//  SwiftDemo
//
//  Created by lyons on 2019/3/8.
//  Copyright © 2019 lyons. All rights reserved.
//

import UIKit

class GYGaussianBlurViewController: GYRootViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "高斯模糊"
        
        self.imageView.setGaussianBlurImage(with: URL(string: "https://i7.wenshen520.com/c/42.jpg"), blurNumber: self.slider.value)
    }

    @IBAction func sliderChange(_ sender: UISlider) {
        self.imageView.setGaussianBlurImage(with: URL(string: "https://i7.wenshen520.com/c/42.jpg"), blurNumber: sender.value)
    }
}
