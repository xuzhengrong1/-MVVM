//
//  ViewController.swift
//  面向协议MVVM
//
//  Created by 许正荣 on 2017/6/5.
//  Copyright © 2017年 许正荣. All rights reserved.
//

import UIKit

struct SettingModeViewModel: SwitchWithTextViewPresentable {
    //    This would usually be instantiated with the model
    //    to be used to derive the information below
    //    but in this case, my app is pretty static
}


extension SettingModeViewModel {
    var text: String { return "设置" }
//    var textColor: UIColor { return .black }
//    var font: UIFont { return .systemFont(ofSize: 17.0) }
}

extension SettingModeViewModel {
    var switchOn: Bool { return false }
    var switchColor: UIColor { return .yellow }
    
    func onSwitchToggleOn(_ on: Bool) {
        if on {
            print("打开!")
        } else {
            print("关闭!")
        }
    }
}

extension SettingModeViewModel: ImagePresentable {
    var imageName: String { return "minionParty.png" }
}
