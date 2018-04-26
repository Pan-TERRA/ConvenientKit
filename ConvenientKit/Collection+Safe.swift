//
//  Collection+Safe.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 26.04.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

import Foundation

public extension Collection {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
