//
//  MHZTouchDetailVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/5/29.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZTouchDetailVC: UIViewController {
    
    let vcColor : UIColor!
    
    init(bgColor : UIColor) {
        vcColor = bgColor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "3D Touch Detail"
        
        self.view.backgroundColor = self.vcColor
    }
    
// MARK: - Supporting Peek Quick Actions
    override var previewActionItems: [UIPreviewActionItem]{
        let praiseAction = UIPreviewAction(title: "点赞", style: .default, handler: { [unowned self] (_, _) in
            self.praiseAction()
        })
        
        let commentsAction = UIPreviewAction(title: "评论", style: .default, handler: {
            [unowned self] (_, _) in
            
            self.commentsAction()
        })
        
        let shareAction = UIPreviewAction(title: "分享", style: .default, handler: {
            [unowned self] (_, _) in
            
            self.commentsAction()
        })
        
        return [praiseAction,commentsAction,shareAction]
    }
    
    
    func praiseAction() {
        print("点赞")
    }
    
    func commentsAction() {
        print("评论")
    }
    
    func shareAction() {
        print("分享")
    }

}
