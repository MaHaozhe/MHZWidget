//
//  MHZPhotoEditorVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/26.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZPhotoEditorVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        self.navigationController?.navigationBar.backgroundColor = UIColor.white.withAlphaComponent(1)
        
    }
    
    func setupSubviews() {
        let itemArr = NSArray.init(array: [1,2,3,4])
        let browseView = MHZPhotoBrowseView.init(itmes: itemArr)
        self.view.addSubview(browseView)
        browseView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

