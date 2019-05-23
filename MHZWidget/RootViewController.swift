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

extension RootViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        let returnVC = CoFirstVC(vcTitle: cell?.textLabel?.text ?? "无标题")
        self.navigationController?.pushViewController(returnVC, animated: true)
    }
}

extension RootViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommonTVCell", for: indexPath)
        
        cell.textLabel?.text = String.init(format: "commonCell %d", indexPath.row+1)
        
        return cell
    }
}

