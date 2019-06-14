//
//  MHZTitleSubTitleLInkViewModel.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/12.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZTitleSubTitleLInkViewModel: NSObject {
    var titleName : String! = ""
    var subTitleArr : NSArray = []
    var didSelected : Bool = false
    
    func setupModelDataWithDic(dataDic : NSDictionary) {
        titleName = dataDic["title"] as? String
        subTitleArr = dataDic["subTitleArr"] as! NSArray
    }
}
