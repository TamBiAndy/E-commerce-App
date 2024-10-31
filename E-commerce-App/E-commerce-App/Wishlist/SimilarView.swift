//
//  SimilarView.swift
//  E-commerce-App
//
//  Created by Andy on 25/10/2024.
//

import UIKit

class SimilarView: UIView {
    
    lazy var btnHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 3)
    
    lazy var btnViewSimilar: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "ic_eye"), for: .normal)
        btn.setTitle("View Similar", for: .normal)
        btn.titleLabel?.font = .medium(size: 14)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 8
        btn.layer.borderColor = UIColor(hexString: "D9D9D9").cgColor
        btn.layer.borderWidth = 0.5
        return btn
    }()
    
    lazy var btnAddCompare: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "ic_addCompare"), for: .normal)
        btn.setTitle("Add to Compare", for: .normal)
        btn.titleLabel?.font = .medium(size: 14)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 8
        btn.layer.borderColor = UIColor(hexString: "D9D9D9").cgColor
        btn.layer.borderWidth = 0.5
        return btn
    }()
    
    lazy var contentVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.alignment, setTo: .center)
        .with(\.backgroundColor, setTo: .clear)
    
    lazy var lblTitle = UILabel(frame: .zero)
        .with(\.text, setTo: "Similar To")
        .with(\.font, setTo: .semiBold(size: 20))
        .with(\.textColor, setTo: .black)
    
    lazy var titleHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 12)
    
    lazy var lblItemAmount = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 20))
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
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let screenWidth = UIScreen.main.bounds.width - 16
        let cellWidth = screenWidth / 2
        let cellHeight = cellWidth * 245 / 164
        flowLayout.itemSize = .init(width: cellWidth, height: cellHeight)
        flowLayout.minimumLineSpacing = 16
        flowLayout.minimumInteritemSpacing = 0
        return flowLayout
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    var viewModel: SimilarViewModel
    
    init(viewModel: SimilarViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fetchData() {
        viewModel.getData { error in
            if let error {
                
            } else {
                self.collectionView.reloadData()
                self.lblItemAmount.text = "\(self.viewModel.itemAmount)+ Items"
                self.collectionView.snp.makeConstraints { make in
                    let screenWidth = UIScreen.main.bounds.width - 16
                    let cellWidth = screenWidth / 2
                    let cellHeight = cellWidth * 245 / 164
                    let heightRow = CGFloat(ceil(Double(self.viewModel.itemAmount / 2))) * cellHeight
                    make.height.equalTo(heightRow)
                }
            }
        }
    }
    
    private func setupView() {
        self.addSubViews([btnHstack, contentVstack])
        btnHstack.addArrangedSubviews([btnViewSimilar, btnAddCompare])
        contentVstack.addArrangedSubview(lblTitle)
        contentVstack.addArrangedView(titleHstack, spacingAbove: 8)
        contentVstack.addArrangedView(collectionView, spacingAbove: 18)
        titleHstack.addArrangedSubviews([lblItemAmount, UIView(), btnSort, btnFilter])
        
        btnHstack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().inset(4)
        }
        
        contentVstack.snp.makeConstraints { make in
            make.top.equalTo(btnHstack.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        btnViewSimilar.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo((UIScreen.main.bounds.width - 3) / 2)
        }
        
        btnAddCompare.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo((UIScreen.main.bounds.width - 3) / 2)
        }
        
        btnSort.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(61)
        }
        
        btnFilter.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(67)
        }
        
        lblTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        titleHstack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
    }
}

extension SimilarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = viewModel.similarResponse[indexPath.row]
        NotificationCenter.default.post(name: .didSelectItem, object: selectedItem.id)
    }
    
}

extension SimilarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else { return .init() }
        let viewState = viewModel.getItem(at: indexPath)
        cell.bind(viewState: viewState)
        return cell
    }
    
    
}
