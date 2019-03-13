//
//  GYGaussianBlurViewController.swift
//  SwiftDemo
//
//  Created by lyons on 2019/3/8.
//  Copyright © 2019 lyons. All rights reserved.
//

import UIKit
import AVFoundation
import EVGPUImage2

class GYGaussianBlurViewController: GYRootViewController {
    private var callback: Complated!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callback = getExtra(Page.callback)!
        imageView.kf.setImage(with: URL(string: "https://i7.wenshen520.com/c/42.jpg")) { (image, error, cacheType, url) in
            if (image != nil) {
                self.setCustomView(blur: self.slider.value, image: image!)
            }
        }
//        imageView.setGaussianBlurImage(with: URL(string: "https://i7.wenshen520.com/c/42.jpg"), blurNumber: slider.value)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        callback(["name": "lyons"])
    }
    @IBAction func sliderChange(_ sender: UISlider) {
        imageView.kf.setImage(with: URL(string: "https://i7.wenshen520.com/c/42.jpg")) { (image, error, cacheType, url) in
            if (image != nil) {
                self.setCustomView(blur: sender.value, image: image!)
            }
        }
//        imageView.setGaussianBlurImage(with: URL(string: "https://i7.wenshen520.com/c/42.jpg"), blurNumber: sender.value)
    }
}

extension GYGaussianBlurViewController{
    func setCustomView(blur:Float,image:UIImage) {
        print(blur)
        //高斯模糊滤镜
        let gaussianBlur = GaussianBlur()
        gaussianBlur.blurRadiusInPixels = blur*10
        
        
        // 1.使用GPUImage对UIImage的扩展方法进行滤镜处理
        var filteredImage: UIImage
        
        // 1.1单一滤镜
        filteredImage = imageView.image!.filterWithOperation(gaussianBlur)
        
//        // 1.2多个滤镜叠加
//        filteredImage = imageView.image!.filterWithPipeline { (input, output) in
//            input --> gaussianBlur --> output
//        }
        // 不建议的
        imageView.image = filteredImage
        
//        // 2.使用管道处理
//        // 创建图片输入
//        let pictureInput = PictureInput(image: image)
//        // 创建图片输出
//        let pictureOutput = PictureOutput()
//        // 给闭包赋值
//        pictureOutput.imageAvailableCallback = { blurImage in
//            // 这里的image是处理完的数据，UIImage类型
//            self.imageView.image = blurImage
//        }
//        // 绑定处理链
//        pictureInput --> gaussianBlur --> pictureOutput
//        // 开始处理 synchronously: true 同步执行 false 异步执行，处理完毕后会调用imageAvailableCallback这个闭包
//        pictureInput.processImage(synchronously: true)
    }
}
