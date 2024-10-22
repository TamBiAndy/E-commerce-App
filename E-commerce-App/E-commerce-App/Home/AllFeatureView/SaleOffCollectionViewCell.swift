//
//  SaleOffTableViewCell.swift
//  E-commerce-App
//
//  Created by Andy on 18/10/2024.
//

import UIKit

class SaleOffCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SaleOffCollectionViewCell"
    
    lazy var bgImageView = UIImageView(frame: .zero)
        .with(\.contentMode, setTo: .scaleToFill)
        .with(\.layer.cornerRadius, setTo: 12)
        .with(\.clipsToBounds, setTo: true)
    
    lazy var leftVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
    
    lazy var lblTitleSale = UILabel(frame: .zero)
        .with(\.font, setTo: .bold(size: 20))
        .with(\.textColor, setTo: .white)
    
    lazy var lblProduct = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: .white)
    
    lazy var lblColor = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: .white)
    
    lazy var btnNext: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Shop Now", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .semiBold(size: 12)
        btn.setImage(UIImage(named: "ic_arrow"), for: .normal)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 6
        btn.semanticContentAttribute = .forceRightToLeft
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(with saleOffInfor: SaleOffInfor.SaleOff) {
        self.bgImageView.kf.setImage(with: URL(string: saleOffInfor.image ?? ""))
        self.lblTitleSale.text = saleOffInfor.title
        self.lblProduct.text = saleOffInfor.productName
        self.lblColor.text = saleOffInfor.color
    }
    
    func setupCell() {
        contentView.addSubViews([bgImageView, leftVstack])
        leftVstack.addArrangedSubview(lblTitleSale)
        leftVstack.addArrangedView(lblProduct, spacingAbove: 8)
        leftVstack.addArrangedView(lblColor, spacingAbove: 4)
        leftVstack.addArrangedView(btnNext, spacingAbove: 12)
        
        bgImageView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        leftVstack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().inset(40)
        }
        
        btnNext.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(100)
        }
        
        
    }
}
