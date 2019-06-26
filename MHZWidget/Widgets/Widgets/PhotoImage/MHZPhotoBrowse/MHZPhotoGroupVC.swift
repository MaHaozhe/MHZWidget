//
//  MHZPhotoGroupVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/25.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit
import Photos

class MHZPhotoGroupVC: UITableViewController {
    
    enum Section: Int {
        case allPhotos = 0
        case smartAlbums
        case userCollections
        
        static let count = 3
    }
    
    enum CellIdentifier: String {
        case allPhotos, collection
    }
    
    //MARK: 属性
    var allPhotos: PHFetchResult<PHAsset>!
    var smartAlbums: PHFetchResult<PHAssetCollection>!
    var userCollections: PHFetchResult<PHCollection>!
    var sectionTitles = ["","智能分组相册","相册"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "相册分组"
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.allPhotos.rawValue)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.collection.rawValue)
        
        let allPhotosOptions = PHFetchOptions()
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
        
        
        smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
        userCollections = PHCollectionList.fetchTopLevelUserCollections(with: nil)
        
        let gridVC = MHZPhotoGridVC()
        gridVC.fetchResult = allPhotos
        self.navigationController?.pushViewController(gridVC, animated: false)

        self.setupDismissBtn()
    }
    
    fileprivate func setupDismissBtn() {
        let dismissBtn = UIButton.init()
        dismissBtn.setTitle("取消", for: .normal)
        dismissBtn.setTitleColor(UIColor.black, for: .normal)
        dismissBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        dismissBtn.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: dismissBtn)
    }
    
    @objc fileprivate func dismissAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: tableview
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .allPhotos: return 1
        case .smartAlbums: return smartAlbums.count
        case .userCollections: return userCollections.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch Section(rawValue: indexPath.section)! {
        case .allPhotos:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.allPhotos.rawValue, for: indexPath)
            cell.textLabel?.text = "全部图片"
            return cell
        case .smartAlbums:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.collection.rawValue, for: indexPath)
            let collection = smartAlbums.object(at: indexPath.row)
            cell.textLabel?.text = collection.localizedTitle
            return cell
        case .userCollections:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.collection.rawValue, for: indexPath)
            let collection = userCollections.object(at: indexPath.row)
            cell.textLabel?.text = collection.localizedTitle
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch Section(rawValue: indexPath.section)! {
        case .allPhotos:
            let gridVC = MHZPhotoGridVC()
            gridVC.fetchResult = allPhotos
            self.navigationController?.pushViewController(gridVC, animated: true)
        case .smartAlbums:
            let gridVC = MHZPhotoGridVC()
            gridVC.fetchResult = allPhotos
            self.navigationController?.pushViewController(gridVC, animated: true)
        case .userCollections:
            let gridVC = MHZPhotoGridVC()
            gridVC.fetchResult = allPhotos
            self.navigationController?.pushViewController(gridVC, animated: true)
        }
    }

}
