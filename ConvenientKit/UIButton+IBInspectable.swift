//
//  UIButton+IBInspectable.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 14.03.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

private var pTouchAreaEdgeInsets: UIEdgeInsets = .zero

public extension UIButton {
    
    @IBInspectable public var expandedTouchArea: CGFloat {
        get {
            return -touchAreaEdgeInsets.top
        }
        set {
            touchAreaEdgeInsets = .init(top: -newValue,
                                        left: -newValue,
                                        bottom: -newValue,
                                        right: -newValue)
        }
    }
    
    public var touchAreaEdgeInsets: UIEdgeInsets {
        get {
            if let value = objc_getAssociatedObject(self, &pTouchAreaEdgeInsets) as? NSValue {
                var edgeInsets: UIEdgeInsets = .zero
                value.getValue(&edgeInsets)
                return edgeInsets
            }
            else {
                return .zero
            }
        }
        set(newValue) {
            var newValueCopy = newValue
            let objCType = NSValue(uiEdgeInsets: .zero).objCType
            let value = NSValue(&newValueCopy, withObjCType: objCType)
            objc_setAssociatedObject(self, &pTouchAreaEdgeInsets, value, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}

extension UIButton {
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if UIEdgeInsetsEqualToEdgeInsets(self.touchAreaEdgeInsets, .zero) || !self.isEnabled || self.isHidden {
            return super.point(inside: point, with: event)
        }
        
        let relativeFrame = self.bounds
        let hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.touchAreaEdgeInsets)
        
        return hitFrame.contains(point)
    }
}

