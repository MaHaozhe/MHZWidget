//
//  MHZAnimationCell.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/11/13.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZAnimationCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    
    
    
    func setupUI(){
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
