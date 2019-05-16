//
//  ModalAnimator.swift
//  Test
//
//  Created by 박진수 on 16/05/2019.
//  Copyright © 2019 Jinsu. Park. All rights reserved.
//

import UIKit

class ModalAnimator: NSObject {

}

extension ModalAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
             else { return }
        let containerView = transitionContext.containerView
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        let screenBounds = UIScreen.main.bounds
        let bottomLeftCorner = CGPoint(x: 0, y: screenBounds.height)
        let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                                fromVC.view.frame = finalFrame
                       },
                       completion: { _ in
                                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                       })
        
    }
}
