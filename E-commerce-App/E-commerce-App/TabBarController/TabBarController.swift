//
//  TabBarController.swift
//  E-commerce-App
//
//  Created by Andy on 16/10/2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    lazy var btnCart: UIButton = {
        let btn = UIButton(type: .custom)
        btn.layer.cornerRadius = 30
        btn.backgroundColor = .white
        btn.imageView?.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "shopping-cart 1"), for: .normal)
        btn.applySketchShadow(color: .black, alpha: 0.09, x: 0, y: 2, blur: 14, spread: 0)
        btn.addTarget(nil, action: #selector(cartButtonTapped), for: .touchUpInside)
        return btn
    }()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarApprrance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupTabBar() {
        self.delegate = self
        let viewModel = HomeViewModel()
        let featureViewModel = AllFeatureViewModel()
        let featureView = AllFeatureView(viewModel: featureViewModel)
        let dealViewModel = DealViewModel()
        let dealView = DealOfTheDayView(viewModel: dealViewModel)
        let specialViewModel = SpecialViewModel()
        let specialOfferView = SpecialOfferView(viewModel: specialViewModel)
        let trendingViewModel = TrendingViewModel()
        let trendingView = TrendingView(viewModel: trendingViewModel)
        let bottomViewModel = BottomViewModel()
        let bottomView = BottomView(viewModel: bottomViewModel)
        
        let firstVC = HomeViewController(viewModel: viewModel, allFeatureView: featureView, dealOfTheDayView: dealView, specialOfferView: specialOfferView, trendingView: trendingView, bottomView: bottomView)
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home 2"), tag: 0)
        let homeNavi = UINavigationController(navigationBarClass: CustomNavigationBar.self, toolbarClass: nil)
        homeNavi.viewControllers = [firstVC]
//        let homeNavi = UINavigationController(rootViewController: firstVC)
        let wishListviewModel = WishListViewModel()
        let secondVC = WishlistViewController(viewModel: wishListviewModel)
        secondVC.tabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(named: "heart 2"), tag: 1)
        let wisflistNavi = UINavigationController(rootViewController: secondVC)
        
        let thirdVC = CartViewController()
        let cartNavi = UINavigationController(rootViewController: thirdVC)
        
        let fourthVC = SearchViewController()
        fourthVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search 1"), tag: 3)
        let searchNavi = UINavigationController(rootViewController: fourthVC)
        
        let fifthVC = SetupViewController()
        fifthVC.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(named: "settings"), tag: 4)
        let setupNavi = UINavigationController(rootViewController: fifthVC)
        
        viewControllers = [homeNavi, wisflistNavi, cartNavi, searchNavi, setupNavi]
        
        self.tabBar.addSubview(btnCart)
        tabBar.sendSubviewToBack(btnCart)
        
        btnCart.snp.makeConstraints { make in
            make.centerX.equalTo(tabBar.snp.centerX)
            make.top.equalTo(tabBar.snp.top).offset(-10)
            make.width.height.equalTo(60)
        }
    }
    
    func setupTabBarApprrance() {
            tabBar.isTranslucent = false
            tabBar.barTintColor = .white
            tabBar.tintColor = .init(hexString: "EB3030")
            tabBar.backgroundColor = .white
            tabBar.unselectedItemTintColor = .black
            
            let normalAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            UITabBarItem.appearance().setTitleTextAttributes(normalAttributes, for: .normal)
        
            let selectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hexString: "EB3030")]
            UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)
            tabBar.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: -1, blur: 1, spread: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeColorBtnCart), name: .changeColorButtonCart, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resetColorBtnCart), name: .resetBackgroundBtnCart, object: nil)
    }
    
    @objc func cartButtonTapped(sender: UIButton) {
        self.selectedIndex = 2
    }
    
    @objc func changeColorBtnCart() {
        btnCart.backgroundColor = UIColor(hexString: "EB3030")
        btnCart.setImage(UIImage(named: "shopping-cart 2"), for: .normal)
    }
    
    @objc func resetColorBtnCart() {
        btnCart.backgroundColor = .white
        btnCart.setImage(UIImage(named: "shopping-cart 1"), for: .normal)
    }

}
extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if self.selectedIndex == 2 {
            btnCart.backgroundColor = UIColor(hexString: "EB3030")
            btnCart.setImage(UIImage(named: "shopping-cart 2"), for: .normal)
        } else {
            btnCart.backgroundColor = .white
            btnCart.setImage(UIImage(named: "shopping-cart 1"), for: .normal)
        }
    }
}
