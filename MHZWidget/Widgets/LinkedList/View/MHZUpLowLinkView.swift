//
//  MHZUpLowLinkView.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/5/30.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZUpLowLinkView: UIView,UIScrollViewDelegate {
    
    var MHZUPPERVIEWHEIGHT : CGFloat = 50//上部分的高度
    var MHZUPPERVIEWWIDTH : CGFloat = 90//上半部分item宽度
    var MHZUPLOWVIEWMARGIN : CGFloat = 5//上部分和下部分的间距
    var linkViewSize : CGSize!//linkview 在superview中的大小
    var upperItemNumber : NSInteger!//根据一屏有几个按钮，来确定当滑块滑到哪里再移动upperview
    var indexViewWidth : CGFloat = 60//标记试图的宽度
    var moveWithAnimat : Bool!
    
    
    var titleView : UICollectionView!//上半部分
    var contentView : UICollectionView!//下半部分
    var titleArray : Array<Any>!//上半部分数据
    var contentArray : Array<Any>!//下半部分数据
    var indexView : UIView!//上半部分标记选中的item
    
    
    static var MHZUpLowUpperCellID = "MHZUpLowUpperCell"
    static var MHZUpLowLowerCellID = "MHZUpLowLowerCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
    }
    
    convenience init(titleArr:Array<Any>,contentArr:Array<Any>,viewSize: CGSize){
        self.init()
        titleArray = titleArr
        contentArray = contentArr
        linkViewSize = viewSize
        
        self.setupTitleView()
        
        self.setupContentView()
        
    }
    
    //上部分显示title
    func setupTitleView() {
        let titleLayout = UICollectionViewFlowLayout.init()
        titleLayout.scrollDirection = .horizontal
        titleLayout.itemSize = CGSize.init(width: MHZUPPERVIEWWIDTH, height: MHZUPPERVIEWHEIGHT)
        titleLayout.minimumLineSpacing = 0
        titleLayout.minimumInteritemSpacing = 0
        titleLayout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        titleLayout.headerReferenceSize = CGSize.init(width: 0, height: 0)
        titleLayout.footerReferenceSize = CGSize.init(width: 0, height: 0)
        
        titleView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: titleLayout)
        titleView.backgroundColor = UIColor.white
        titleView.delegate = self
        titleView.dataSource = self
        titleView.register(MHZUpLowUpperCell.self, forCellWithReuseIdentifier: MHZUpLowLinkView.MHZUpLowUpperCellID)
        titleView.bounces = false
        titleView.showsHorizontalScrollIndicator = false
        self.addSubview(titleView)
        
        titleView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(MHZUPPERVIEWHEIGHT)
        }
        
        
        indexView = UIView.init(frame: CGRect.init(x: (MHZUPPERVIEWWIDTH - indexViewWidth)/2, y: MHZUPPERVIEWHEIGHT-2, width: indexViewWidth, height: 2))
        indexView.backgroundColor = UIColor.red
        indexView.layer.cornerRadius = 1
        indexView.layer.masksToBounds = true
        titleView.addSubview(indexView)
        titleView.bringSubviewToFront(indexView)
        
    }
    
    //下边部分显示具体内容
    func setupContentView() {
        
        let contentLayout = UICollectionViewFlowLayout.init()
        contentLayout.scrollDirection = .horizontal
        contentLayout.itemSize = CGSize.init(width: linkViewSize.width, height: linkViewSize.height - MHZUPPERVIEWHEIGHT - MHZUPLOWVIEWMARGIN)
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
        contentView.bounces = false
        contentView.showsHorizontalScrollIndicator = false
        self.addSubview(contentView)
        contentView.isPagingEnabled = true
        
        contentView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(MHZUPLOWVIEWMARGIN)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isEqual(contentView) {
            if moveWithAnimat == true{
                indexView.x = (contentView.contentOffset.x/contentView.contentSize.width)*titleView.contentSize.width + (MHZUPPERVIEWWIDTH - indexViewWidth)/2
            }else{
                
                weak var weakSelf = self
                UIView.animate(withDuration: 0.3) {
                    weakSelf?.indexView.x = (weakSelf!.contentView.contentOffset.x/weakSelf!.contentView.contentSize.width)*weakSelf!.titleView.contentSize.width + (weakSelf!.MHZUPPERVIEWWIDTH - weakSelf!.indexViewWidth)/2
                }
                
                let index = NSInteger(scrollView.contentOffset.x/linkViewSize.width)
                let indexNew = (index - 2)>0 ? (index - 2) : 0
                titleView.scrollToItem(at: IndexPath.init(row:indexNew, section: 0), at: .left, animated: true)
            }
            moveWithAnimat = true
        }
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.isEqual(contentView) {
            let index = NSInteger(scrollView.contentOffset.x/linkViewSize.width)
            
            let indexNew = (index - 2)>0 ? (index - 2) : 0
            titleView.scrollToItem(at: IndexPath.init(row:indexNew, section: 0), at: .left, animated: true)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MHZUpLowLinkView:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.isEqual(titleView){
            let cell : MHZUpLowUpperCell!
            cell = (collectionView.dequeueReusableCell(withReuseIdentifier: MHZUpLowLinkView.MHZUpLowUpperCellID, for: indexPath) as! MHZUpLowUpperCell)
            cell.setUpTitle(title: titleArray?[indexPath.row] as! String)
            collectionView.bringSubviewToFront(cell.titleLab)
            return cell
            
        }else{
            let cell : MHZUpLowLowerCell!
            cell = (collectionView.dequeueReusableCell(withReuseIdentifier: MHZUpLowLinkView.MHZUpLowLowerCellID, for: indexPath) as! MHZUpLowLowerCell)
            let contentView = contentArray[indexPath.row] as! UIView
            cell.addSubview(contentView)
            contentView.snp.makeConstraints { (make) in
                make.top.left.right.bottom.equalToSuperview()
            }
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.isEqual(titleView) {
            moveWithAnimat = false
            contentView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
    }
}

