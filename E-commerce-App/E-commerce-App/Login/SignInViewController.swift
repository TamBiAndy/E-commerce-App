//
//  SignInViewController.swift
//  E-commerce-App
//
//  Created by Andy on 12/10/2024.
//

import UIKit
import SnapKit
import ProgressHUD

    //MARK: - Token Manager
class SessionManager {
    static let shared = SessionManager()
    
    var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3R1c2VyIiwiaWF0IjoxNjE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
    
    var isUserLogged: Bool {
        !token.isEmpty
    }
}

class SignInViewController: UIViewController {
    
    //MARK: - UI Component
    lazy var topVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)

    lazy var lblWelcome = UILabel(frame: .zero)
        .with(\.text, setTo: "Welcome Back!")
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
    
    lazy var lblUserError = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "F83758"))
        .with(\.numberOfLines, setTo: 0)
    
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
    
    lazy var lblPwError = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "F83758"))
        .with(\.numberOfLines, setTo: 0)
    
    lazy var forgotPwHstack = UIStackView(frame: .zero)
    
    lazy var btnForgotPw: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Forgot Password?", for: .normal)
        btn.setTitleColor(UIColor(hexString: "F83758"), for: .normal)
        btn.titleLabel?.font = .regular(size: 12)
        btn.titleLabel?.textAlignment = .right
        btn.addTarget(nil, action: #selector(findPassword), for: .touchUpInside)
        return btn
    }()
    
    lazy var btnLogin: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .semiBold(size: 20)
        btn.backgroundColor = UIColor(hexString: "F83758")
        btn.layer.cornerRadius = 4
        btn.addTarget(nil, action: #selector(clickToLogin), for: .touchUpInside)
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
        .with(\.text, setTo: "Create An Account")
        .with(\.font, setTo: .regular(size: 14))
        .with(\.textColor, setTo: UIColor(hexString: "575757"))
    
    lazy var btnSignUp: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(UIColor(hexString: "F83758"), for: .normal)
        btn.titleLabel?.font = .semiBold(size: 14)
        btn.titleLabel?.textAlignment = .right
        btn.addTarget(nil, action: #selector(signUpAcc), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - Private properties
    let viewModel: SignInViewModel
    
    //MARK: - Initalizers
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Private func
    private func setupView() {
        view.backgroundColor = .white
        view.addSubViews([topVstack, botVstack, UIView()])
        topVstack.addArrangedSubview(lblWelcome)
        topVstack.addArrangedView(tfEmail, spacingAbove: 36)
        topVstack.addArrangedView(lblUserError, spacingAbove: 2)
        topVstack.addArrangedView(tfPassword, spacingAbove: 31)
        topVstack.addArrangedView(lblPwError, spacingAbove: 2)
        topVstack.addArrangedView(forgotPwHstack, spacingAbove: 9)
        topVstack.addArrangedView(btnLogin, spacingAbove: 52)
        botVstack.addArrangedSubview(lblOtherLogin)
        botVstack.addArrangedView(typeHstack, spacingAbove: 20)
        botVstack.addArrangedView(signUpHstack, spacingAbove: 28)
        signUpHstack.addArrangedSubviews([lblCreatAcc, btnSignUp])
        
        forgotPwHstack.addArrangedSubviews([UIView(), btnForgotPw])
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
        btnLogin.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        
        botVstack.snp.makeConstraints { make in
            make.top.equalTo(topVstack.snp.bottom).offset(75)
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
    
    @objc func findPassword() {
        let viewModel = FindPwViewModel()
        nextVC(presentVC: self, nextVC: FindPasswordViewController(viewModel: viewModel))
    }
    
    @objc func clickToLogin() {
        ProgressHUD.animate("Loading...")
        do {
            try viewModel.logIn(user: tfEmail.text ?? "", password: tfPassword.text ?? "") { isSucess in
                ProgressHUD.dismiss()
                let nextVC = GetStartedViewController()
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true)
                
            }
        } catch {
            if let error = error as? ErrorLogin {
                switch error {
                case .userNameEmpty:
                    lblUserError.isHidden = false
                    lblUserError.text = error.localizedDescription
                case .passwordEmpty:
                    lblPwError.isHidden = false
                    lblPwError.text = error.localizedDescription
                case .atLeast8Char, .atLeastOneLowerCaseLetter, .atLeastOneNumber, .atLeastOneSpecialChar, .atLeastOneUpperCaseLetter:
                    lblPwError.isHidden = false
                    lblPwError.text = error.localizedDescription
                case .notMatchingPassword:
                    break
                }
            }
        }
    }
    
    @objc func signUpAcc() {
        let viewModel = CreatAccViewModel()
        let createAccountVC = CreatAccViewController(viewModel: viewModel)
        nextVC(presentVC: self, nextVC: createAccountVC)
    }
   
    func nextVC(presentVC: UIViewController, nextVC: UIViewController) {
        let nextVC = nextVC
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let input = textField.text else { return true }
        
        if textField === tfEmail {
            tfPassword.becomeFirstResponder()
        }
        
        if textField === tfPassword {
            do {
                let isValidPw = try viewModel.isValidPassword(password: input)
                lblPwError.isHidden = true
                textField.resignFirstResponder()
                print("an loi")
            } catch {
                let errorMessege = error.localizedDescription
                lblPwError.isHidden = false
                lblPwError.text = errorMessege
                print("hien loi")
            }
        }
        return true
    }
}



