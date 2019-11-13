//
//  MHZPlayerVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/9/25.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class MHZPlayerVC: CommonVC,SuperPlayerDelegate {
    
    var _playerView : SuperPlayerView!
    var _fatherView : UIView!
    override func viewDidLoad() {
        
        self.setupPlayerView()
        
    }
    
    func setupPlayerView() {
        _fatherView = UIView.init()
        _fatherView.backgroundColor = UIColor.white
        self.view.addSubview(_fatherView)
        _fatherView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.56)
        }
        
        _playerView = SuperPlayerView.init()
        //设置代理，用于接受时间
        _playerView.delegate = self
        //设置父view _playerView会被自动添加好fatherView下面
        _playerView.fatherView = _fatherView;
        _playerView.isLockScreen = false
        let playerModel = SuperPlayerModel.init()
        //设置播放地址，直播点播都可以
        playerModel.videoURL = "http://200024424.vod.myqcloud.com/200024424_709ae516bdf811e6ad39991f76a4df69.f20.mp4"
        //开始播放
        _playerView.play(with: playerModel)
        
    }
    
    //delegate
    func superPlayerFullScreenChanged(_ player: SuperPlayerView!) {
        if _playerView.isFullScreen == false {
            _playerView.isFullScreen = true
            _fatherView.snp.remakeConstraints { (make) in
                make.edges.equalTo(UIApplication.shared.keyWindow ?? self.view)
            }
            
            
        }
        
    }

    func superPlayerBackAction(_ player: SuperPlayerView!) {
//        if _playerView.fatherView.isEqual(UIApplication.shared.keyWindow) {
//            _playerView.fatherView = _fatherView
//        }
    }
}
