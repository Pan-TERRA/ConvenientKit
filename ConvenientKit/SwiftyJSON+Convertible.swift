//
//  JSON.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 26.04.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

#if canImport(SwiftyJSON)

import SwiftyJSON

public extension Dictionary {
    
    public func asJSON() -> JSON {
        return JSON(self)
    }
}

public extension Data {
    
    public func asJSON() -> JSON {
        return JSON(self)
    }
}

#endif
