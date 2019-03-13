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

///  languageType 语言协议
public protocol languageType {
    // 目标类标题
    var title: String {get}
}

extension language: languageType {
    var title: String {
        switch self {
        case .en:
            return "English"
        case .ja:
            return "日本語"
        case .zh:
            return "简体中文"
        }
    }
}
class GYLanguageHelper {
    /// 当前语言
    var nowlanguage: String {
        get {
            return language(rawValue: GYLanguageHelper.getLanguage())?.title ?? ""
        }
    }
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




