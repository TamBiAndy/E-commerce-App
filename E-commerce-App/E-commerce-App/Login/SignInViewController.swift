//
//  SignInViewController.swift
//  E-commerce-App
//
//  Created by Andy on 12/10/2024.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    lazy var topHstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
    
    /* UIView dùng with đc rùi
    lazy var demoWith = UIView()
        .with(\.backgroundColor, setTo: .white)
    */
    
    lazy var lblWelcome = UILabel(frame: .zero)
        .with(\.text, setTo: "Welcome Back!")
        .with(\.font, setTo: .systemFont(ofSize: 36, weight: .bold))
        .with(\.textColor, setTo: .black)
    
    lazy var tfEmail = UITextField(frame: .zero)
        .with(\.attributedPlaceholder, setTo: NSAttributedString(string: "Username or Email", attributes: [.foregroundColor: UIColor(hexString: "676767")]))
        .with(\.backgroundColor, setTo: UIColor(hexString: "F3F3F3"))
        .with(\.layer.borderColor, setTo: UIColor(hexString: "A8A8A9").cgColor)
        .with(\.layer.borderWidth, setTo: 1)
        .with(\.layer.cornerRadius, setTo: 10)
        .with(\.leftView, setTo: icUserView)
        .with(\.leftViewMode, setTo: .always)
    
    lazy var icUserView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 35, height: 55))
        let icUserImgView = UIImageView(frame: .init(x: 0, y: 0, width: 24, height: 24))
        view.addSubview(icUserImgView)
        icUserImgView.image = UIImage(named: "User")
        return view
    }()
    
    lazy var tfPassword = UITextField(frame: .zero)
        .with(\.attributedPlaceholder, setTo: NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor(hexString: "676767")]))
        .with(\.backgroundColor, setTo: UIColor(hexString: "F3F3F3"))
        .with(\.layer.borderColor, setTo: UIColor(hexString: "A8A8A9").cgColor)
        .with(\.layer.borderWidth, setTo: 1)
        .with(\.layer.cornerRadius, setTo: 10)
        .with(\.leftView, setTo: leftView)
        .with(\.leftViewMode, setTo: .always)
        .with(\.rightView, setTo: eyeView)
        .with(\.rightViewMode, setTo: .always)
    
    lazy var leftView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 35, height: 55))
        let icUserImgView = UIImageView(frame: .init(x: 0, y: 0, width: 24, height: 24))
        view.addSubview(icUserImgView)
        icUserImgView.image = UIImage(named: "Group 2")
        return view
    }()
    
    private lazy var eyeView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 37, height: 55))
        let btnEye = UIButton(type: .custom)
        view.addSubview(btnEye)
        btnEye.frame = .init(x: 0, y: 0, width: 20, height: 20)
        btnEye.setImage(UIImage(named: "eye"), for: .normal)
        btnEye.addTarget(nil, action: #selector(togglePassword), for: .touchUpInside)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

       
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(topHstack)
        topHstack.addArrangedSubview(lblWelcome)
        topHstack.addArrangedView(tfEmail, spacingAbove: 36)
        topHstack.addArrangedView(tfPassword, spacingAbove: 31)
        
        topHstack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(19)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().inset(26)
        }
    }
    
    @objc func togglePassword() {
        
    }
    

}
@available(iOS 17.0, *)
#Preview {
    SignInViewController()
}
