//
//  FindPasswordViewController.swift
//  E-commerce-App
//
//  Created by Andy on 14/10/2024.
//

import UIKit
import ProgressHUD

class FindPasswordViewController: UIViewController {

    //MARK: - UI Component
    lazy var contentVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.text, setTo: "Forgot password?")
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
        .with(\.leftView, setTo: icMailView)
        .with(\.leftViewMode, setTo: .always)
        .with(\.delegate, setTo: self)
    
    lazy var icMailView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 45, height: 55))
        let icImgView = UIImageView(frame: .init(x: 11, y: 16, width: 24, height: 24))
        icImgView.image = UIImage(named: "Mail")
        view.addSubview(icImgView)
        return view
    }()
    
    lazy var lblError = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "F83758"))
        .with(\.numberOfLines, setTo: 0)
    
    lazy var lblMessege = UILabel(frame: .zero)
        .with(\.text, setTo: "* We will send you a message to set or reset your new password")
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: UIColor(hexString: "676767"))
        .with(\.numberOfLines, setTo: 0)
    
    lazy var btnSubmit: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .semiBold(size: 20)
        btn.backgroundColor = UIColor(hexString: "F83758")
        btn.layer.cornerRadius = 4
        btn.addTarget(nil, action: #selector(backToLogin), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    //MARK: - Private Properties
    let viewModel: FindPwViewModel
    
    //MARK: - Initalize
    init(viewModel: FindPwViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private func
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(contentVstack)
        contentVstack.addArrangedSubview(lblTitle)
        contentVstack.addArrangedView(tfEmail, spacingAbove: 32)
        contentVstack.addArrangedView(lblError, spacingAbove: 2)
        contentVstack.addArrangedView(lblMessege, spacingAbove: 26)
        contentVstack.addArrangedView(btnSubmit, spacingAbove: 26)
        
        contentVstack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(19)
            make.leading.equalToSuperview().offset(29)
            make.trailing.equalToSuperview().inset(29)
        }
        
        tfEmail.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        
        btnSubmit.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        
        let attributeString = viewModel.createAttributeString(for: lblMessege.text ?? "", color1: UIColor(hexString: "FF4B26"), color2: UIColor(hexString: "676767"))
        lblMessege.attributedText = attributeString
    }
    
    @objc func backToLogin() {
        ProgressHUD.animate("Loading...")
        do {
            try viewModel.submit(userName: tfEmail.text ?? "") { isSucess in
                switch isSucess {
                case .success(let response):
                    ProgressHUD.colorAnimation = .green
                    ProgressHUD.succeed("Done")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.dismiss(animated: true)
                        self.lblError.isHidden = true
                    }
                    
                case .failure(let error):
                    switch error {
                    case .userNotFound, .apiError:
                        self.lblError.isHidden = false
                        self.lblError.text = error.localizedDescription
                    case .decodingError, .serverError, .unknownError:
                        self.showErrorPopup(with: error.localizedDescription, in: self)
                    default:
                        break
                    }
                }
            }
        } catch {
            lblError.isHidden = false
            lblError.text = error.localizedDescription
        }
    }
    func showErrorPopup(with message: String, in viewController: UIViewController) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}

extension FindPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfEmail {
            
        }
        return true
    }
}
