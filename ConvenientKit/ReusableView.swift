//
//  ReusableView.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 13.03.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

public protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    public static var defaultReuseIdentifier: String {
        return className
    }
}

extension UITableViewCell: ReusableView {}
extension UICollectionReusableView: ReusableView {}
