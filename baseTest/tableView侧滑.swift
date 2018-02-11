//
//  tableView侧滑.swift
//  baseTest
//
//  Created by macmini on 2017/8/23.
//  Copyright © 2017年 macmini. All rights reserved.
//

import UIKit

class tableView__: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    // 侧滑按钮设置
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let actionOne = UITableViewRowAction(style: .normal, title: "") { (按钮本身_UITableViewRowAction, 按钮对应行数_IndexPath) in
        }
        actionOne.backgroundColor = UIColor.black
        let actionTwo = UITableViewRowAction(style: .normal, title: "") { (按钮本身_UITableViewRowAction, 按钮对应行数_IndexPath) in
        }
        actionOne.backgroundColor = UIColor.black
        return [actionOne,actionTwo]    //根据改顺序,从右向左排列
    }
}
