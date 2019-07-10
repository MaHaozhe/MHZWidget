//
//  MHZPhotoEditorVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/26.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZPhotoEditorVC: UIViewController,RainbowColorSource,UIGestureRecognizerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubviews()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.rb.backgroundColor = UIColor.clear
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.rb.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.rb.clear()
    }
    
    func setupSubviews() {
        let itemArr = NSArray.init(array: [1,2,3,4])
        let browseView = MHZPhotoBrowseView.init(itmes: itemArr)
        self.view.addSubview(browseView)
        browseView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    //MARK: - RainbowColorSource
    func navigationBarInColor() -> UIColor {
        return UIColor.clear
    }
    
    func navigationBarOutColor() -> UIColor {
        return UIColor.white
    }
    
}

