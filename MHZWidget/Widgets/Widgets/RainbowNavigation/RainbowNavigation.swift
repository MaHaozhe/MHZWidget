//
//  RainbowNavigation.swift
//  RainbowNavigation
//
//  Created by MaHaoZhe on 2019/7/8.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class RainbowNavigation: NSObject,UINavigationControllerDelegate {
    
    fileprivate weak var navigationController:UINavigationController?
    fileprivate var pushAnimator:RainbowPushAnimator = RainbowPushAnimator()
    fileprivate var popAnimatior:RainbowPopAnimator = RainbowPopAnimator()
    fileprivate var dragPop:RainbowDragPop = RainbowDragPop()
    
    override public init() {
        super.init()
        dragPop.popAnimator = popAnimatior
    }
    
    open func wireTo(navitaionController nc:UINavigationController) {
        self.navigationController = nc
        self.dragPop.navigationController = nc
        self.navigationController?.delegate = self
    }
    
    
    open func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .pop {
            return popAnimatior
        }
        return pushAnimator
    }
    
    
    open func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return dragPop.interacting ? dragPop : nil
        
    }
    
}
