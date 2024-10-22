//
//  HomeViewController.swift
//  E-commerce-App
//
//  Created by Andy on 16/10/2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UISearchControllerDelegate {

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
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupContentView()
        setupHeaderNavi()
//        fetchingData()
        setupSearchBar()
    }
    
    //MARK: - ViewModel
    let viewModel: HomeViewModel
    
    var allFeatureView: AllFeatureView
    
    var dealOfTheDayView: DealOfTheDayView
    
    var specialOfferView: SpecialOfferView
    
    var trendingView: TrendingView
    
    var bottomView: BottomView
    
    init(viewModel: HomeViewModel, allFeatureView: AllFeatureView, dealOfTheDayView: DealOfTheDayView, specialOfferView: SpecialOfferView, trendingView: TrendingView, bottomView: BottomView) {
        self.viewModel = viewModel
        self.allFeatureView = allFeatureView
        self.dealOfTheDayView = dealOfTheDayView
        self.specialOfferView = specialOfferView
        self.trendingView = trendingView
        self.bottomView = bottomView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Private func
    private func fetchingData() {
        viewModel.getUserInfor(token: SessionManager.shared.token) { isSucess in
            if isSucess {
                let avatarURLString = self.viewModel.userInfor?.avatar ?? ""
                if let avatarURL = URL(string: avatarURLString) {
                    self.userImgView.loadImage(url: avatarURL)
                }
            } else { return }
        }
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
    
    private func setupContentView() {
        contentView.addSubview(searchBar)
        contentView.addSubViews([allFeatureView, dealOfTheDayView, specialOfferView, trendingView, bottomView])
        
        allFeatureView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
        }
        
        dealOfTheDayView.snp.makeConstraints { make in
            make.top.equalTo(allFeatureView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
        }
        
        specialOfferView.snp.makeConstraints { make in
            make.top.equalTo(dealOfTheDayView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
        }
        
        trendingView.snp.makeConstraints { make in
            make.top.equalTo(specialOfferView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(trendingView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func goToMenu() {
        
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let searchResultVC = SearchResultViewController()
        navigationController?.pushViewController(searchResultVC, animated: false)
    }
}
