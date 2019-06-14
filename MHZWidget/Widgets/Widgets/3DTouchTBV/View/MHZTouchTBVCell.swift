//
//  MHZTouchTBVCell.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/5/29.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZTouchTBVCell: UITableViewCell {
    
    var titleLab : UILabel!
    var contentLab : UILabel!
    var authorLab : UILabel!
    var readingLab : UILabel!
    var commentsLab : UILabel!
    var praiseLab : UILabel!
    var deleteBtn : UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    
    func setupSubviews() {
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
