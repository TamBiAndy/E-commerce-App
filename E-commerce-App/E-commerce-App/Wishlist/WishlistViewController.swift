//
//  WishlistViewController.swift
//  E-commerce-App
//
//  Created by Andy on 16/10/2024.
//

import UIKit

class WishlistViewController: UIViewController {

    //MARK: - UIComponent
    lazy var scrollView = UIScrollView(frame: .zero)
        .with(\.showsVerticalScrollIndicator, setTo: false)
        .with(\.showsHorizontalScrollIndicator, setTo: false)
    
    lazy var contentView = UIView(frame: .zero)
    
    lazy var logoImgView = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "ic_logo"))
        .with(\.contentMode, setTo: .scaleToFill)
    
    lazy var userView = UIView(frame: .zero)
    
    lazy var userImgView = UIImageView(frame: .zero)
        .with(\.layer.cornerRadius, setTo: 18)
        .with(\.contentMode, setTo: .scaleToFill)
        .with(\.clipsToBounds, setTo: true)

    lazy var searchBar = UISearchBar()
    
    lazy var titleHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 12)
        .with(\.distribution, setTo: .fillProportionally)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 18))
        .with(\.textColor, setTo: .black)
    
    lazy var btnSort: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Sort", for: .normal)
        btn.titleLabel?.font = .regular(size: 12)
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(UIImage(named: "ic_sort"), for: .normal)
        btn.semanticContentAttribute = .forceLeftToRight
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 6
        btn.applySketchShadow(color: .black, alpha: 0.08, x: 1, y: 1, blur: 16, spread: 0)
        return btn
    }()
    
    lazy var btnFilter: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Filter", for: .normal)
        btn.titleLabel?.font = .regular(size: 12)
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(UIImage(named: "ic_filter"), for: .normal)
        btn.semanticContentAttribute = .forceLeftToRight
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 6
        btn.applySketchShadow(color: .black, alpha: 0.08, x: 1, y: 1, blur: 16, spread: 0)
        return btn
    }()
    
    lazy var flowLayout: UICollectionViewCompositionalLayout = {
        let flowLayout = creatFlowlayout()
        return flowLayout
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    //MARK: Variables
    let viewModel: WishListViewModel
    
    //MARK: -Initializers
    init(viewModel: WishListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupHeaderNavi()
        setupSearchBar()
        setupContentView()
        getUserInfor()
        fetchData()
    }
    
    //MARK: Private func
    
    private func getUserInfor() {
        viewModel.getUserInfor(token: SessionManager.shared.token) { isSuccess in
            if isSuccess {
                let avatarURLString = self.viewModel.userInfor?.avatar ?? ""
                if let avatarURL = URL(string: avatarURLString) {
                    self.userImgView.loadImage(url: avatarURL)
                } else { return }
            }
        }
    }
    
    private func fetchData() {
        viewModel.getWishList { error in
            if let error {
                print(error)
            } else {
                self.collectionView.reloadData()
                self.lblTitle.text = "\(self.viewModel.itemAmount ?? 0)+ Items"
            }
        }
    }
    
    private func setupHeaderNavi() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "ic_menu"), style: .plain, target: self, action: #selector(goToMenu))
        leftButton.tintColor = UIColor(hexString: "323232")
        
        userView.addSubview(userImgView)
        let rightButton = UIBarButtonItem(customView: userView)
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.titleView = logoImgView
        navigationItem.rightBarButtonItem = rightButton
        navigationController?.navigationBar.backgroundColor = .white
        
        userImgView.snp.makeConstraints { make in
            make.height.width.equalTo(36)
            make.top.leading.equalToSuperview().offset(4)
            make.trailing.bottom.equalToSuperview().inset(4)
        }
    }
    
    private func setupSearchBar() {
        contentView.addSubview(searchBar)
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = .clear
        searchBar.showsCancelButton = false
        searchBar.changeBGcolorOfSearchTextField(color: .white)
        searchBar.setImage(UIImage(named: "ic_micro"), for: .bookmark, state: .normal)
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.attributedPlaceholder = NSAttributedString(string: "Search any Products...", attributes: [.foregroundColor: UIColor(hexString: "BBBBBB"), .font: UIFont.regular(size: 14)])
            textField.applySketchShadow(color: .black, alpha: 0.04, x: 0, y: 2, blur: 9, spread: 0)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func creatFlowlayout() -> UICollectionViewCompositionalLayout {
        let item1 = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(261/180))
        )
        item1.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 0)
        
        let item2 = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(321/180))
        )
        item2.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 0)
        
        let verticalGroup1 = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalWidth(582/360)),
            subitems: [item1, item2]
        )
        
        let item3 = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(321/180))
        )
        item3.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 0)
        
        let item4 = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(261/180))
        )
        item4.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 0)
        
        let verticalGroup2 = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalWidth(582/360)),
            subitems: [item3, item4]
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(582/360)),
            subitems: [verticalGroup1, verticalGroup2])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func setupScrollView() {
        view.backgroundColor = UIColor(hexString: "F9F9F9")
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view.snp.width)
            make.height.equalToSuperview().priority(.low)
        }
    }
    
    private func setupContentView() {
        contentView.addSubViews([titleHstack, collectionView])
        titleHstack.addArrangedSubviews([lblTitle, btnSort, btnFilter])
        
        titleHstack.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(18)
        }
        
        btnSort.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(61)
        }
        
        btnFilter.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(67)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleHstack.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
    }
    
    @objc func goToMenu() {
        
    }

}

extension WishlistViewController: UISearchBarDelegate {
    
}

extension WishlistViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = viewModel.wistList[indexPath.row]
        let viewModel = DetailViewModel(productId: selectedItem.id)
        let customBtn = CustomButtonView()
        let similarViewModel = SimilarViewModel()
        let similarView = SimilarView(viewModel: similarViewModel)
        let detailVC = DetailViewController(viewModel: viewModel, customButton: customBtn, similarView: similarView)
        navigationController?.pushViewController(detailVC, animated: true)
        
        NotificationCenter.default.post(name: .changeColorButtonCart, object: nil)
    }
}

extension WishlistViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else { return .init() }
        
        let viewState = viewModel.item(at: indexPath)
        cell.bind(viewState: viewState)
        cell.applySketchShadow(color: .black, alpha: 0.15, x: 0, y: 2, blur: 2, spread: 0)
        cell.productImgView.layer.cornerRadius = 8
        return cell
    }
}
