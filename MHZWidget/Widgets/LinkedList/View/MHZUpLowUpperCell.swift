//
//  MHZUpLowCell.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/5/30.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZUpLowUpperCell: UICollectionViewCell {
    var titleLab : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupSubViews()
    }
    
    
    func setupSubViews() {
        titleLab = UILabel.init()
        titleLab.textColor = UIColor.black
        titleLab.textAlignment = NSTextAlignment.center
        self.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.left.top.bottom.right.equalToSuperview()
        }
    }
    
    func setUpTitle (title: String) {
        titleLab.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
