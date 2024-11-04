//
//  SetupViewController.swift
//  E-commerce-App
//
//  Created by Andy on 16/10/2024.
//

import UIKit

class SetupViewController: UIViewController {

    //MARK: UI Components
    lazy var scrollView = UIScrollView(frame: .zero)
        .with(\.showsVerticalScrollIndicator, setTo: false)
        .with(\.showsHorizontalScrollIndicator, setTo: false)
    
    lazy var contentView = UIView(frame: .zero)
    
    lazy var topView = UIView(frame: .zero)
    
    lazy var userImgView = UIImageView(frame: .zero)
        .with(\.layer.cornerRadius, setTo: 48)
        .with(\.clipsToBounds, setTo: true)
        .with(\.contentMode, setTo: .scaleToFill)
        .with(\.image, setTo: UIImage(named: "ic_user"))
    
    lazy var btnEdit: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "ic_edit"), for: .normal)
        btn.layer.cornerRadius = 16
        btn.layer.borderWidth = 3
        btn.layer.borderColor = UIColor.white.cgColor
        btn.backgroundColor = UIColor(hexString: "4392F9")
        return btn
    }()
    
    lazy var btnChangePw: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Change Password", for: .normal)
        btn.titleLabel?.font = .medium(size: 12)
        btn.setTitleColor(UIColor(hexString: "F83758"), for: .normal)
        return btn
    }()
    
    lazy var changePwStack = UIStackView(frame: .zero)
    
    lazy var mainStack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
    
    lazy var btnSave: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Save", for: .normal)
        btn.titleLabel?.font = .semiBold(size: 15)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(hexString: "F83758")
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    let sections = [
        ("Personal Details", ["Email Address", "Password"]),
        ("Business Address Details", ["Pincode", "Address", "City", "State", "Country"]),
        ("Bank Account Details", ["Bank Account Number", "Account Holder’s Name", "IFSC Code"])
    ]
    
    //MARK: - Variables
    var viewModel: SetupViewModel
    
    //MARK: Initializers
    init(viewModel: SetupViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHeaderNavi()
    }
    
    //MARK: Private func
    private func setupHeaderNavi() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goToBack))
        leftButton.tintColor = UIColor(hexString: "323232")
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.title = "Checkout"
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(hexString: "F5F5F5")
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubViews([topView, mainStack])
        topView.addSubViews([userImgView, btnEdit])
        
        sections.enumerated().forEach() { index, section in
            let (title, labelTexts) = section
            
            creatSection(in: mainStack, titleSection: title, labelTexts: labelTexts)
            
            if index == 0 {
                changePwStack.addArrangedSubviews([UIView(), btnChangePw])
                mainStack.addArrangedView(changePwStack, spacingAbove: 14)
            }
            
            if index < sections.count - 1 {
                creatSeparate(in: mainStack)
            }
            
            mainStack.addArrangedView(btnSave, spacingAbove: 34)
        }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view.snp.width)
            make.height.equalToSuperview().priority(.low)
        }
        
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(31)
            make.centerX.equalToSuperview()
        }
        
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
        
        userImgView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(2)
            make.trailing.equalToSuperview().inset(7)
            make.height.width.equalTo(96)
        }
        
        btnEdit.snp.makeConstraints { make in
            make.height.width.equalTo(32)
            make.bottom.trailing.equalToSuperview()
        }
        
        btnSave.snp.makeConstraints { make in
            make.height.equalTo(52)
        }
    }
    
    private func creatSection(in stackView: UIStackView, titleSection: String, labelTexts: [String]) {
        let sectionVstack = UIStackView(frame: .zero)
            .with(\.axis, setTo: .vertical)
            .with(\.spacing, setTo: 28)
        
        let titleSection = UILabel(frame: .zero)
            .with(\.font, setTo: .semiBold(size: 16))
            .with(\.textColor, setTo: .black)
            .with(\.text, setTo: titleSection)
        
        sectionVstack.addArrangedSubview(titleSection)
        
        labelTexts.forEach { text in
            let lblTitle = UILabel(frame: .zero)
                .with(\.font, setTo: .regular(size: 12))
                .with(\.textColor, setTo: .black)
                .with(\.text, setTo: text)
            
            let leftView = UIView(frame: .init(x: 0, y: 0, width: 20, height: 0))
            
            let textField = UITextField(frame: .zero)
                .with(\.delegate, setTo: self)
                .with(\.backgroundColor, setTo: .white)
                .with(\.layer.cornerRadius, setTo: 8)
                .with(\.layer.borderWidth, setTo: 1)
                .with(\.layer.borderColor, setTo: UIColor(hexString: "C8C8C8").cgColor)
                .with(\.attributedPlaceholder, setTo: NSAttributedString(string: "Type some text", attributes: [.foregroundColor: UIColor(hexString: "BBBBBB"), .font: UIFont.regular(size: 14)]))
                .with(\.font, setTo: .semiBold(size: 14))
                .with(\.textColor, setTo: .black)
                .with(\.leftView, setTo: leftView)
                .with(\.leftViewMode, setTo: .always)
            
            let fieldVStack = UIStackView(frame: .zero)
                .with(\.axis, setTo: .vertical)
                .with(\.spacing, setTo: 15)
            
            textField.snp.makeConstraints { make in
                make.height.equalTo(48)
            }
            
            fieldVStack.addArrangedSubviews([lblTitle, textField])
            sectionVstack.addArrangedSubview(fieldVStack)
            
            if text == "State" {
                let rightView: UIView = {
                    let view = UIView(frame: .init(x: 0, y: 0, width: 31, height: 48))
                    let imgView = UIImageView(frame: .init(x: 0, y: 19, width: 20, height: 10))
                    imgView.image = UIImage(named: "ic_arrrowDown")
                    imgView.contentMode = .scaleToFill
                    
                    view.addSubview(imgView)
                    return view
                }()
                textField.rightView = rightView
                textField.rightViewMode = .always
            }
        }
        
        stackView.addArrangedView(sectionVstack, spacingAbove: 34)
    }
    
    private func creatSeparate(in stackView: UIStackView) {
        let separateView = UIView(frame: .zero)
            .with(\.backgroundColor, setTo: UIColor(hexString: "C4C4C4"))
        
        separateView.snp.makeConstraints { make in
            make.height.equalTo(0.5)
        }
        stackView.addArrangedView(separateView, spacingAbove: 36)
    }
    
    @objc func goToBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
extension SetupViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
