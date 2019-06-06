//
//  MHZTitleSubTitleLInkView.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/3.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZTitleSubTitleLInkView: UIView {
    
    var listData : NSArray!
    var tableView : UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(dataArr : NSArray){
        self.init()
        
        listData = NSArray.init(array: dataArr)
        
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MHZTitleSubTitleLInkViewSection") as! MHZTitleSubTitleLInkViewSection
        let title = (listData[section] as! NSDictionary).object(forKey: "title")
        sectionView.setupTitle(titleStr: title as! String,sectionIndex: section)
//        sectionView.clickCallback =
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    
}

extension MHZTitleSubTitleLInkView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
