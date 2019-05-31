//
//  MHZUpLowLinkView.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/5/30.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZUpLowLinkView: UIView {

    var titleView : UICollectionView!
    var contentView : UICollectionView!
    var titleArray : Array<Any>!
    var contentArray : Array<Any>!
    
    static var MHZUpLowUpperCellID = "MHZUpLowUpperCell"
    static var MHZUpLowLowerCellID = "MHZUpLowLowerCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
    }
    
    convenience init(titleArr:Array<Any>,contentArr:Array<Any>){
        self.init()
        titleArray = titleArr
        contentArray = contentArr
        
        self.setupTitleView()
        
        self.setupContentView()
        
    }
    
    
    func setupTitleView() {
        let titleLayout = UICollectionViewFlowLayout.init()
        titleLayout.scrollDirection = .horizontal
        titleLayout.itemSize = CGSize.init(width: 70, height: 50)
        titleLayout.minimumLineSpacing = 2
        titleLayout.minimumInteritemSpacing = 0
        titleLayout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        titleLayout.headerReferenceSize = CGSize.init(width: 0, height: 0)
        titleLayout.footerReferenceSize = CGSize.init(width: 0, height: 0)
        
        titleView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: titleLayout)
        titleView.backgroundColor = UIColor.white
        titleView.delegate = self
        titleView.dataSource = self
        titleView.register(MHZUpLowUpperCell.self, forCellWithReuseIdentifier: MHZUpLowLinkView.MHZUpLowUpperCellID)
        self.addSubview(titleView)
        
        titleView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    
    func setupContentView() {
        
        
        let contentLayout = UICollectionViewFlowLayout.init()
        contentLayout.scrollDirection = .horizontal
        let screenw = UIScreen.main.bounds.size.width
        contentLayout.itemSize = CGSize.init(width: screenw, height: 500)
        contentLayout.minimumLineSpacing = 0
        contentLayout.minimumInteritemSpacing = 0
        contentLayout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        contentLayout.headerReferenceSize = CGSize.init(width: 0, height: 0)
        contentLayout.footerReferenceSize = CGSize.init(width: 0, height: 0)
        
        contentView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: contentLayout)
        contentView.collectionViewLayout = contentLayout
        contentView.backgroundColor = UIColor.white
        contentView.delegate = self
        contentView.dataSource = self
        contentView.register(MHZUpLowLowerCell.self, forCellWithReuseIdentifier: MHZUpLowLinkView.MHZUpLowLowerCellID)
        self.addSubview(contentView)
        contentView.isPagingEnabled = true
        
        
        
        contentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MHZUpLowLinkView:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell!
        if collectionView.isEqual(titleView){
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: MHZUpLowLinkView.MHZUpLowUpperCellID, for: indexPath)
            cell.backgroundColor = UIColor.red
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: MHZUpLowLinkView.MHZUpLowLowerCellID, for: indexPath)
            cell.backgroundColor = UIColor.init(red: CGFloat(Float(arc4random()%255)/255.0), green: CGFloat(Float(arc4random()%255)/255.0), blue: CGFloat(Float(arc4random()%255)/255.0), alpha: 1.0)
        }
        
        return cell
    }
}
