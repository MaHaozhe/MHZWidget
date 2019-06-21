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
    var sectionI : NSInteger!
    var sectionTableview : UITableView!
    var sectionModel : MHZTitleSubTitleLInkViewModel!
    
    typealias clickCallbackfunc = (NSInteger)->Void
    var clickCallback : clickCallbackfunc?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        isOpen = false
        
        self.contentView.backgroundColor = UIColor.white
        
        self.setupSubviews()
    }
    
    
    func setupSubviews() {
        icon = UIImageView.init()
        icon.image = UIImage.init(named: "Common_rightArrow")
        icon.contentMode = .scaleAspectFill
        self.addSubview(icon)
        
        icon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.width.equalTo(12)
            make.height.equalTo(8)
            make.left.equalToSuperview().offset(10)
        }
        
        label = UILabel.init()
        label.text = title
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp_rightMargin).offset(15)
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
    
    func setupTitle(model : MHZTitleSubTitleLInkViewModel,sectionIndex:NSInteger) {
        sectionModel = model
        label.text = model.titleName
        sectionI = sectionIndex
        if sectionModel.didSelected == false {
            self.addArrowAnimationWithViewAndType(view: icon, type: 2,animation: false)
        }else{
            self.addArrowAnimationWithViewAndType(view: icon, type: 1,animation: false)
        }
    }
    
    //MARK: 点击section，箭头旋转动画以及section的cell展开和关闭
    @objc func clickSectionItemAction() {
        if sectionModel.didSelected == false {
            sectionModel.didSelected = true
            self.addArrowAnimationWithViewAndType(view: icon, type: 1,animation: true)
            var indexPaths = [IndexPath]()
            let index      = sectionModel.subTitleArr.count
            for i in 0 ..< index {
                
                indexPaths.append(IndexPath(item: i, section: sectionI!))
            }
            sectionTableview.insertRows(at: indexPaths, with: .automatic)
        }else{
            sectionModel.didSelected = false
            self.addArrowAnimationWithViewAndType(view: icon, type: 2,animation: true)
            var indexPaths = [IndexPath]()
            let index      = sectionModel.subTitleArr.count
            for i in 0 ..< index {
                
                indexPaths.append(IndexPath(item: i, section: sectionI!))
            }
            sectionTableview.deleteRows(at: indexPaths, with: .fade)
            
        }
    }
    
    
    /// 打开收起抽屉时尖头旋转的动画
    ///
    /// - Parameters:
    ///   - view: 需要旋转的view
    ///   - type: 旋转类型 1为向下旋转，2位向右旋转
    func addArrowAnimationWithViewAndType(view:UIView,type:NSInteger,animation:Bool) {
        //1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        //2.设置动画的属性
        if type == 1 {
            rotationAnim.fromValue = 0
            rotationAnim.toValue = Double.pi/2
        }else if type == 2 {
            rotationAnim.fromValue = Double.pi/2
            rotationAnim.toValue = 0
        }
        rotationAnim.repeatCount = 1
        if animation == true {
            rotationAnim.duration = 0.25
        }else{
            rotationAnim.duration = 0
        }
        
        // 这个属性很重要 如果不设置当页面运行到后台再次进入该页面的时候 动画会停止
        rotationAnim.isRemovedOnCompletion = false
        rotationAnim.fillMode = CAMediaTimingFillMode.forwards;
        //3.添加动画到对应的view上
        view.layer.add(rotationAnim, forKey: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
