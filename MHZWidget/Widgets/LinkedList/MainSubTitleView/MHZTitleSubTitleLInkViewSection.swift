//
//  MHZTitleSubTitleLInkViewSection.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/3.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZTitleSubTitleLInkViewSection: UITableViewHeaderFooterView {

    var title : String!
    var icon : UIImageView!
    var label : UILabel!
    var isOpen : Bool!
    var index : NSInteger!
    typealias clickCallbackfunc = (NSInteger)->Void
    var clickCallback : clickCallbackfunc?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
//        title = titleStr
        isOpen = false
        
        self.contentView.backgroundColor = UIColor.white
        
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
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp_rightMargin).offset(10)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(200)
        }
        
        let line = UIView.init()
        line.backgroundColor = UIColor.init(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1)
        self.addSubview(line)
        
        line.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(0.3)
        }
        
        
        let tapAction = UITapGestureRecognizer.init(target: self, action: #selector(clickSectionItemAction))
        self.addGestureRecognizer(tapAction)
    }
    
    func setupTitle(titleStr : String,sectionIndex:NSInteger) {
        label.text = titleStr
        index = sectionIndex
    }
    
    func setupSectionOpenOrOff(isOpen : Bool) {
        
    }
    
    @objc func clickSectionItemAction() {
//        clickCallback!(index)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
