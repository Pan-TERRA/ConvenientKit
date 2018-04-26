//
//  UIButton+IgnoringState.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 26.04.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

public extension UIButton {
    
    public func setTitle(_ title: String?) {
        setTitle(title, for: .normal)
        setTitle(title, for: .focused)
        setTitle(title, for: .highlighted)
        setTitle(title, for: .disabled)
    }
    
    public func setTitleColor(_ color: UIColor?) {
        setTitleColor(color, for: .normal)
        setTitleColor(color, for: .focused)
        setTitleColor(color, for: .highlighted)
        setTitleColor(color, for: .disabled)
    }
}

