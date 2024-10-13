//
//  UIFont+Ext.swift
//  E-commerce-App
//
//  Created by Andy on 12/10/2024.
//

import UIKit

extension UIFont {
    
    static func bold(size: CGFloat) -> UIFont {
        .init(name: ".SFArmenian-Bold", size: size)!
    }
    
    static func semiBold(size: CGFloat) -> UIFont {
        .init(name: ".SFArmenian-SemiBold", size: size)!
    }
    
    static func regular(size: CGFloat) -> UIFont {
        .init(name: ".SFArmenian-Regular", size: size)!
    }
    
    static func ultralight(size: CGFloat) -> UIFont {
        .init(name: ".SF-Armenian-Ultralight", size: size)!
    }
}
