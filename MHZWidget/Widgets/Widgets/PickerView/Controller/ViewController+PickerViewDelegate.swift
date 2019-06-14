//
//  ViewController+PickerViewDelegate.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/14.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

extension MHZPickerViewVC : UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let feature = Feature(rawValue: component) else {
            fatalError("Invalid component \(component) found to represent a \(Feature.self). This should not happen based on the configuration set in the storyboard.")
        }
        
        return pickerDataSource.title(for: row, feature: feature)
    }
    
}
