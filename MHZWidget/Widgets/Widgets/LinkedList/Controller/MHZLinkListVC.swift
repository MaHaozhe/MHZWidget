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
        
        //第一列view的数据
        let filePath = Bundle.main.path(forResource: "TitSubTitleDataList", ofType: ".plist")
        var dataDic : NSArray = NSArray()
        dataDic = NSArray(contentsOfFile: filePath!)!
        let fistView = MHZTitleSubTitleLInkView.init(dataArr: dataDic)
        
        
        let linkView = MHZUpLowLinkView.init(titleArr: ["第一页","第二页","第三页","第四页","第五页","第六页","第七页","第八页","第九页","第十页"], contentArr: [fistView,MHZUpLowLowerContentView.init(titleString: "第二页"),MHZUpLowLowerContentView.init(titleString: "第三页"),MHZUpLowLowerContentView.init(titleString: "第四页"),MHZUpLowLowerContentView.init(titleString: "第五页"),MHZUpLowLowerContentView.init(titleString: "第六页"),MHZUpLowLowerContentView.init(titleString: "第七页"),MHZUpLowLowerContentView.init(titleString: "第八页"),MHZUpLowLowerContentView.init(titleString: "第九页"),MHZUpLowLowerContentView.init(titleString: "第十页")],viewSize: CGSize.init(width: self.view.width, height: self.view.height-(self.navigationController?.navigationBar.height)!-20 ))
        
        self.view.addSubview(linkView)
        
        linkView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }

}
