//
//  SpecialOfferView.swift
//  E-commerce-App
//
//  Created by Andy on 21/10/2024.
//

import UIKit

class SpecialOfferView: UIView {
    
    //MARK: - UIComponents
    lazy var titleView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: .white)
        .with(\.layer.cornerRadius, setTo: 6)
    
    lazy var contentHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 24)
    
    lazy var offerImgView = UIImageView(frame: .zero)
        .with(\.contentMode, setTo: .scaleToFill)
        .with(\.image, setTo: UIImage(named: "ic_offer"))

    lazy var detailVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 8)
    
    lazy var titleHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 8)
    
    lazy var iconImgView = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "ic_ghost"))
        .with(\.contentMode, setTo: .scaleToFill)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 16))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Special Offers")
    
    lazy var lblDetail = UILabel(frame: .zero)
        .with(\.font, setTo: .light(size: 10))
        .with(\.textColor, setTo: .black)
        .with(\.numberOfLines, setTo: 0)
        .with(\.text, setTo: "We make sure you get the offer you need at best prices")
    
    lazy var specialView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: .white)
    
    lazy var linerView = UIView(frame: .zero)
    
    lazy var contentView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: UIColor(hexString: "E7E7EB").withAlphaComponent(0.3))
        
    lazy var blingImgView = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "Group 33732"))
        .with(\.contentMode, setTo: .scaleToFill)
    
    lazy var productImgView = UIImageView(frame: .zero)
        .with(\.contentMode, setTo: .scaleToFill)
    
    lazy var inforVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.alignment, setTo: .trailing)
        .with(\.spacing, setTo: 10)
    
    lazy var lblTitleOffer = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 16))
        .with(\.textColor, setTo: UIColor(hexString: "232327"))
        .with(\.textAlignment, setTo: .center)
    
    lazy var lblDetailOffer = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 10))
        .with(\.textColor, setTo: UIColor(hexString: "232327"))
        .with(\.textAlignment, setTo: .center)
    
    lazy var btnVisit: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Visit now", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setImage(UIImage(named: "ic_arrow"), for: .normal)
        btn.layer.cornerRadius = 4
        btn.backgroundColor = UIColor(hexString: "F83758")
        btn.semanticContentAttribute = .forceRightToLeft
        btn.titleLabel?.font = .medium(size: 12)
        return btn
    }()
    
    //MARK: - Variables
    let viewModel: SpecialViewModel
    
    //MARK: - Initializers
    init(viewModel: SpecialViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private func
    
    private func getData() {
        viewModel.fetchData { error in
            if let error {
                
            } else {
                self.lblTitleOffer.text = self.viewModel.offer?.productName ?? ""
                self.lblDetailOffer.text = self.viewModel.offer?.productDetail ?? ""
                let urlString = self.viewModel.offer?.image ?? ""
                self.productImgView.kf.setImage(with: URL(string: urlString))
            }
        }
    }
    private func setupView() {
        self.addSubViews([titleView, specialView])
        titleView.addSubview(contentHstack)
        contentHstack.addArrangedSubviews([offerImgView, detailVstack])
        detailVstack.addArrangedSubviews([titleHstack, lblDetail])
        titleHstack.addArrangedSubviews([lblTitle, iconImgView, UIView()])
        
        specialView.addSubViews([contentView, linerView])
        contentView.addSubViews([blingImgView, productImgView, inforVstack])
        inforVstack.addArrangedSubviews([lblTitleOffer, lblDetailOffer, btnVisit])
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        contentHstack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(65)
        }
        
        offerImgView.snp.makeConstraints { make in
            make.width.equalTo(75)
            make.height.equalTo(60)
        }
        
        iconImgView.snp.makeConstraints { make in
            make.height.width.equalTo(20)
        }
        
        specialView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        linerView.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview()
            make.width.equalTo(11)
        }
        
        linerView.addGradientView(
            colors: [
                UIColor(hexString: "EFAD18").cgColor,
                UIColor(hexString: "F8D7B4").cgColor
            ],
            startPoint: .centerLeft,
            endPoint: .centerRight,
            locations: [0.0, 1.0]
        )
        
        contentView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.trailing.bottom.equalToSuperview().inset(8)
        }
        
        blingImgView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(-8)
            make.width.equalTo(78)
        }
        
        productImgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(23)
            make.width.equalTo(144)
            make.height.equalTo(108)
        }
        
        inforVstack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.leading.equalTo(productImgView.snp.trailing).offset(4)
            make.bottom.equalToSuperview().inset(47)
            make.trailing.equalToSuperview().inset(12)
        }
        
        btnVisit.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(92)
        }
    }
}
