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
        tableView.register(CommonTVCell.self, forCellReuseIdentifier: "MHZPopAnimationVCCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }

}


extension MHZPopAnimationVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MHZPopAnimationVCCell", for: indexPath)
        
        switch indexPath.row {
        default:
            cell.textLabel?.text = String.init(format: "commonCell %d", indexPath.row+1)
        }
        
        return cell
        
    }
}
