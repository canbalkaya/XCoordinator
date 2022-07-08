//
//  Transition+Ext.swift
//  RxSwift
//
//  Created by Can Balkaya on 7/1/22.
//

import UIKit

public extension Transition {

    static func presentFullScreen(_ presentable: Presentable, animation: Animation? = nil) -> Transition {
        presentable.viewController?.modalPresentationStyle = .fullScreen
        return .present(presentable, animation: animation)
    }

    static func dismissAll() -> Transition {
        return Transition(presentables: [], animationInUse: nil) { rootViewController, options, completion in
            guard let presentedViewController = rootViewController.presentingViewController else {
                completion?()
                return
            }
            presentedViewController.dismiss(animated: options.animated) {
                Transition
                    .dismissAll()
                    .perform(on: rootViewController,
                             with: options,
                             completion: completion)
            }
        }
    }
}
