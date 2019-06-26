//
//  MHZPhotoGridCell.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/26.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZPhotoGridCell: UICollectionViewCell {
    
    var imageView : UIImageView!
    
    var thumbnailImage : UIImage!{
        didSet {
            imageView.image = thumbnailImage
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupCellImageUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCellImageUI() {
        imageView = UIImageView.init()
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
