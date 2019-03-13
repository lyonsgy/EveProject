//
//  GYLanguageHelper.swift
//  SwiftDemo
//
//  Created by lyons on 2019/3/13.
//  Copyright © 2019 lyons. All rights reserved.
//

import UIKit

enum language:String {
    case en = "en-US"
    case zh = "zh-Hans-US"
    case ja = "ja-US"
}

class GYLanguageHelper {
    static func getLanguage() -> String {
        let languages:Array = UserDefaults.standard.value(forKey: "AppleLanguages") as! Array<String>
        let currentLanguage = languages.first
        return currentLanguage ?? ""
    }
    static func changeLanguage (language:String){
        let lans = [language]
        UserDefaults.standard.set(lans, forKey: "AppleLanguages")
    }
}




