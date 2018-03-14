//
//  ClassName.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 13.03.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

import Foundation

public extension NSObject {
    
    public var className: String {
        return String(describing: type(of: self))
    }
    
    public class var className: String {
        return String(describing: self)
    }
}
