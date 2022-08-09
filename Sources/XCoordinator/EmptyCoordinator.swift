//
//  EmptyCoordinator.swift
//  
//
//  Created by Can Balkaya on 8/9/22.
//

import UIKit

public enum EmptyRoute: Route {
    case empty
}

open class EmptyViewController: UIViewController {
    
    // MARK: - Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
}

open class EmptyCoordinator: NavigationCoordinator<EmptyRoute> {
    
    // MARK: - Initialization
    public init() {
        super.init(initialRoute: .empty)
    }
    
    // MARK: - Overrides
    open override func prepareTransition(for route: EmptyRoute) -> NavigationTransition {
        let viewController = EmptyViewController()
        return .push(viewController)
    }
}
