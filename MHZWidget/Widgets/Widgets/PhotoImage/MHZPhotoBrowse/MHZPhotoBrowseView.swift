//
//  MHZPhotoBrowseView.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/7/8.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZPhotoBrowseView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var itemsView : UICollectionView!
    var collectionViewFlowlayout:UICollectionViewFlowLayout!
    var dataArr : NSArray!
    
    convenience init(itmes:NSArray){
        self.init()
        self.dataArr = itmes
        self.setupSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        collectionViewFlowlayout = UICollectionViewFlowLayout.init()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        collectionViewFlowlayout.itemSize = CGSize.init(width: width, height: height)
        collectionViewFlowlayout.minimumLineSpacing = 0
        collectionViewFlowlayout.minimumInteritemSpacing = 0
        collectionViewFlowlayout.scrollDirection = .horizontal
        
        itemsView =  UICollectionView.init(frame: CGRect.zero, collectionViewLayout: collectionViewFlowlayout)
        itemsView.delegate = self
        itemsView.dataSource = self
        itemsView.register(MHZPhotoZoomCell.self, forCellWithReuseIdentifier: "MHZPhotoZoomCellID")
        itemsView.backgroundColor = UIColor.red
        itemsView.isPagingEnabled = true
        itemsView.bounces = false
        itemsView.contentInsetAdjustmentBehavior = .never
        self.addSubview(itemsView)
        
        itemsView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MHZPhotoZoomCellID", for: indexPath)
        return cell
    }
}

