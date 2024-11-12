//
//  CartViewController.swift
//  E-commerce-App
//
//  Created by Andy on 16/10/2024.
//

import UIKit

class CartViewController: UIViewController {
    
    //MARK: UIComponent
    let lineView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: UIColor(hexString: "C6C6C6"))
    
    lazy var topHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 8)
    
    lazy var iconImgView = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "ic_location1"))
        .with(\.contentMode, setTo: .scaleToFill)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.text, setTo: "Delivery Address")
        .with(\.font, setTo: .semiBold(size: 14))
        .with(\.textColor, setTo: .black)
    
    lazy var addressHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 12)
    
    lazy var addressView = UIView(frame: .zero)
        .with(\.layer.cornerRadius, setTo: 6)
        .with(\.backgroundColor, setTo: .white)
    
    lazy var btnAdd: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "ic_plus"), for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 6
        btn.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: -4, blur: 9, spread: -7)
        btn.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 6, blur: 14, spread: -8)
        return btn
    }()
    
    lazy var addressVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 4)
    
    lazy var editImgView = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "ic_editAddress"))
        .with(\.contentMode, setTo: .scaleToFill)
    
    lazy var lblTitleAddress = UILabel(frame: .zero)
        .with(\.text, setTo: "Address: ")
        .with(\.font, setTo: .medium(size: 12))
        .with(\.textColor, setTo: .black)
    
    lazy var lblAddress = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: .black)
        .with(\.numberOfLines, setTo: 0)
    
    lazy var lblShoppingList = UILabel(frame: .zero)
        .with(\.text, setTo: "Shopping List")
        .with(\.font, setTo: .semiBold(size: 14))
        .with(\.textColor, setTo: .black)
    
    lazy var tableView = UITableView(frame: .zero)
        .with(\.rowHeight, setTo: UITableView.automaticDimension)
        .with(\.estimatedRowHeight, setTo: 205)
        .with(\.dataSource, setTo: self)
        .with(\.delegate, setTo: self)
        .with(\.backgroundColor, setTo: .clear)
        .with(\.separatorStyle, setTo: .none)
    
    //MARK: ViewModel
    var viewModel: CartViewModel
    
    //MARK: Initializers
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderNavi()
        setupView()
        fetchData()
    }
    
    //MARK: Private func
    
    private func fetchData() {
        viewModel.getAddress { error in
            if let error {
                print(error)
            } else {
                let address = self.viewModel.addressList.first?.address
                let contact = self.viewModel.addressList.first?.contact
                self.lblAddress.text = "\(address ?? "") \(contact ?? "")"
            }
        }
        
        viewModel.getShoppingList { error in
            if let error {
                print(error)
            } else {
                self.tableView.reloadData()
            }
        }
    }
    private func setupHeaderNavi() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goToBack))
        leftButton.tintColor = UIColor(hexString: "323232")
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.title = "Checkout"
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(hexString: "F5F5F5")
        view.addSubViews([lineView, topHstack, addressHstack, lblShoppingList, tableView])
        topHstack.addArrangedSubviews([iconImgView, lblTitle])
        addressHstack.addArrangedSubviews([addressView, btnAdd])
        addressView.addSubViews([addressVstack, editImgView])
        addressVstack.addArrangedSubviews([lblTitleAddress, lblAddress])
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(18)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
        topHstack.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(22)
        }
        
        iconImgView.snp.makeConstraints { make in
            make.height.equalTo(15)
            make.width.equalTo(12)
        }
        
        addressHstack.snp.makeConstraints { make in
            make.top.equalTo(topHstack.snp.bottom).offset(11)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().inset(22)
        }
        
        addressVstack.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(16)
        }
        
        editImgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
        }
        
        btnAdd.snp.makeConstraints { make in
            make.height.width.equalTo(78)
        }
        btnAdd.imageEdgeInsets = .init(top: 27, left: 27, bottom: 27, right: 27)
        addressView.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: -4, blur: 9, spread: -7)
        addressView.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 6, blur: 14, spread: -8)
        
        lblShoppingList.snp.makeConstraints { make in
            make.top.equalTo(addressHstack.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(22)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(lblShoppingList.snp.bottom).offset(3)
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().inset(17)
            make.bottom.equalToSuperview()
        }
        
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
    }
    
    @objc func goToBack() {
        navigationController?.popToRootViewController(animated: true)
    }

}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectItem = viewModel.shoppingListResponse[indexPath.row]
        let productId = selectItem.id
        let viewModel = ShopBagViewModel(productId: productId)
        let nextVc = ShoppingBagViewController(viewModel: viewModel)
        navigationController?.pushViewController(nextVc, animated: true)
        
        tabBarController?.tabBar.isHidden = true
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as? CartTableViewCell else { return .init() }
        let viewState = viewModel.getItem(at: indexPath)
        cell.binding(with: viewState)
        return cell
    }
    
    
}
