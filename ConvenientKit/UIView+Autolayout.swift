//
//  UIView+Autolayout.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 26.04.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

public typealias ViewAnchors = (top: NSLayoutConstraint?, left: NSLayoutConstraint?, bottom: NSLayoutConstraint?, right: NSLayoutConstraint?, width: NSLayoutConstraint?, height: NSLayoutConstraint?)

public extension UIView {
    
    public func addConstraintsWithFormat(_ format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    public func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    
    public func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        _ = anchorWithReturnAnchors(top, left: left, bottom: bottom, right: right, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant, widthConstant: widthConstant, heightConstant: heightConstant)
    }
    
    public func anchorWithReturnAnchors(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> ViewAnchors {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        var returnAnchors: ViewAnchors
        
        if let top = top {
            let anchor = topAnchor.constraint(equalTo: top, constant: topConstant)
            anchors.append(anchor)
            returnAnchors.top = anchor
        }
        
        if let left = left {
            let anchor = leftAnchor.constraint(equalTo: left, constant: leftConstant)
            anchors.append(anchor)
            returnAnchors.left = anchor
        }
        
        if let bottom = bottom {
            let anchor = bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant)
            anchors.append(anchor)
            returnAnchors.bottom = anchor
        }
        
        if let right = right {
            let anchor = rightAnchor.constraint(equalTo: right, constant: -rightConstant)
            anchors.append(anchor)
            returnAnchors.right = anchor
        }
        
        if widthConstant > 0 {
            let anchor = widthAnchor.constraint(equalToConstant: widthConstant)
            anchors.append(anchor)
            returnAnchors.width = anchor
        }
        
        if heightConstant > 0 {
            let anchor = heightAnchor.constraint(equalToConstant: heightConstant)
            anchors.append(anchor)
            returnAnchors.height = anchor
        }
        
        anchors.forEach({$0.isActive = true})
        
        return returnAnchors
    }
    
    @discardableResult
    public func anchorCenterXToSuperview(constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
        return self
    }
    
    @discardableResult
    public func anchorCenterXToView(_ view: UIView, constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = view.centerXAnchor
        centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func anchorCenterYToView(_ view: UIView, constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = view.centerYAnchor
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func anchorCenterYToSuperview(constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
        return self
    }
    
    @discardableResult
    public func anchorCenterSuperview() -> UIView {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
        return self
    }
    
    @discardableResult
    public func anchorTop(_ top: NSLayoutYAxisAnchor, _ constant: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchor = topAnchor.constraint(equalTo: top, constant: constant)
        anchor.isActive = true
        return self
    }
    
    @discardableResult
    public func anchorBottom(_ bottom: NSLayoutYAxisAnchor, _ constant: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchor = bottomAnchor.constraint(equalTo: bottom, constant: -constant)
        anchor.isActive = true
        return self
    }
    
    @discardableResult
    public func anchorLeft(_ left: NSLayoutXAxisAnchor, _ constant: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchor = leftAnchor.constraint(equalTo: left, constant: constant)
        anchor.isActive = true
        return self
    }
    
    @discardableResult
    public func anchorRight(_ right: NSLayoutXAxisAnchor, _ constant: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchor = rightAnchor.constraint(equalTo: right, constant: -constant)
        anchor.isActive = true
        return self
    }
    
    @discardableResult
    public func anchorWidth(_ constant: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchor = widthAnchor.constraint(equalToConstant: constant)
        anchor.isActive = true
        return self
    }
    
    @discardableResult
    public func anchorHeight(_ constant: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchor = heightAnchor.constraint(equalToConstant: constant)
        anchor.isActive = true
        return self
    }
    
}

