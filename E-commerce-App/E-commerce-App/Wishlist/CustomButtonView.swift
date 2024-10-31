//
//  CustomButtonView.swift
//  E-commerce-App
//
//  Created by Andy on 25/10/2024.
//

import UIKit

class CustomButtonView: UIView {
    
    lazy var goToCartView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: .clear)
    
    lazy var btnCart: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "ic_cart2"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "cart"), for: .normal)
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var btnGoCart: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Go to cart", for: .normal)
        btn.titleLabel?.font = .medium(size: 16)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    lazy var buyView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: .clear)
    
    lazy var btnIcon: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Group"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "buyBG"), for: .normal)
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var btnBuyNow: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Buy Now", for: .normal)
        btn.titleLabel?.font = .medium(size: 16)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubViews([goToCartView, buyView])
        goToCartView.addSubViews([btnGoCart, btnCart])
        buyView.addSubViews([btnBuyNow, btnIcon])
        
        goToCartView.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview()
        }
        
        btnCart.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview()
            make.height.width.equalTo(40)
        }
        
        btnGoCart.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-2)
            make.leading.equalTo(btnCart.snp.centerX)
            make.height.equalTo(36)
            make.width.equalTo(136)
            make.trailing.equalToSuperview()
        }
        
        buyView.snp.makeConstraints { make in
            make.verticalEdges.trailing.equalToSuperview()
            make.leading.equalTo(goToCartView.snp.trailing).offset(12)
        }
        
        btnIcon.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview()
            make.height.width.equalTo(40)
        }
        
        btnBuyNow.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-2)
            make.leading.equalTo(btnIcon.snp.centerX)
            make.height.equalTo(36)
            make.width.equalTo(136)
            make.trailing.equalToSuperview()
        }
        
        btnGoCart.addGradientView(
            colors: [
                UIColor(hexString: "3F92FF").cgColor,
                UIColor(hexString: "0B3689").cgColor
            ],
            startPoint: .topCenter,
            endPoint: .bottomCenter,
            locations: [0.0, 1.0])

        
        btnBuyNow.addGradientView(
            colors: [
                UIColor(hexString: "71F9A9").cgColor,
                UIColor(hexString: "31B769").cgColor
            ],
            startPoint: .topCenter,
            endPoint: .bottomCenter,
            locations: [0.0, 1.0])
    }
}
