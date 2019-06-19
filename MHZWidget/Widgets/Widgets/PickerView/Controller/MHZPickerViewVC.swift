//
//  MHZPickerViewVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/14.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit
import CoreML

class MHZPickerViewVC: CommonVC {
    
    let model = MarsHabitatPricer()
    
    let pickerDataSource = MHZPickerViewDataSource()
    
    let priceFormater: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        formatter.usesGroupingSeparator = true
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    
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
    
    var priceLab : UILabel!
    
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
        
        
        priceLab = UILabel.init()
        priceLab.font = UIFont.systemFont(ofSize: 15)
        priceLab.textColor = UIColor.black
        priceLab.textAlignment = NSTextAlignment.center
        self.view.addSubview(priceLab)
        
        priceLab.snp.makeConstraints { (make) in
            make.top.equalTo(pickerView.snp_bottomMargin).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
        
        self.updatePredictedPrice()
    }
    
    
    func updatePredictedPrice() {
        func selectedRow(for feature: Feature) -> Int {
            return pickerView.selectedRow(inComponent: feature.rawValue)
        }
        
        let solarPanels = pickerDataSource.value(for: selectedRow(for: .solarPanels), feature: .solarPanels)
        let greenhouses = pickerDataSource.value(for: selectedRow(for: .greenhouses), feature: .greenhouses)
        let size = pickerDataSource.value(for: selectedRow(for: .size), feature: .size)
        
        guard let marsHabitatPricerOutput = try? model.prediction(solarPanels: solarPanels, greenhouses: greenhouses, size: size) else {
            fatalError("Unexpected runtime error.")
        }
        
        let price = marsHabitatPricerOutput.price
        
        priceLab.text = priceFormater.string(for: price)
    }

}
