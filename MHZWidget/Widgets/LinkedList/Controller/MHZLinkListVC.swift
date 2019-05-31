//
//  MHZLinkListVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/5/30.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZLinkListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Linked List"
        
        self.view.backgroundColor = UIColor.white
        
        //防止view显示在导航下边
        self.edgesForExtendedLayout = []
        
        let linkView = MHZUpLowLinkView.init(titleArr: ["hha","qqqq"], contentArr: ["123","4312"])
        
        self.view.addSubview(linkView)
        
        linkView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }

}
