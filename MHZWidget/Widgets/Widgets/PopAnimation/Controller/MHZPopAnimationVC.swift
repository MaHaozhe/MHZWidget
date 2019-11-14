//
//  MHZPopAnimationVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/11/12.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZPopAnimationVC: CommonVC {
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let getRectNavAndStatusHight = ((self.navigationController?.navigationBar.height ?? 0) + UIApplication.shared.statusBarFrame.height)
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.width, height: self.view.height - getRectNavAndStatusHight))
        tableView.register(MHZAnimationCell.self, forCellReuseIdentifier: "MHZAnimationCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }

}


extension MHZPopAnimationVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)!;
        
    }
}

extension MHZPopAnimationVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MHZAnimationCell", for: indexPath)
        cell.selectionStyle = .none
        
        switch indexPath.row {
        default:
            cell.textLabel?.text = String.init(format: "AnimationCell %d", indexPath.row+1)
        }
        
        if let anim = POPBasicAnimation(propertyNamed: kPOPViewAlpha) {
            anim.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            anim.fromValue = 0.0
            anim.toValue = 1.0
            cell.pop_add(anim, forKey: "fade")
        }
        
        return cell
        
    }
}
