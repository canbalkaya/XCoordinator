//
//  File.swift
//  
//
//  Created by Can Balkaya on 8/13/22.
//

import UIKit

extension Animation {
    
    public static let fade = Animation(
        presentation: InteractiveTransitionAnimation.fade,
        dismissal: InteractiveTransitionAnimation.fade
    )
}

extension InteractiveTransitionAnimation {
    
    fileprivate static let fade = InteractiveTransitionAnimation(duration: 0.2) { transitionContext in
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!

        toView.alpha = 0.0
        containerView.addSubview(toView)

        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: [.curveLinear],
            animations: {
                toView.alpha = 1
            },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        )
    }
}
