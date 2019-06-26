//
//  MHZPhotoGridVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/25.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit
import Photos
import PhotosUI

class MHZPhotoGridVC: UIViewController {
    
    var collectionView: UICollectionView!
    
    var fetchResult: PHFetchResult<PHAsset>!
    var availableWidth: CGFloat = 0
    
    var collectionViewFlowlayout:UICollectionViewFlowLayout!
    
    fileprivate let imageManager = PHCachingImageManager()
    fileprivate var thumbnailSize: CGSize!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "相册"
        
        self.setupSubViews()
        
        self.setupDismissBtn()
    }
    
    fileprivate func setupDismissBtn() {
        let dismissBtn = UIButton.init()
        dismissBtn.setTitle("取消", for: .normal)
        dismissBtn.setTitleColor(UIColor.black, for: .normal)
        dismissBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        dismissBtn.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: dismissBtn)
    }
    
    @objc fileprivate func dismissAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //确定要从PHCachingImageManager请求的缩略图的大小
        let scale = UIScreen.main.scale
        let cellSize = collectionViewFlowlayout.itemSize
        thumbnailSize = CGSize(width: cellSize.width*scale, height: cellSize.height*scale)
    }
    
    func setupSubViews() {
        collectionViewFlowlayout = UICollectionViewFlowLayout.init()
        if #available(iOS 11.0, *) {
            let width = view.bounds.inset(by: view.safeAreaInsets).width
            
            //如果可用宽度发审会变化，item大小会调整
            if availableWidth != width{
                availableWidth = width
                let columnCount = (availableWidth/80).rounded(.towardZero)
                let itemLength = (availableWidth - columnCount - 1)/columnCount
                collectionViewFlowlayout.itemSize = CGSize.init(width: itemLength, height: itemLength)
                collectionViewFlowlayout.minimumLineSpacing = 1
                collectionViewFlowlayout.minimumInteritemSpacing = 1
            }
        } else {
            // Fallback on earlier versions
        }
    
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: collectionViewFlowlayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MHZPhotoGridCell.self, forCellWithReuseIdentifier: "MHZPhotoGridCellID")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    
}


extension MHZPhotoGridVC : UICollectionViewDelegate,UICollectionViewDataSource{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult.count
    }
    
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let asset = fetchResult.object(at: indexPath.item)
        
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "MHZPhotoGridCellID", for: indexPath) as? MHZPhotoGridCell else { fatalError("野生cell出现") }
        //        item.thumbnailImage = fetchResult
        imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil, resultHandler: {image, _ in
            
            item.thumbnailImage = image
        })
        return item
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
