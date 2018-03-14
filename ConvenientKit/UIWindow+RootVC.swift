//
//  UIWindow+RootVC.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 14.03.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

extension UIWindow {
    
    open func set(toRootViewController: UIViewController) {
        
        let newRootViewController = toRootViewController
        
        let previousViewController = rootViewController
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        layer.add(transition, forKey: kCATransition)
        
        rootViewController = newRootViewController
        
        // Update status bar appearance using the new view controllers appearance - animate if needed
        if UIView.areAnimationsEnabled {
            UIView.animate(withDuration: CATransaction.animationDuration()) {
                newRootViewController.setNeedsStatusBarAppearanceUpdate()
            }
        } else {
            newRootViewController.setNeedsStatusBarAppearanceUpdate()
        }
        
        // The presenting view controllers view doesn't get removed from the window as its currently transistioning and presenting a view controller
        if let transitionViewClass = NSClassFromString("UITransitionView") {
            for subview in subviews where subview.isKind(of: transitionViewClass) {
                subview.removeFromSuperview()
            }
        }
        if let previousViewController = previousViewController {
            // Allow the view controller to be deallocated
            previousViewController.dismiss(animated: false) {
                // Remove the root view in case its still showing
                previousViewController.view.removeFromSuperview()
            }
        }
    }
}
