//
//  CartTableViewCell.swift
//  E-commerce-App
//
//  Created by Andy on 01/11/2024.
//

import UIKit
import Cosmos

class CartTableViewCell: UITableViewCell {
    
    struct ViewState: Codable {
        let imageUrl: String?
        let title: String?
        let color: [String]?
        let rating: Double?
        let currentPrice: Double?
        let originPrice: Double?
        let salePercent: Int?
        let totalOrder: Int?
    }
    
    static let identifier = "CartTableViewCell"
    
    lazy var mainView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: .white)
        .with(\.layer.cornerRadius, setTo: 6)
    
    lazy var topHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 9)
        .with(\.alignment, setTo: .center)
    
    lazy var productImgView = UIImageView(frame: .zero)
        .with(\.contentMode, setTo: .scaleToFill)
        .with(\.layer.cornerRadius, setTo: 4)
        .with(\.clipsToBounds, setTo: true)
    
    lazy var detailVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
    
    lazy var lblProductName = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 14))
        .with(\.textColor, setTo: .black)
    
    lazy var variationHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 5)
    
    lazy var lblVariations = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 12))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Variations :")
    
    lazy var btnColor1: UIButton = {
        let btn = UIButton(type: .custom)
        btn.layer.cornerRadius = 2
        btn.layer.borderWidth = 0.3
        btn.layer.borderColor = UIColor(hexString: "0E0808").cgColor
        btn.backgroundColor = .clear
        btn.titleLabel?.font = .medium(size: 10)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    lazy var btnColor2: UIButton = {
        let btn = UIButton(type: .custom)
        btn.layer.cornerRadius = 2
        btn.layer.borderWidth = 0.3
        btn.layer.borderColor = UIColor(hexString: "0E0808").cgColor
        btn.backgroundColor = .clear
        btn.titleLabel?.font = .medium(size: 10)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    lazy var cosmosView = CosmosView(frame: .zero)
        .with(\.settings.updateOnTouch, setTo: false)
        .with(\.settings.fillMode, setTo: .full)
        .with(\.settings.starSize, setTo: 12)
        .with(\.settings.starMargin, setTo: 0)
        .with(\.settings.filledColor, setTo: UIColor(hexString: "F7B305"))
        .with(\.settings.emptyBorderColor, setTo: UIColor(hexString: "BBBBBB"))
        .with(\.settings.filledBorderColor, setTo: UIColor(hexString: "F7B305"))
        .with(\.settings.filledImage, setTo: UIImage(named: "fillStar"))
        .with(\.settings.emptyImage, setTo: UIImage(named: "emptyStar"))
        .with(\.settings.textFont, setTo: .medium(size: 12))
        .with(\.settings.textColor, setTo: .black)
    
    lazy var priceHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 11)
    
    lazy var priceView = UIView(frame: .zero)
        .with(\.layer.cornerRadius, setTo: 4)
        .with(\.layer.borderColor, setTo: UIColor(hexString: "CACACA").cgColor)
        .with(\.layer.borderWidth, setTo: 0.3)
        
    
    lazy var lblPrice = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 16))
        .with(\.textColor, setTo: .black)
    
    lazy var originPriceVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 1)
    
    lazy var lblOriginPrice = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "A7A7A7"))
    
    lazy var lblSalePercent = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 8))
        .with(\.textColor, setTo: UIColor(hexString: "EB3030"))
    
    let lineView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: UIColor(hexString: "BBBBBB"))
    
    lazy var bottomHstack = UIStackView(frame: .zero)
    
    lazy var lblTotal = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 12))
        .with(\.textColor, setTo: .black)
    
    lazy var lblTotalPrice = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 12))
        .with(\.textColor, setTo: .black)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.backgroundColor = .clear
        contentView.clipsToBounds = false
        self.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.addSubview(mainView)
        mainView.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: -4, blur: 9, spread: -7)
        mainView.addSubViews([topHstack, lineView, bottomHstack])
        topHstack.addArrangedSubviews([productImgView, detailVstack])
        detailVstack.addArrangedSubview(lblProductName)
        detailVstack.addArrangedView(variationHstack, spacingAbove: 5)
        detailVstack.addArrangedView(cosmosView, spacingAbove: 8)
        detailVstack.addArrangedView(priceHstack, spacingAbove: 11)
        
        variationHstack.addArrangedSubviews([lblVariations, btnColor1, btnColor2,UIView()])
        priceHstack.addArrangedSubviews([priceView, originPriceVstack, UIView()])
        priceView.addSubview(lblPrice)
        originPriceVstack.addArrangedSubviews([lblSalePercent, lblOriginPrice])
        bottomHstack.addArrangedSubviews([lblTotal, lblTotalPrice])
        
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.bottom.equalToSuperview().inset(7)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().inset(5)
        }
        
        topHstack.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(20)
        }
        
        productImgView.snp.makeConstraints { make in
            make.width.equalTo(130)
            make.height.equalTo(125)
            make.verticalEdges.equalToSuperview()
        }
        
        btnColor1.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(41)
        }
        
        btnColor2.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(41)
        }
         
        lblPrice.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(9)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(topHstack.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(1)
        }
        
        bottomHstack.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    func binding(with viewState: ViewState) {
        productImgView.kf.setImage(with: URL(string: viewState.imageUrl ?? ""))
        lblProductName.text = viewState.title
        lblPrice.text = "$\(String(format: "%.2f", viewState.currentPrice ?? 0))"
        lblOriginPrice.text = "$\(String(format:"%.2f",viewState.originPrice ?? 0))"
        lblSalePercent.text = "upto\(viewState.salePercent ?? 0)% off"
        lblTotal.text = "Total Order (\(viewState.totalOrder ?? 0)) :"
        let totalPrice = (viewState.currentPrice ?? 0)*Double(viewState.totalOrder ?? 0)
        lblTotalPrice.text = "\(String(format: "%.2f", totalPrice))"
        cosmosView.text = "\(viewState.rating ?? 0)"
        cosmosView.rating = viewState.rating ?? 0
        guard let color = viewState.color else { return }
        btnColor1.setTitle("\(color.first ?? "")", for: .normal)
        btnColor2.setTitle("\(color[1])", for: .normal)
        lblOriginPrice.attributedText = lblOriginPrice.text?.createStrikeThrough()
    }
    
}
