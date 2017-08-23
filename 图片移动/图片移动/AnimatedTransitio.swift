//
//  AnimatedTransitio.swift
//  图片移动
//
//  Created by 黄振华 on 2017/8/23.
//  Copyright © 2017年 黄振华. All rights reserved.
//

import UIKit

enum AnimatedTransitiotype {
    case push,pop
}

class AnimatedTransitio: NSObject ,UIViewControllerAnimatedTransitioning{
    
    var time : TimeInterval?
    
    var  animatedTransitiotype = AnimatedTransitiotype.push
    
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
    
    return  self.time!
    
    }
  
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        
        switch animatedTransitiotype {
        case .push:
            let fromVC = transitionContext.viewController(forKey: .from) as! OneController
            
            
            let toVC = transitionContext.viewController(forKey: .to) as! TwoViewController
            
            
            let containerView = transitionContext.containerView
            
            
            let cell = fromVC.tableview.cellForRow(at: fromVC.index!)
            
            let tempView = cell?.imageView?.snapshotView(afterScreenUpdates: false)
            
            tempView?.frame = (cell?.imageView?.convert((cell?.imageView?.bounds)!, to: containerView))!
            
            
            containerView.addSubview(toVC.view)
            
            containerView.addSubview(tempView!)
            
            
            cell?.imageView?.isHidden = true
            
            toVC.imageView.isHidden = true
            
            toVC.view.alpha = 0
            
            UIView.animate(withDuration: self.time!, animations: {
                tempView?.frame = toVC.imageView.convert(toVC.imageView.bounds, to: containerView)
                toVC.view.alpha = 1
                
            }) { (_) in
                tempView?.isHidden = true
                toVC.imageView.isHidden = false
                cell?.imageView?.isHidden = false
                transitionContext.completeTransition(true)
            }
            
            
        case .pop:
            
            let fromVC = transitionContext.viewController(forKey: .from) as! TwoViewController
            
            
            let toVC = transitionContext.viewController(forKey: .to) as! OneController
            
            
            let containerView = transitionContext.containerView
            
            
            let cell = toVC.tableview.cellForRow(at: toVC.index!)
            
            let tempView = fromVC.imageView.snapshotView(afterScreenUpdates: false)
            
            tempView?.frame = fromVC.imageView.convert(fromVC.imageView.bounds, to: containerView)
            
            
            
            containerView.addSubview(toVC.view)
            
            containerView.addSubview(tempView!)
            
            
            
            cell?.imageView?.isHidden = true
            
            fromVC.imageView.isHidden = true
            
            toVC.view.alpha = 0
            
            UIView.animate(withDuration: self.time!, animations: {
                tempView?.frame = (cell?.imageView?.convert((cell?.imageView?.bounds)!, to: containerView))!
                toVC.view.alpha = 1
                
            }) { (_) in
                tempView?.isHidden = true
                fromVC.imageView.isHidden = false
                cell?.imageView?.isHidden = false
                transitionContext.completeTransition(true)
            }
        }


        

        

       
    
    
    
    
    
    
    }

}
