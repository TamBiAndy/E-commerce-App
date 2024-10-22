//
//  AllFeatureView.swift
//  E-commerce-App
//
//  Created by Andy on 18/10/2024.
//

import UIKit

class AllFeatureView: UIView {
    
    //MARK: - UI Component
    lazy var titleHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 12)
        .with(\.distribution, setTo: .fillProportionally)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.text, setTo: "All Feature")
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
    
    lazy var categoryflowLayout: UICollectionViewFlowLayout = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = .init(width: 72, height: 87)
        return flowLayout
    }()
    
    lazy var categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: categoryflowLayout)
    
    lazy var saleInforflowLayout: UICollectionViewFlowLayout = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = .init(width: UIScreen.main.bounds.width, height: 189)
        return flowLayout
    }()
    
    lazy var saleOffInforCollectionView = UICollectionView(frame: .zero, collectionViewLayout: saleInforflowLayout)
    
    lazy var pageControl = UIPageControl(frame: .zero)
        .with(\.currentPage, setTo: 0)
        .with(\.pageIndicatorTintColor, setTo: UIColor(hexString: "DEDBDB"))
        .with(\.currentPageIndicatorTintColor, setTo: UIColor(hexString: "FFA3B3"))
    
    //MARK: - Variables
    var viewModel: AllFeatureViewModel
    
    //MARK: - Initalizes
    init(viewModel: AllFeatureViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        setupCollectionView()
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Func
    private func fetchData() {
        viewModel.getItemCategory { error in
            if let error {
                // TODO: handler error
            } else {
                self.categoryCollectionView.reloadData()
            }
        }
        
        viewModel.getSaleOffInfor { error in
            if let error {
                // TODO: handler error
            } else {
                self.saleOffInforCollectionView.reloadData()
                self.pageControl.numberOfPages = self.viewModel.numberOfPage()
            }
        }
    }
    
    private func setupCollectionView() {
        self.addSubViews([categoryCollectionView, saleOffInforCollectionView, pageControl])
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleHstack.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(87)
        }
        
        saleOffInforCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(189)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(saleOffInforCollectionView.snp.bottom).offset(12)
            make.height.equalTo(8)
            make.bottom.equalToSuperview()
        }
        pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.showsHorizontalScrollIndicator = false
        
        saleOffInforCollectionView.delegate = self
        saleOffInforCollectionView.dataSource = self
        saleOffInforCollectionView.backgroundColor = .clear
        saleOffInforCollectionView.showsHorizontalScrollIndicator = false
        
        categoryCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        
        saleOffInforCollectionView.register(SaleOffCollectionViewCell.self, forCellWithReuseIdentifier: SaleOffCollectionViewCell.identifier)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / saleOffInforCollectionView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    private func setupView() {
        self.addSubview(titleHstack)
        titleHstack.addArrangedSubviews([lblTitle, btnSort, btnFilter])
        
        titleHstack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().inset(21)
        }
        
        btnSort.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(61)
        }
        btnFilter.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(67)
        }
    }
    
    @objc func pageControlChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        let offset = CGPoint(x: CGFloat(current) * saleOffInforCollectionView.frame.width, y: 0)
        saleOffInforCollectionView.setContentOffset(offset, animated: true)
    }
}

extension AllFeatureView: UICollectionViewDelegate {
    
}

extension AllFeatureView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            viewModel.numberOfItem(isCategory: true)
        } else {
            viewModel.numberOfItem(isCategory: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return .init() }
            let category = viewModel.category(at: indexPath)
            cell.updateCell(with: category)
            return cell
        } else if collectionView == saleOffInforCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleOffCollectionViewCell.identifier, for: indexPath) as? SaleOffCollectionViewCell else { return .init() }
            let saleOffInfor = viewModel.saleOff(at: indexPath)
            cell.updateCell(with: saleOffInfor)
            return cell
        }
        
        return .init()
    }
    
    
}


//@available(iOS 17.0, *)
//#Preview {
//
//}
