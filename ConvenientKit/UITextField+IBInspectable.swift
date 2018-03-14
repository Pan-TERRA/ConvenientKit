//
//  UITextField+IBInspectable.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 14.03.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

public extension UITextField {
    
    @IBInspectable public var placeholderColor: UIColor {
        get {
            guard let currentAttributedPlaceholderColor = attributedPlaceholder?.attribute(NSAttributedStringKey.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else { return UIColor.clear }
            return currentAttributedPlaceholderColor
        }
        set {
            guard let currentAttributedString = attributedPlaceholder else { return }
            let attributes = [NSAttributedStringKey.foregroundColor : newValue]
            
            attributedPlaceholder = NSAttributedString(string: currentAttributedString.string, attributes: attributes)
        }
    }
}

