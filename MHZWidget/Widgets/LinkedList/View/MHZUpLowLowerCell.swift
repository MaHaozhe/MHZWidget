//
//  MHZUpLowLowerCell.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/5/31.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZUpLowLowerCell: UICollectionViewCell {
    
//    var tableveiw: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.setupSubviews()
    }
    
    
    func setupSubviews() {
        let view = UIView.init()
        
        self .addSubview(view)
        
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
