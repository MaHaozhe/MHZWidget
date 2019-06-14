//
//  MHZTouchTBVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/5/29.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
class MHZTouchTBVC: CommonVC,UIViewControllerPreviewingDelegate {
    
    private var touchTableview : UITableView!
    static var TouchTableCellID = "touchTableCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.setupTableView()
        
        //注册参与3d touch的view 以供pop和peek
        registerForPreviewing(with: self, sourceView: touchTableview)
    }
    
    private func setupTableView() {
        self.touchTableview = UITableView.init()
        self.touchTableview.delegate = self
        self.touchTableview.dataSource = self
        self.touchTableview.register(MHZTouchTBVCell.self, forCellReuseIdentifier: MHZTouchTBVC.TouchTableCellID)
        self.touchTableview.separatorStyle = .none
        self.view.addSubview(self.touchTableview)
        
        self.touchTableview.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
//MARK: peek delegate
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let indexPath = touchTableview.indexPathForRow(at: location)
        
        let cell = touchTableview.cellForRow(at: indexPath!)
        
        previewingContext.sourceRect = (cell?.frame)!;
        
        let color = cell?.backgroundColor
        
        let viewController = MHZTouchDetailVC.init(bgColor: color!)
        
        return viewController
    }
    
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
}


//MARK: 表视图数据源代理方法
extension MHZTouchTBVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MHZTouchTBVC.TouchTableCellID, for: indexPath)
        
        cell.backgroundColor = UIColor.init(red: CGFloat((Float(arc4random()%255))/255.0), green: CGFloat((Float(arc4random()%255))/255.0), blue: CGFloat((Float(arc4random()%255))/255.0), alpha: 1.0)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(44 + Int(arc4random() % 30))
    }
}


//MARK: 表视图代理方法
extension MHZTouchTBVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        
        let color = cell?.backgroundColor
        
        let viewController = MHZTouchDetailVC.init(bgColor: color!)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
