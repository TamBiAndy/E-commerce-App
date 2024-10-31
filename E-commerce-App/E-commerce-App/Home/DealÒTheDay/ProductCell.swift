//
//  ProductCell.swift
//  E-commerce-App
//
//  Created by Andy on 20/10/2024.
//

import UIKit
import Cosmos

class ProductCell: UICollectionViewCell {
    
    struct ViewState {
        let imageUrl: String?
        let title: String?
        let description: String?
        let currentPrice: Int?
        let originPrice: Int?
        let percentOff: Int?
        let rating: Int?
        let descripFont: UIFont?
    }
    
    static let identifier = "ProductCell"
    
    //MARK: - UIComponent
    
    lazy var contentVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
    
    lazy var productImgView = UIImageView(frame: .zero)
        .with(\.contentMode, setTo: .scaleToFill)
        .with(\.layer.cornerRadius, setTo: 4)
        .with(\.clipsToBounds, setTo: true)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 12))
        .with(\.textColor, setTo: .black)
        .with(\.numberOfLines, setTo: 1)
    
    lazy var lblDescription = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 10))
        .with(\.textColor, setTo: .black)
        .with(\.numberOfLines, setTo: 2)
    
    lazy var lblCurrentPrice = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 12))
        .with(\.textColor, setTo: .black)
    
    lazy var percentHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 4)
    
    lazy var lblOriginPrice = UILabel(frame: .zero)
        .with(\.font, setTo: .light(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "808488"))
    
    lazy var lblPercent = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 10))
        .with(\.textColor, setTo: UIColor(hexString: "FE735C"))
    
    lazy var cosmosView = CosmosView(frame: .zero)
        .with(\.settings.updateOnTouch, setTo: false)
        .with(\.settings.fillMode, setTo: .full)
        .with(\.settings.starSize, setTo: 14)
        .with(\.settings.starMargin, setTo: 0)
        .with(\.settings.filledColor, setTo: UIColor(hexString: "EDB310"))
        .with(\.settings.emptyBorderColor, setTo: UIColor(hexString: "BBBBBB"))
        .with(\.settings.filledBorderColor, setTo: UIColor(hexString: "EDB310"))
        .with(\.settings.filledImage, setTo: UIImage(named: "fillStar"))
        .with(\.settings.emptyImage, setTo: UIImage(named: "emptyStar"))
        .with(\.rating, setTo: 4)
        .with(\.settings.textFont, setTo: .regular(size: 10))
        .with(\.settings.textColor, setTo: UIColor(hexString: "A4A9B3"))
        
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private func
    private func setupCell() {
        contentView.addSubview(contentVstack)
        contentVstack.backgroundColor = .white
        contentVstack.layer.cornerRadius = 6

        contentVstack.addArrangedSubview(productImgView)
        contentVstack.addArrangedView(lblTitle, spacingAbove: 8)
        contentVstack.addArrangedView(lblDescription, spacingAbove: 4)
        contentVstack.addArrangedView(lblCurrentPrice, spacingAbove: 4)
        contentVstack.addArrangedView(percentHstack, spacingAbove: 4)
        contentVstack.addArrangedView(cosmosView, spacingAbove: 4)
        
        percentHstack.addArrangedSubviews([lblOriginPrice, lblPercent, UIView()])
        
        contentVstack.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(4)
        }

        productImgView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    func bind(viewState: ViewState) {
        let imageUrl = viewState.imageUrl
        productImgView.kf.setImage(with: URL(string: imageUrl ?? ""))
        lblDescription.text = viewState.description
        lblCurrentPrice.text = "€\(viewState.currentPrice ?? 0)"
        lblDescription.font = viewState.descripFont
        
        if let title = viewState.title {
            lblTitle.isHidden = false
            lblTitle.text = viewState.title
        } else {
            lblTitle.isHidden = true
        }
        
        if let rating = viewState.rating {
            cosmosView.isHidden = false
            cosmosView.text = "\(viewState.rating ?? 0)"
        } else {
            cosmosView.isHidden = true
        }
        
        if let originPrice = viewState.originPrice {
            lblOriginPrice.isHidden = false
            lblOriginPrice.text =  "€\(viewState.originPrice ?? 0)"
        } else {
            lblOriginPrice.isHidden = true
        }
       
        if let percent = viewState.percentOff {
            lblPercent.isHidden = false
            lblPercent.text = "\(viewState.percentOff ?? 0)% Off"
        } else {
            lblPercent.isHidden = true
        }
    }
}
