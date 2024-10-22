//
//  UIImageView+Ext.swift
//  E-commerce-App
//
//  Created by Andy on 17/10/2024.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } else { return }
        }
    }
}
