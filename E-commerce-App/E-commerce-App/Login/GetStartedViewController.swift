//
//  GetStartedViewController.swift
//  E-commerce-App
//
//  Created by Andy on 14/10/2024.
//

import UIKit

class GetStartedViewController: UIViewController {

    lazy var backgroundimg = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "ic_BGGetStarted"))
        .with(\.contentMode, setTo: .scaleToFill)
    
    lazy var gradientView = UIView(frame: .zero)
       
    lazy var titleVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.text, setTo: "You want Authentic, here you go!")
        .with(\.font, setTo: .semiBold(size: 34))
        .with(\.textColor, setTo: .white)
        .with(\.textAlignment, setTo: .center)
        .with(\.numberOfLines, setTo: 0)
    
    lazy var lblSlogan = UILabel(frame: .zero)
        .with(\.text, setTo: "Find it here, buy it now!")
        .with(\.font, setTo: .regular(size: 14))
        .with(\.textColor, setTo: UIColor(hexString: "F2F2F2"))
        .with(\.textAlignment, setTo: .center)
    
    lazy var btnGetStarted: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Get Started", for: .normal)
        btn.titleLabel?.font = .semiBold(size: 23)
        btn.titleLabel?.textColor = UIColor(hexString: "F2F2F2")
        btn.backgroundColor = UIColor(hexString: "F83758")
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubViews([backgroundimg, gradientView, titleVstack, btnGetStarted])
        titleVstack.addArrangedSubview(lblTitle)
        titleVstack.addArrangedView(lblSlogan, spacingAbove: 14)
        
        backgroundimg.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(362)
            make.bottom.equalToSuperview()
        }
        
        titleVstack.snp.makeConstraints { make in
            make.bottom.equalTo(btnGetStarted.snp.top).offset(-44)
            make.leading.equalToSuperview().offset(37)
            make.trailing.equalToSuperview().inset(38)
        }
        
        btnGetStarted.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.leading.equalToSuperview().offset(55)
            make.trailing.equalToSuperview().inset(56)
            make.bottom.equalToSuperview().offset(-34)
        }
        gradientView.addGradientView(
            colors: [
                UIColor.black.withAlphaComponent(0.0).cgColor,
                UIColor.black.withAlphaComponent(0.63).cgColor
            ],
            startPoint: .topCenter,
            endPoint: .bottomCenter,
            locations: [0.0, 0.34]
        )
        
    }
    
}
