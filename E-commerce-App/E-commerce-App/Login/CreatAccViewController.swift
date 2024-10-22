//
//  CreatAccViewController.swift
//  E-commerce-App
//
//  Created by Andy on 14/10/2024.
//

import UIKit

class CreatAccViewController: UIViewController {
    
    // MARK: - UIComponents
    lazy var topVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.text, setTo: "Create an account")
        .with(\.font, setTo: .bold(size: 36))
        .with(\.textColor, setTo: .black)
    
    lazy var tfEmail = UITextField(frame: .zero)
        .with(\.attributedPlaceholder, setTo: NSAttributedString(
            string: "Username or Email",
            attributes: [
                .foregroundColor: UIColor(hexString: "676767"),
                .font: UIFont.medium(size: 12)
            ]))
        .with(\.backgroundColor, setTo: UIColor(hexString: "F3F3F3"))
        .with(\.layer.borderColor, setTo: UIColor(hexString: "A8A8A9").cgColor)
        .with(\.layer.borderWidth, setTo: 1)
        .with(\.layer.cornerRadius, setTo: 10)
        .with(\.leftView, setTo: icUserView)
        .with(\.leftViewMode, setTo: .always)
        .with(\.delegate, setTo: self)
    
    lazy var icUserView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 45, height: 55))
        let icUserImgView = UIImageView(frame: .init(x: 11, y: 16, width: 24, height: 24))
        icUserImgView.image = UIImage(named: "User")
        view.addSubview(icUserImgView)
        return view
    }()
    
    lazy var lblErrorUsername = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "F83758"))
    
    lazy var tfPassword = UITextField(frame: .zero)
        .with(\.attributedPlaceholder, setTo: NSAttributedString(
            string: "Password",
            attributes: [
                .foregroundColor: UIColor(hexString: "676767"),
                .font: UIFont.medium(size: 12)
            ]))
        .with(\.backgroundColor, setTo: UIColor(hexString: "F3F3F3"))
        .with(\.layer.borderColor, setTo: UIColor(hexString: "A8A8A9").cgColor)
        .with(\.layer.borderWidth, setTo: 1)
        .with(\.layer.cornerRadius, setTo: 10)
        .with(\.isSecureTextEntry, setTo: true)
        .with(\.leftView, setTo: leftView)
        .with(\.leftViewMode, setTo: .always)
        .with(\.rightView, setTo: eyeView)
        .with(\.rightViewMode, setTo: .always)
        .with(\.delegate, setTo: self)
    
    lazy var leftView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 45, height: 55))
        let lockImgView = UIImageView(frame: .init(x: 11, y: 16, width: 20, height: 20))
        view.addSubview(lockImgView)
        lockImgView.image = UIImage(named: "Group 2")
        return view
    }()
    
    private lazy var eyeView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 37, height: 55))
        let btnEye = UIButton(type: .custom)
        view.addSubview(btnEye)
        btnEye.frame = .init(x: 0, y: 18, width: 20, height: 20)
        btnEye.setImage(UIImage(named: "eye"), for: .normal)
        btnEye.addTarget(nil, action: #selector(togglePassword), for: .touchUpInside)
        return view
    }()
    
    lazy var lblErrorPassword = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "F83758"))
        .with(\.numberOfLines, setTo: 0)
    
    lazy var tfConfirmPw = UITextField(frame: .zero)
        .with(\.attributedPlaceholder, setTo: NSAttributedString(
            string: "Confirm Password",
            attributes: [
                .foregroundColor: UIColor(hexString: "676767"),
                .font: UIFont.medium(size: 12)
            ]))
        .with(\.backgroundColor, setTo: UIColor(hexString: "F3F3F3"))
        .with(\.layer.borderColor, setTo: UIColor(hexString: "A8A8A9").cgColor)
        .with(\.layer.borderWidth, setTo: 1)
        .with(\.layer.cornerRadius, setTo: 10)
        .with(\.isSecureTextEntry, setTo: true)
        .with(\.leftView, setTo: leftView2)
        .with(\.leftViewMode, setTo: .always)
        .with(\.rightView, setTo: eyeView2)
        .with(\.rightViewMode, setTo: .always)
        .with(\.delegate, setTo: self)
    
    lazy var leftView2: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 45, height: 55))
        let lockImgView = UIImageView(frame: .init(x: 11, y: 16, width: 20, height: 20))
        view.addSubview(lockImgView)
        lockImgView.image = UIImage(named: "Group 2")
        return view
    }()
    
    private lazy var eyeView2: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 37, height: 55))
        let btnEye = UIButton(type: .custom)
        view.addSubview(btnEye)
        btnEye.frame = .init(x: 0, y: 18, width: 20, height: 20)
        btnEye.setImage(UIImage(named: "eye"), for: .normal)
        btnEye.addTarget(nil, action: #selector(togglePassword), for: .touchUpInside)
        return view
    }()
    
    lazy var lblErrorConfirmPw = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "F83758"))
    
    lazy var registerHstack = UIStackView(frame: .zero)
       
    lazy var lblAgree1 = UILabel(frame: .zero)
        .with(\.text, setTo: "By clicking the")
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "676767"))
    
    lazy var btnRegister: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(UIColor(hexString: "FF4B26"), for: .normal)
        btn.titleLabel?.font = .regular(size: 12)
        return btn
    }()
    
    lazy var lblAgree2 = UILabel(frame: .zero)
        .with(\.text, setTo: "button, you agree to the public offer")
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "676767"))
    
    lazy var btnCreatAcc: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Create Account", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .semiBold(size: 20)
        btn.backgroundColor = UIColor(hexString: "F83758")
        btn.layer.cornerRadius = 4
        btn.addTarget(nil, action: #selector(clickToCreat), for: .touchUpInside)
        return btn
    }()
    
    lazy var botVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.alignment, setTo: .center)
    
    lazy var lblOtherLogin = UILabel(frame: .zero)
        .with(\.text, setTo: "- OR Continue with -")
        .with(\.font, setTo: .medium(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "575757"))
    
    lazy var typeHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 10)
    
    lazy var googleView: UIView = {
        let view = UIView(frame: .zero)
        let imgView = UIImageView(frame: .init(x: 15, y: 15, width: 24, height: 24))
        imgView.image = UIImage(named: "Frame 4")
        view.addSubview(imgView)
        view.layer.borderColor = UIColor(hexString: "F83758").cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = UIColor(hexString: "FCF3F6")
        view.layer.cornerRadius = 27
        return view
    }()
    
    lazy var appleView: UIView = {
        let view = UIView(frame: .zero)
        let imgView = UIImageView(frame: .init(x: 15, y: 15, width: 24, height: 24))
        imgView.image = UIImage(named: "apple 1")
        view.addSubview(imgView)
        view.layer.borderColor = UIColor(hexString: "F83758").cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = UIColor(hexString: "FCF3F6")
        view.layer.cornerRadius = 27
        return view
    }()
    
    lazy var facebookView: UIView = {
        let view = UIView(frame: .zero)
        let imgView = UIImageView(frame: .init(x: 15, y: 15, width: 24, height: 24))
        imgView.image = UIImage(named: "facebook-app-symbol 1")
        view.addSubview(imgView)
        view.layer.borderColor = UIColor(hexString: "F83758").cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = UIColor(hexString: "FCF3F6")
        view.layer.cornerRadius = 27
        return view
    }()
    
    lazy var signUpHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 5)
    
    lazy var lblCreatAcc = UILabel(frame: .zero)
        .with(\.text, setTo: "I Already Have an Account")
        .with(\.font, setTo: .regular(size: 14))
        .with(\.textColor, setTo: UIColor(hexString: "575757"))
    
    lazy var btnLogin: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Log in", for: .normal)
        btn.setTitleColor(UIColor(hexString: "F83758"), for: .normal)
        btn.titleLabel?.font = .semiBold(size: 14)
        btn.titleLabel?.textAlignment = .right
        btn.addTarget(nil, action: #selector(backToLogin), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Private properties
    let viewModel: CreatAccViewModel
    
    // MARK: - Initializers
    init(viewModel: CreatAccViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Funcs
    private func setupView() {
        view.backgroundColor = .white
        view.addSubViews([topVstack, botVstack, UIView()])
        topVstack.addArrangedSubview(lblTitle)
        topVstack.addArrangedView(tfEmail, spacingAbove: 36)
        topVstack.addArrangedView(lblErrorUsername, spacingAbove: 2)
        topVstack.addArrangedView(tfPassword, spacingAbove: 31)
        topVstack.addArrangedView(lblErrorPassword, spacingAbove: 2)
        topVstack.addArrangedView(tfConfirmPw, spacingAbove: 31)
        topVstack.addArrangedView(lblErrorConfirmPw, spacingAbove: 2)
        topVstack.addArrangedView(registerHstack, spacingAbove: 19)
        topVstack.addArrangedView(btnCreatAcc, spacingAbove: 38)
        botVstack.addArrangedSubview(lblOtherLogin)
        botVstack.addArrangedView(typeHstack, spacingAbove: 20)
        botVstack.addArrangedView(signUpHstack, spacingAbove: 28)
        signUpHstack.addArrangedSubviews([lblCreatAcc, btnLogin])
        
        registerHstack.addArrangedSubviews([lblAgree1, btnRegister, lblAgree2])
        typeHstack.addArrangedSubviews([googleView, appleView, facebookView])
        
        topVstack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(19)
            make.leading.equalToSuperview().offset(29)
            make.trailing.equalToSuperview().inset(29)
        }
        
        tfEmail.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        
        tfPassword.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        
        tfConfirmPw.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        
        btnCreatAcc.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        
        botVstack.snp.makeConstraints { make in
            make.top.equalTo(topVstack.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview()
        }
        
        googleView.snp.makeConstraints { make in
            make.height.width.equalTo(54)
        }
        
        appleView.snp.makeConstraints { make in
            make.height.width.equalTo(54)
        }
        
        facebookView.snp.makeConstraints { make in
            make.height.width.equalTo(54)
        }
    }
    
    @objc func togglePassword() {
        tfPassword.isSecureTextEntry.toggle()
    }
    
    
    @objc func clickToCreat() {
        do {
            try viewModel.creatAccount(
                userName: tfEmail.text ?? "",
                password1: tfPassword.text ?? "",
                password2: tfConfirmPw.text ?? "",
                completion: { isSuccess in
                    self.dismiss(animated: true)
            })
        } catch {
            if let error = error as? ErrorLogin {
                switch error {
                case .passwordEmpty:
                    lblErrorPassword.isHidden = false
                    lblErrorPassword.text = error.localizedDescription
                case .atLeast8Char, .atLeastOneUpperCaseLetter, .atLeastOneLowerCaseLetter, .atLeastOneNumber, .atLeastOneSpecialChar :
                    lblErrorPassword.isHidden = false
                    lblErrorPassword.text = error.localizedDescription
                case .notMatchingPassword:
                    lblErrorConfirmPw.isHidden = false
                    lblErrorConfirmPw.text = error.localizedDescription
                case .userNameEmpty:
                    lblErrorUsername.isHidden = false
                    lblErrorUsername.text = error.localizedDescription
                }
            }
        }
    }
    
    @objc func backToLogin() {
        dismiss(animated: true)
    }
}

extension CreatAccViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let input = textField.text else { return true }
        
        if textField === tfEmail {
            tfPassword.becomeFirstResponder()
        }
        
        if textField === tfPassword {
            do {
               let isValid = try viewModel.isValidPassword(password: input)
                lblErrorPassword.isHidden = true
                textField.resignFirstResponder()
                tfConfirmPw.becomeFirstResponder()
                
            } catch {
                let errorMessage = error.localizedDescription
                lblErrorPassword.text = errorMessage
                lblErrorPassword.isHidden = false
            }
        }
        
        if textField === tfConfirmPw {
            do {
                let isValid = try viewModel.checkMatchingPassword(password1: tfPassword.text ?? "", password2: input)
                lblErrorConfirmPw.isHidden = true
                textField.resignFirstResponder()
            } catch {
                let errorMessage = error.localizedDescription
                lblErrorConfirmPw.text = errorMessage
                lblErrorConfirmPw.isHidden = false
            }
        }
        
        return true
    }
}
