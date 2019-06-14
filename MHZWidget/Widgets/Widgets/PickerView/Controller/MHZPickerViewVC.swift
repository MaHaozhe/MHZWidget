//
//  MHZPickerViewVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/14.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZPickerViewVC: CommonVC {
    
    let pickerDataSource = MHZPickerViewDataSource()
    
    var pickerView : UIPickerView!{
        didSet {
            pickerView.delegate = self
            pickerView.dataSource = pickerDataSource
            
            let features: [Feature] = [.solarPanels,.greenhouses,.size]
            for feature in features {
                pickerView.selectRow(2, inComponent: feature.rawValue, animated: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        pickerView = UIPickerView.init()
        self.view.addSubview(pickerView)
        
        pickerView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(50)
            make.height.equalTo(100)
        }
        
    }

}
