//
//  StringSize.swift
//  ConvenientKit
//
//  Created by Vlad Krut on 14.03.2018.
//  Copyright © 2018 Vlad Krut. All rights reserved.
//

public extension String {
    
    public func textHeightWithFont(font: UIFont, forFixedWidth width: CGFloat, _ paragraphStyle: NSParagraphStyle? = nil) -> CGFloat {
        
        let mutableParagraph = NSMutableParagraphStyle()
        
        if paragraphStyle != nil {
            mutableParagraph.setParagraphStyle(paragraphStyle!)
        } else {
            mutableParagraph.lineBreakMode = .byWordWrapping
            mutableParagraph.alignment = .justified
        }
        
        let attributes: [NSAttributedStringKey : Any] = [NSAttributedStringKey.font: font as Any,
                                                         NSAttributedStringKey.paragraphStyle: mutableParagraph as Any]
        
        let rectSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingRect = (self as NSString).boundingRect(with: rectSize, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: attributes, context: nil)
        
        return ceil(boundingRect.size.height)
    }
}
