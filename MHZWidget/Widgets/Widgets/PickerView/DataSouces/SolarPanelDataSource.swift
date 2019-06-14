//
//  SolarPanelDataSource.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/14.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import Foundation

struct SolarPanelDataSource {
    let values = [1,1.5,2,2.5,3,3.5,4,4.5,5]
    
    func title(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
    
    func value(for index: Int) -> Double? {
        guard index < values.count else { return nil}
        return Double(values[index])
    }
}
