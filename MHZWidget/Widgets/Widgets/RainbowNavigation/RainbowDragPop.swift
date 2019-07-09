//
//  RainbowDragPop.swift
//  RainbowNavigation
//
//  Created by MaHaoZhe on 2019/7/8.
//  Copyright © 2019 HachiTech. All rights reserved.
//

import UIKit

class RainbowDragPop: UIPercentDrivenInteractiveTransition {
    
    var interacting = false
    weak var navigationController:UINavigationController!{
        didSet{
            let panGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(RainbowDragPop.handlePan(panGesture:)))
            panGesture.edges = UIRectEdge.left
            navigationController.view.addGestureRecognizer(panGesture)
        }
    }
    
    weak var popAnimator:RainbowPopAnimator!
    
    override var completionSpeed: CGFloat{
        get{
            return max(CGFloat(0.5), 1 - self.percentComplete)
        } set {
            self.completionSpeed = newValue
        }
    }
    
    @objc func handlePan(panGesture:UIScreenEdgePanGestureRecognizer){
        let offset = panGesture.translation(in: panGesture.view)
        let velocity = panGesture.velocity(in: panGesture.view)
        
        switch panGesture.state {
        case .began:
            if !self.popAnimator.animating {
                interacting = true
                if velocity.x > 0 && self.navigationController.viewControllers.count > 0{
                    navigationController.popViewController(animated: true)
                }
            }
        case .changed:
            if interacting {
                var progress = offset.x / panGesture.view!.bounds.width
                progress = max(progress,0)
                
                self.update(progress)
            }
        case .ended:
            if interacting {
                if panGesture.velocity(in: panGesture.view!).x > 0{
                    self.finish()
                }else{
                    self.cancel()
                }
                interacting = false
            }
        case .cancelled:
            if interacting {
                self.cancel()
                interacting = false
            }
        default:
            break
        }
    }
}
