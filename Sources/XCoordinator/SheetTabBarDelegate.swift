//
//  SheetTabBarDelegate.swift
//  
//
//  Created by Can Balkaya on 8/9/22.
//

import UIKit

open class SheetTabBarDelegate: NSObject, UITabBarControllerDelegate {

    // MARK: - Properties
    public var didSelectSheet: (UIViewController) -> Void

    // MARK: - Initialization
    public init(didSelectSheet: @escaping (UIViewController) -> Void) {
        self.didSelectSheet = didSelectSheet
    }

    // MARK: - Methods
    open func tabBarController(_ tabBarController: UITabBarController,
                               shouldSelect viewController: UIViewController) -> Bool {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if viewController.children.first is EmptyViewController {
            didSelectSheet(viewController)
            return false
        } else {
            return true
        }
    }
}
