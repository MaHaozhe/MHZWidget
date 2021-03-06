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
        let returnVC = CommonVC(vcTitle: cell?.textLabel?.text ?? "无标题")
        
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(MHZTouchTBVC(vcTitle: "3D Touch Cell"), animated: true)
        case 1:
            self.navigationController?.pushViewController(MHZLinkListVC(vcTitle: "Linked List"), animated: true)
        case 2:
            if #available(iOS 11.0, *) {
                self.navigationController?.pushViewController(MHZPickerViewVC(vcTitle: "PickerView"), animated: true)
            } else {
                // Fallback on earlier versions
            }
        case 3:
            self.navigationController?.pushViewController(MHZNetworkDataVC(vcTitle: "NetworkData"), animated: true)
        case 4:
            self.navigationController?.pushViewController(MHZPhotoVC(vcTitle: "MHZPhotoVC"), animated: true)
        case 5:
            self.navigationController?.pushViewController(MHZPlayerVC(vcTitle: "Player"), animated: true)
        case 6:
            self.navigationController?.pushViewController(MHZPopAnimationVC(vcTitle: "Animation"), animated: true)
        default:
            self.navigationController?.pushViewController(returnVC, animated: true)
        }
//        MHZNetworkDataVC
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
        case 2:
            cell.textLabel?.text = "PickerView"
        case 3:
            cell.textLabel?.text = "NetworkData"
        case 4:
            cell.textLabel?.text = "MHZPhotoVC"
        case 5:
            cell.textLabel?.text = "MHZPlayer"
        case 6:
            cell.textLabel?.text = "MHZAnimation"
        default:
            cell.textLabel?.text = String.init(format: "commonCell %d", indexPath.row+1)
        }
        
        
        return cell
    }
}

