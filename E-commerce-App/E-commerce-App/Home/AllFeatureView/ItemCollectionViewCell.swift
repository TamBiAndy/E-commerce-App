//
//  FeatureTableViewCell.swift
//  E-commerce-App
//
//  Created by Andy on 18/10/2024.
//

import UIKit
import Kingfisher
import Moya

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    
    lazy var contenVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 4)
    
    lazy var categoryImgView = UIImageView(frame: .zero)
        .with(\.contentMode, setTo: .scaleToFill)
        .with(\.layer.cornerRadius, setTo: 28)
        .with(\.clipsToBounds, setTo: true)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 10))
        .with(\.textColor, setTo: UIColor(hexString: "21003D"))
        .with(\.textAlignment, setTo: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.addSubview(contenVstack)
        contenVstack.addArrangedSubviews([categoryImgView, lblTitle])
        
        contenVstack.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.trailing.bottom.equalToSuperview().inset(8)
        }
        
        categoryImgView.snp.makeConstraints { make in
            make.height.width.equalTo(56)
        }
    }
    
    func updateCell(with category: ItemCategory.Category) {
        let urlString = category.image
        self.categoryImgView.kf.setImage(with: URL(string: urlString ?? ""))
        self.lblTitle.text = category.title
    }
}

