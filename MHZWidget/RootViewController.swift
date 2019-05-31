//
//  ViewController.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/3/25.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit
import SnapKit

class RootViewController: UIViewController {
    
    var widgetList : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "首页"
        
        self.view.backgroundColor = UIColor.white
        
        //init widgetList
        self.initWidgetList()
        
    }
    
    func initWidgetList() {
        self.widgetList = UITableView.init()
        self.widgetList.delegate = self
        self.widgetList.dataSource = self
        self.widgetList.register(CommonTVCell.self, forCellReuseIdentifier: "CommonTVCell")
        self.view.addSubview(self.widgetList)
        
        self.widgetList.snp.makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self.view)
        }
    }
    
}


//MARK: 表视图代理方法
extension RootViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        let returnVC = CoFirstVC(vcTitle: cell?.textLabel?.text ?? "无标题")
        
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(MHZTouchTBVC(), animated: true)
        case 1:
            self.navigationController?.pushViewController(MHZLinkListVC(), animated: true)
        default:
            self.navigationController?.pushViewController(returnVC, animated: true)
        }
        
    }
}


//MARK: 表视图数据源代理方法
extension RootViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommonTVCell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "3D Touch"
        case 1:
            cell.textLabel?.text = "Link List"
        default:
            cell.textLabel?.text = String.init(format: "commonCell %d", indexPath.row+1)
        }
        
        
        return cell
    }
}

