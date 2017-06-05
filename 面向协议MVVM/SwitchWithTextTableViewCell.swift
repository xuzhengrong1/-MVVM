//
//  ViewController.swift
//  面向协议MVVM
//
//  Created by 许正荣 on 2017/6/5.
//  Copyright © 2017年 许正荣. All rights reserved.
//

import UIKit

protocol TextPresentable {
    var text: String { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}

protocol SwitchPresentable {
    var switchOn: Bool { get }
    var switchColor: UIColor { get }
    func onSwitchToggleOn(_ on: Bool)
}

protocol ImagePresentable {
    var imageName: String { get }
}

protocol TextFieldPresentable {
    var placeholder: String { get }
    var text: String { get }
    func onTextFieldDidEndEditing(_ textField: UITextField)
}

//默认实现
extension TextPresentable {
    var textColor: UIColor {
        return .black
    }
    var font: UIFont {
        return .systemFont(ofSize: 17)
    }

}

typealias SwitchWithTextViewPresentable = TextPresentable & SwitchPresentable

class SwitchWithTextTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var label: UILabel!
    @IBOutlet fileprivate weak var switchToggle: UISwitch!
    
    fileprivate var delegate: SwitchWithTextViewPresentable?
    
    // configure with something that conforms to the composed protocol
    func configure(withPresenter presenter: SwitchWithTextViewPresentable) {
        delegate = presenter
        label.text = presenter.text
        switchToggle.isOn = presenter.switchOn
        switchToggle.onTintColor = presenter.switchColor
    }
    
    @IBAction func onSwitchToggle(_ sender: UISwitch) {
        delegate?.onSwitchToggleOn(sender.isOn)
    }
}



