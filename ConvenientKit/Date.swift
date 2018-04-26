//
//  Date.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 26.04.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

import Foundation

public extension Date {
    
    public var day: Int { return Calendar.current.component(.day, from: self) }
    public var month: Int { return Calendar.current.component(.month, from: self) }
    public var year: Int { return Calendar.current.component(.year, from: self) }
    
    public var monthName: String { return DateFormatter().monthSymbols[month - 1] }
}
