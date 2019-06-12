//
//  MHZTitleSubTitleLInkView.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/3.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZTitleSubTitleLInkView: UIView {
    
    var listData : NSMutableArray!
    var tableView : UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(dataArr : NSArray){
        self.init()
        
        listData = NSMutableArray.init()
        
        for dic in dataArr {
            let dataModel = MHZTitleSubTitleLInkViewModel.init()
            dataModel.setupModelDataWithDic(dataDic: dic as! NSDictionary)
            listData.add(dataModel)
        }
        
        self.setupSubVeiws()
    }
    
    
    func setupSubVeiws() {
        tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TitleLInkViewUITableViewCell")
        tableView.register(MHZTitleSubTitleLInkViewSection.self, forHeaderFooterViewReuseIdentifier: "MHZTitleSubTitleLInkViewSection")
        tableView.bounces = false
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MHZTitleSubTitleLInkView : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = listData![section] as! MHZTitleSubTitleLInkViewModel
        let count = model.didSelected ? model.subTitleArr.count:0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleLInkViewUITableViewCell", for: indexPath)
        
        let model = listData![indexPath.section] as! MHZTitleSubTitleLInkViewModel
        cell.textLabel?.text = model.subTitleArr[indexPath.row] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MHZTitleSubTitleLInkViewSection") as! MHZTitleSubTitleLInkViewSection
        let model = listData![section] as! MHZTitleSubTitleLInkViewModel
        sectionView.setupTitle(titleStr: model.titleName ,sectionIndex: section)
        sectionView.clickCallback = {(index)->() in
            if index == section {
                model.didSelected == true ? (model.didSelected = false) : (model.didSelected = true)
                tableView.reloadSections(IndexSet.init(integer: section), with: .automatic)
            }
        }
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
}

extension MHZTitleSubTitleLInkView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
