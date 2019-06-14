//
//  MHZPickerViewDataSource.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/14.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZPickerViewDataSource: NSObject,UIPickerViewDelegate,UIPickerViewDataSource {
    
    private let solarPanelDataSource = SolarPanelDataSource()
    private let greenhousesDataSource = GreenhousesDataSource()
    private let sizeDataSource = SizeDataSource()
    
    func title(for row: Int, feature: Feature) -> String? {
        switch feature {
        case .solarPanels: return solarPanelDataSource.title(for: row)
        case .greenhouses: return greenhousesDataSource.title(for: row)
        case .size: return sizeDataSource.title(for: row)
        }
    }
    
    
    func value(for row: Int, feature: Feature) -> Double {
        var value : Double?
        switch feature {
        case .solarPanels: value = solarPanelDataSource.value(for: row)
        case .greenhouses: value = greenhousesDataSource.value(for: row)
        case .size: value = sizeDataSource.value(for: row)
        }
        return value!
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch Feature(rawValue : component)! {
        case .solarPanels: return solarPanelDataSource.values.count
        case .greenhouses: return greenhousesDataSource.values.count
        case .size: return sizeDataSource.values.count
        }
    }
    

}
