//
//  BottomView.swift
//  E-commerce-App
//
//  Created by Andy on 22/10/2024.
//

import UIKit
import Kingfisher

class BottomView: UIView {
    
    //MARK: - UI Component
    lazy var newArrivalView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: .white)
        .with(\.layer.cornerRadius, setTo: 8)
    
    lazy var backgroundImgView = UIImageView(frame: .zero)
        .with(\.contentMode, setTo: .scaleToFill)
        .with(\.clipsToBounds, setTo: true)
    
    lazy var bottomHstack = UIStackView(frame: .zero)
        .with(\.alignment, setTo: .bottom)
    
    lazy var titleVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 4)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 20))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "New Arrivals ")
    
    lazy var lblDescript = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 16))
        .with(\.textColor, setTo: .black)
    
    lazy var btnViewAll: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("View all", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setImage(UIImage(named: "ic_arrow"), for: .normal)
        btn.layer.cornerRadius = 4
        btn.backgroundColor = UIColor(hexString: "F83758")
        btn.semanticContentAttribute = .forceRightToLeft
        btn.titleLabel?.font = .medium(size: 12)
        return btn
    }()
    
    lazy var sponserView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: .white)
    
    lazy var contentVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 12)
   
    lazy var lblBigTitle = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 20))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Sponserd")
    
    lazy var productImgView = UIImageView(frame: .zero)
        .with(\.contentMode, setTo: .scaleToFill)
        .with(\.clipsToBounds, setTo: true)
        .with(\.layer.cornerRadius, setTo: 8)
    
    lazy var lblSaleInfor = UILabel(frame: .zero)
        .with(\.font, setTo: .bold(size: 16))
        .with(\.textColor, setTo: .black)
    
    lazy var iconImgView = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "ic_arrowBlack"))
        .with(\.contentMode, setTo: .scaleToFill)
    
    lazy var stackViewButton = UIStackView(frame: .zero)
    
    lazy var btnNext: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .clear
        return btn
    }()

    //MARK: - Variables
    var viewModel: BottomViewModel
    
    //MARK: - Initializers
    init(viewModel: BottomViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private func
    
    private func fetchData() {
        viewModel.getSponser { error in
            if let error {
                print("Error fetching sponserd: \(error.localizedDescription)")
            } else {
                self.lblSaleInfor.text = self.viewModel.sponserdInfor?.detail
                print("load text\(self.lblSaleInfor.text ?? "")")
                self.productImgView.kf.setImage(with: URL(string: self.viewModel.sponserdInfor?.image ?? ""))
            }
        }
        viewModel.getNewArrival { error in
            if let error {
                print("Error fetching new arrivals: \(error.localizedDescription)")
            } else {
                self.lblDescript.text = self.viewModel.newArrival?.description
                self.backgroundImgView.kf.setImage(with: URL(string: self.viewModel.newArrival?.image ?? ""))
            }
        }
    }
    private func setupView() {
        self.addSubViews([newArrivalView, sponserView])
        newArrivalView.addSubViews([backgroundImgView, bottomHstack])
        bottomHstack.addArrangedSubviews([titleVstack, btnViewAll])
        titleVstack.addArrangedSubviews([lblTitle, lblDescript])
        
        sponserView.addSubview(contentVstack)
        contentVstack.addArrangedSubviews([lblBigTitle, productImgView, btnNext])
        stackViewButton.addArrangedSubviews([lblSaleInfor, iconImgView])
        btnNext.addSubview(stackViewButton)
        
        newArrivalView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        sponserView.snp.makeConstraints { make in
            make.top.equalTo(newArrivalView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
        
        backgroundImgView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(200)
        }
        
        bottomHstack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalTo(backgroundImgView.snp.bottom).offset(8)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(16)
        }
        
        btnViewAll.snp.makeConstraints { make in
            make.height.equalTo(28)
            make.width.equalTo(89)
        }
        
        titleVstack.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        
        contentVstack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().offset(8)
        }
        
        btnNext.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        iconImgView.snp.makeConstraints { make in
            make.height.width.equalTo(20)
        }
        
        stackViewButton.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
        
        productImgView.snp.makeConstraints { make in
            make.height.equalTo(292)
        }
    }
}
