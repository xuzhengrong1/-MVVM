//
//  ViewController.swift
//  面向协议MVVM
//
//  Created by 许正荣 on 2017/6/5.
//  Copyright © 2017年 许正荣. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var dataSource : GeneralDataSource<SwitchWithTextTableViewCell,SettingModeViewModel >?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerCell(String(describing: SwitchWithTextTableViewCell.self))
        let viewModel = SettingModeViewModel()
        dataSource =   GeneralDataSource.init(items: [[viewModel,viewModel,viewModel]], cellReuseIdentifier: String(describing: SwitchWithTextTableViewCell.self)) { (cell:SwitchWithTextTableViewCell, p) in
            cell.configure(withPresenter: p);
        }
        self.tableView.dataSource = dataSource

    }

}



extension UIViewController {
    open override static func initialize()
    {
        methodSwizThreadSafe(self, #selector(UIViewController.viewWillAppear(_:)), #selector(UIViewController.xl_viewWillAppear(animated:)))
        methodSwizThreadSafe(self, #selector(UIViewController.viewDidLoad), #selector(UIViewController.xl_viewDidLoad))
    }

    func xl_viewWillAppear(animated: Bool) {
        self.xl_viewWillAppear(animated: animated)
        print("xl_viewWillAppear in swizzleMethod")
    }


    func xl_viewDidLoad() {
        self.xl_viewDidLoad()
        print("xl_viewDidLoad in swizzleMethod")
    }
}


