//
//  RainbowColorSource.swift
//  RainbowNavigation
//
//  Created by MaHaoZhe on 2019/7/8.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

@objc public protocol RainbowColorSource {
    @objc optional func navigationBarInColor() -> UIColor
    @objc optional func navigationBarOutColor() -> UIColor
}


@objc public protocol RainbowNavigationMutable {
    @objc optional func currentNavigationBarColor() -> UIColor
}
