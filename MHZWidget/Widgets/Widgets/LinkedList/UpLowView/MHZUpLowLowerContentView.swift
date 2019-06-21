//
//  MHZUpLowLowerContentView.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/3.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZUpLowLowerContentView: UIView {
    
    var tableView : UITableView!
    var titleStr : String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.setupSubviews()
    }
    
    convenience init(titleString : String){
        self.init()
        
        titleStr = titleString
    }
    
    
    func setupSubviews() {
        self.tableView = UITableView.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContentViewUITableViewCell")
        self.addSubview(self.tableView)
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            
            self.DispatchAfter(after: 2) {
                self.tableView.mj_header.endRefreshing()
                print("刷新完成")
            }
        })
        
        self.tableView.snp.makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(self)
        }
    }
    
    
    public func DispatchAfter(after: Double, handler:@escaping ()->())
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            handler()
        }
    }

    
    open func setTableViewBounces(canBounces : Bool) {
        self.tableView.bounces = canBounces
    }
        
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MHZUpLowLowerContentView : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension MHZUpLowLowerContentView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentViewUITableViewCell", for: indexPath)
        cell.textLabel?.text = titleStr
        
        return cell
    }
    
    
}
