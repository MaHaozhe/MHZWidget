//
//  MHZNetworkDataVC.swift
//  MHZWidget
//
//  Created by MaHaoZhe on 2019/6/18.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit
import Alamofire

class MHZNetworkDataVC: CommonVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.AF.request("https://ic.snssdk.com/api/news/feed/v88/?fp=92TZFlxOFMQrFlP5PrU1FzmILSKb&version_code=7.2.4&app_name=news_article&vid=3E3E36E0-7472-4945-9976-3C6F75C6895A&device_id=68331818174&channel=App%20Store&resolution=640*1136&aid=13&ab_feature=794527&ab_group=794527&openudid=ae468193c9a9835083716bbcef8c47c33a9cc25f&pos=5pe9vb/88Pzt0fLz+vTp6Pn4v72nva2xl729v/zw/O3R/On06ej5+L+9p72tsZe9vb/x/On06ej5+L+9p72upLOlpKirq6ysq62sqa6rrLGXvb2/8fLz+vTp6Pn4v72nvaysq7OpqKmppamuqauura6psZe9vb/+9Onkv72nvb94EQp5JzG/sZe9vb/x8v788cLx/On47unC7fLuv72nveaXvb29vb/p9PD47un88O2/vae9rKirraSsrqmrpLOupamqqLGXvb29vb/t7/Lr9PP++L+9p72/eBEKeScxeCUfv7GXvb29vb/+9Onkv72nvb94EQp5JzF4JR+/sZe9vb29v/7y8u/59PP86fjL/PHo+O6/vae95pe9vb29vb2/8fLz+vTp6Pn4v72nvaysq7OpqKmppamuqauura6psZe9vb29vb2/8fzp9Ono+fi/vae9rqSzpaSoq6usrKutrKmuq6yXvb29veCxl729vb2//Pn57/ju7r+9p72/y9TL3HgRCnknMXgyEXgXBngkIngBJ7+Xvb3gl+A=&update_version_code=72423&idfv=3E3E36E0-7472-4945-9976-3C6F75C6895A&ac=WIFI&os_version=10.0.1&ssmix=a&device_platform=iphone&iid=75703365420&ab_client=a1,f2,f7,e1&device_type=iPhone%205S&idfa=F24AB529-447E-4978-B37A-8086A2E627C0&language=zh-Hans-CN&image=1&list_count=17&count=20&tt_from=pull&latitude=39.89566116014361&category=news_hot&city=%E5%8C%97%E4%BA%AC&last_refresh_sub_entrance_interval=4&loc_time=1560913469&refer=1&refresh_reason=1&concern_id=&longitude=116.4544843463034&session_refresh_idx=3&strict=0&LBS_status=authroize&detail=1&client_extra_params=%7B%22playparam%22%3A%22codec_type%3A0%22%7D&min_behot_time=1560913524&loc_mode=1&cp=5cDa0a94Ab67Aq1", method: .get).responseJSON { response in
            print(response)
        }
    }

}
