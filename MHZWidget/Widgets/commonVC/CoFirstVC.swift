//
//  CoHomeVC.swift
//  MHZWidget_Swift
//
//  Created by MaHaoZhe on 2019/5/22.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class CoFirstVC: UIViewController {

    var vcTitle : String
    
    init (vcTitle : String) {
        
        self.vcTitle = vcTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = self.vcTitle
        
        self.view.backgroundColor = UIColor.init(red: 100/255.0, green: 200/255.0, blue: 150/255.0, alpha: 1.0)
    }

    
    
}
