//
//  MHZTitleSubTitleLInkViewSection.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/3.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZTitleSubTitleLInkViewSection: UIView {

    var title : String!
    var icon : UIImageView!
    var label : UILabel!
    var isOpen : Bool!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(titleStr:String) {
        self.init()
        title = titleStr
        isOpen = false
        
        self.setupSubviews()
    }
    
    
    func setupSubviews() {
        icon = UIImageView.init()
        icon.image = UIImage.init(named: "123")
        icon.contentMode = .scaleAspectFit
        self.addSubview(icon)
        
        icon.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(20)
        }
        
        label = UILabel.init()
        label.text = title
        label.textColor = UIColor.black
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
