//
//  ViewFromNib.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 13.03.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

public protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    public static var nibName: String {
        return className
    }
}

public extension UIView {
    
    public class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    @discardableResult
    public func fromNib<T: UIView>() -> T? {
        
        guard let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?[0] as? T else {
            return nil
        }
        
        addSubview(view)
        view.frame = bounds
        return view
    }
}

open class ViewFromNib: UIView, NibLoadableView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        fromNib()
        setupViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fromNib()
        setupViews()
    }
    
    open func setupViews() {}
}
