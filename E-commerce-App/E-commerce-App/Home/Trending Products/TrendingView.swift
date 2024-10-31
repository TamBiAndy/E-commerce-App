//
//  TrendingView.swift
//  E-commerce-App
//
//  Created by Andy on 22/10/2024.
//

import UIKit

class TrendingView: UIView {
    
    //MARK: - UIComponent
    lazy var titleView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: UIColor(hexString: "FD6E87"))
        .with(\.layer.cornerRadius, setTo: 8)
    
    lazy var titleHstack = UIStackView(frame: .zero)
        .with(\.alignment, setTo: .center)
    
    lazy var leftVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 8)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 16))
        .with(\.textColor, setTo: .white)
        .with(\.text, setTo: "Trending Products")
    
    lazy var timeHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 4)
    
    lazy var calenderImgView = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "ic_calender"))
        .with(\.contentMode, setTo: .scaleToFill)
    
    lazy var lblTime = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: .white)
    
    lazy var btnViewAll: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("View all", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setImage(UIImage(named: "ic_arrow"), for: .normal)
        btn.layer.cornerRadius = 4
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.white.cgColor
        btn.semanticContentAttribute = .forceRightToLeft
        btn.titleLabel?.font = .semiBold(size: 12)
        return btn
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
       let flowLayout = UICollectionViewFlowLayout()
        let widthScreen = UIScreen.main.bounds.width
        let widthCell = widthScreen * 142 / 375
        let heightCell = widthCell * 186 / 142
        flowLayout.itemSize = .init(width: widthCell, height: heightCell)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        return flowLayout
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    //MARK: - Variables
    let viewModel: TrendingViewModel
    
    //MARK: - Initializers
    init(viewModel: TrendingViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private func
    
    private func getData() {
        viewModel.fetchData { error in
            if let error {
                
            } else {
                self.collectionView.reloadData()
                self.lblTime.text = "Last Date\(self.viewModel.lastDate.convertDateFormat(formatInput: "yyyy/mm/dd", formatOutput: "dd/mm/yy") ?? "")"
            }
        }
    }
    private func setupView() {
        self.addSubViews([titleView, collectionView])
        titleView.addSubview(titleHstack)
        titleHstack.addArrangedSubviews([leftVstack, btnViewAll])
        leftVstack.addArrangedSubviews([lblTitle, timeHstack])
        timeHstack.addArrangedSubviews([calenderImgView, lblTime])
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        titleHstack.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(12)
        }
        
        btnViewAll.snp.makeConstraints { make in
            make.height.equalTo(28)
            make.width.equalTo(89)
        }
        
        calenderImgView.snp.makeConstraints { make in
            make.height.width.equalTo(16)
        }
        
        leftVstack.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
        }
        
        let widthScreen = UIScreen.main.bounds.width
        let widthCell = widthScreen * 142 / 375
        let heightCell = widthCell * 186 / 142
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(heightCell)
            make.bottom.equalToSuperview()
        }
        
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
    }
}

extension TrendingView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = viewModel.trendingResponse[indexPath.row]
        NotificationCenter.default.post(name: .didSelectItem, object: selectedItem.id)
    }
   
}

extension TrendingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else { return .init() }
        let viewState = viewModel.item(at: indexPath)
        cell.bind(viewState: viewState)
        return cell
    }
    
    
}
