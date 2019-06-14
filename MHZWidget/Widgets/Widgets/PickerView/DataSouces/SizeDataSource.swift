//
//  SizeDataSource.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/14.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import Foundation

struct SizeDataSource {
    
    private static let numberFormatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        return formatter
    }()
    
    let values = [750,1000,1500,2000,3000,4000,5000,10_000]
    
    func title(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
    
    func value(for index: Int) -> Double? {
        guard index < values.count else { return nil }
        return Double(values[index])
    }
}
