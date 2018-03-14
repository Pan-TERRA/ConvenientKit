//
//  Screen+Size.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 14.03.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

public extension UIWindow {
    
    static public var screenSize: CGSize {
        return UIApplication.shared.keyWindow?.bounds.size ?? .zero
    }
    
}

public extension UIScreen {
    
    static public var screenSize: CGSize {
        return UIApplication.shared.keyWindow?.bounds.size ?? .zero
    }
    
}

public extension UIDevice {
    
    static public var screenSize: CGSize {
        return UIApplication.shared.keyWindow?.bounds.size ?? .zero
    }
    
}
