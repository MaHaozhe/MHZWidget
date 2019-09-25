//
//  MHZPhotoZoomCell.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/7/8.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZPhotoZoomCell: UICollectionViewCell {

    var zoomImgView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupSubViews() {
        zoomImgView = UIImageView.init()
        zoomImgView.contentMode = .scaleAspectFit
        self.addSubview(zoomImgView)
        
        zoomImgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    
}
