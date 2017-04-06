//
//  PresentMenuAnimator.swift
//  Muv
//
//  Created by Ben Thrasher on 4/6/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import UIKit

class PresentMenuAnimator : NSObject {
}

extension PresentMenuAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        //puts sidemenu under home page in view stack
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        //puts a snapshot of main menu over menu to persist appearance
        guard let snapshot = fromVC.view.snapshotView(afterScreenUpdates: false) else {
            return
        }
        snapshot.tag = MenuHelper.snapshotNumber
        snapshot.isUserInteractionEnabled = false
        snapshot.layer.shadowOpacity = 0.7
        containerView.insertSubview(snapshot, aboveSubview: toVC.view)
        
        //
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                            snapshot.center.x += UIScreen.main.bounds.width * MenuHelper.menuWidth
                        },
                       completion: { _ in
                            fromVC.view.isHidden = false
                            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
