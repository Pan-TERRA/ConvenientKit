//
//  UIView+Constraints.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 26.04.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

public extension UIView {
    
    public var widthConstraint: NSLayoutConstraint? {
        return constraints.filter({ ($0.firstItem as? UIView) == self && $0.firstAnchor == widthAnchor && $0.secondAnchor == nil && $0.className == "NSLayoutConstraint" }).first
    }
    
    public var heightConstraint: NSLayoutConstraint? {
        return constraints.filter({ ($0.firstItem as? UIView) == self && $0.firstAnchor == heightAnchor && $0.secondAnchor == nil && $0.className == "NSLayoutConstraint" }).first
    }
}

public extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter
     multiplier: CGFloat
     - returns: NSLayoutConstraint
     
     Demo usage:
     
         @IBOutlet weak var myDemoConstraint: NSLayoutConstraint!
     
         override func viewDidLoad() {
     
             let newMultiplier: CGFloat = 0.80
             myDemoConstraint = myDemoConstraint.setMultiplier(newMultiplier)
     
             // We may need to call view.layoutIfNeeded()
         }
     */
    public func setMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
