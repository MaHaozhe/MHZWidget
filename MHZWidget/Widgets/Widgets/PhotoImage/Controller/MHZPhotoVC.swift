//
//  MHZPhotoVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/21.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZPhotoVC: CommonVC {
    
    var photoImg : UIImageView!
    var takePhotoBtn : UIButton!
    var customPhotoBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.setupSubviews()
    }
    
    func setupSubviews() {
        photoImg = UIImageView.init()
        photoImg.contentMode = .scaleAspectFit
        self.view.addSubview(photoImg)
        
        takePhotoBtn = UIButton.init()
        takePhotoBtn.setTitle("获取相片", for: .normal)
        takePhotoBtn.setTitleColor(.black, for: .normal)
        takePhotoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        takePhotoBtn.layer.borderColor = UIColor.black.cgColor
        takePhotoBtn.layer.borderWidth = 1
        takePhotoBtn.layer.cornerRadius = 5
        takePhotoBtn.addTarget(self, action: #selector(getPhotoAction), for: .touchUpInside)
        self.view.addSubview(takePhotoBtn)
        
        customPhotoBtn = UIButton.init()
        customPhotoBtn.setTitle("自定义相册", for: .normal)
        customPhotoBtn.setTitleColor(.black, for: .normal)
        customPhotoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        customPhotoBtn.layer.borderColor = UIColor.black.cgColor
        customPhotoBtn.layer.borderWidth = 1
        customPhotoBtn.layer.cornerRadius = 5
        customPhotoBtn.addTarget(self, action: #selector(pushToCunstomPhotoVC), for: .touchUpInside)
        self.view.addSubview(customPhotoBtn)
        
        photoImg.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
        
        takePhotoBtn.snp.makeConstraints { (make) in
            make.top.equalTo(photoImg.snp_bottomMargin).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(44)
            make.centerX.equalTo(self.view).offset(-80)
        }
        
        customPhotoBtn.snp.makeConstraints { (make) in
            make.top.equalTo(photoImg.snp_bottomMargin).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(44)
            make.centerX.equalTo(self.view).offset(80)
        }
        
    }
    
    
    @objc func getPhotoAction() {
        let photoSourcePicker = UIAlertController()
        let takePhoto = UIAlertAction(title: "照相", style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .photoLibrary)
        }
        
        let choosePhoto = UIAlertAction(title: "相册", style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .photoLibrary)
        }
        
        photoSourcePicker.addAction(takePhoto)
        photoSourcePicker.addAction(choosePhoto)
        photoSourcePicker.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        present(photoSourcePicker,animated: true)
    }
    
    
    func presentPhotoPicker(sourceType: UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker,animated: true)
    }
    
    
    @objc func pushToCunstomPhotoVC() {
//        self.navigationController?.pushViewController(MHZPhotoGroupVC(), animated: true)
        let navVC = MHZNavigaitonC.init(rootViewController: MHZPhotoGroupVC.init(style: .plain))
        present(navVC,animated: true)
    }
    
}

extension MHZPhotoVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoImg.image = image
    }
}
