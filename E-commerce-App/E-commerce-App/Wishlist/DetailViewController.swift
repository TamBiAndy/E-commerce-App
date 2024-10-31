//
//  DetailViewController.swift
//  E-commerce-App
//
//  Created by Andy on 23/10/2024.
//

import UIKit
import Cosmos

class DetailViewController: UIViewController {

    
    //MARK: - UI Component
    lazy var scrollView = UIScrollView(frame: .zero)
        .with(\.showsVerticalScrollIndicator, setTo: false)
        .with(\.showsHorizontalScrollIndicator, setTo: false)
    
    lazy var contentView = UIView(frame: .zero)
    
    lazy var scrollImage = UIScrollView(frame: .zero)
        .with(\.showsHorizontalScrollIndicator, setTo: false)
        .with(\.isPagingEnabled, setTo: true)
        .with(\.delegate, setTo: self)
    
    lazy var pageControl = UIPageControl(frame: .zero)
        .with(\.currentPage, setTo: 0)
        .with(\.pageIndicatorTintColor, setTo: UIColor(hexString: "DEDBDB"))
        .with(\.currentPageIndicatorTintColor, setTo: UIColor(hexString: "F83758"))
    
    lazy var sizeVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 12)
        .with(\.alignment, setTo: .leading)
    
    lazy var lblSize = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 14))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Size: ")
    
    var sizeStackView = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 8)
        .with(\.distribution, setTo: .equalSpacing)
    
    lazy var detailVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 8)
    
    lazy var lblProductName = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 20))
        .with(\.textColor, setTo: .black)
    
    lazy var lblDescription = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 14))
        .with(\.textColor, setTo: .black)
    
    lazy var cosmosView = CosmosView(frame: .zero)
        .with(\.settings.updateOnTouch, setTo: false)
        .with(\.settings.fillMode, setTo: .full)
        .with(\.settings.starSize, setTo: 18)
        .with(\.settings.starMargin, setTo: 0)
        .with(\.settings.filledColor, setTo: UIColor(hexString: "EDB310"))
        .with(\.settings.emptyBorderColor, setTo: UIColor(hexString: "BBBBBB"))
        .with(\.settings.filledBorderColor, setTo: UIColor(hexString: "EDB310"))
        .with(\.settings.filledImage, setTo: UIImage(named: "fillStar"))
        .with(\.settings.emptyImage, setTo: UIImage(named: "emptyStar"))
        .with(\.rating, setTo: 4)
        .with(\.settings.textFont, setTo: .medium(size: 14))
        .with(\.settings.textColor, setTo: UIColor(hexString: "828282"))
    
    lazy var priceHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 8)
    
    lazy var lblOriginPrice = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 14))
        .with(\.textColor, setTo: UIColor(hexString: "808488"))
    
    lazy var lblCurrentPrice = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 14))
        .with(\.textColor, setTo: .black)
    
    lazy var lblPercent = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 14))
        .with(\.textColor, setTo: UIColor(hexString: "FA7189"))
    
    lazy var lblDetail = UILabel(frame: .zero)
        .with(\.text, setTo: "Product Details")
        .with(\.font, setTo: .medium(size: 14))
        .with(\.textColor, setTo: .black)
    
    lazy var textViewDetail = UITextView(frame: .zero)
        .with(\.font, setTo: .regular(size: 12))
        .with(\.textColor, setTo: .black)
//        .with(\.numberOfLines, setTo: 0)
        .with(\.isEditable, setTo: false)
        .with(\.isScrollEnabled, setTo: false)
        .with(\.backgroundColor, setTo: .clear)

    lazy var otherOptionHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 8)
    
    lazy var btnLocation: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Nearest Store", for: .normal)
        btn.setTitleColor(UIColor(hexString: "828282"), for: .normal)
        btn.titleLabel?.font = .medium(size: 10)
        btn.layer.cornerRadius = 4
        btn.setImage(UIImage(named: "ic_location"), for: .normal)
        btn.layer.borderColor = UIColor(hexString: "828282").cgColor
        btn.layer.borderWidth = 1
        btn.backgroundColor = .white
        btn.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var btnVIP: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("VIP", for: .normal)
        btn.setTitleColor(UIColor(hexString: "828282"), for: .normal)
        btn.titleLabel?.font = .medium(size: 10)
        btn.layer.cornerRadius = 4
        btn.setImage(UIImage(named: "ic_lock"), for: .normal)
        btn.layer.borderColor = UIColor(hexString: "828282").cgColor
        btn.layer.borderWidth = 1
        btn.backgroundColor = .white
        btn.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var btnPolicy: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Return policy", for: .normal)
        btn.setTitleColor(UIColor(hexString: "828282"), for: .normal)
        btn.titleLabel?.font = .medium(size: 10)
        btn.layer.cornerRadius = 4
        btn.setImage(UIImage(named: "ic_return"), for: .normal)
        btn.layer.borderColor = UIColor(hexString: "828282").cgColor
        btn.layer.borderWidth = 1
        btn.backgroundColor = .white
        btn.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var deliveryView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: UIColor(hexString: "FFCCD5"))
        .with(\.layer.cornerRadius, setTo: 5)
    
    lazy var deliveryVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 4)
    
    lazy var lblTitleDelivery = UILabel(frame: .zero)
        .with(\.text, setTo: "Delivery in ")
        .with(\.font, setTo: .semiBold(size: 14))
        .with(\.textColor, setTo: .black)
    
    lazy var lblDeliveryTime = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 21))
        .with(\.textColor, setTo: UIColor(hexString: "010101"))

    var isExpanded = false
    
    lazy var imgHstack = UIStackView(frame: .zero)
 
    private var selectedButton: UIButton?
    
    var imageViews: [UIImageView] = []
    
    
    //MARK: - Variables
    var viewModel: DetailViewModel
    var customButton: CustomButtonView
    var similarView: SimilarView
    
    //MARK: - Initializers
    init(viewModel: DetailViewModel, customButton: CustomButtonView, similarView: SimilarView) {
        self.viewModel = viewModel
        self.customButton = customButton
        self.similarView = similarView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View lycycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHeaderNaviBar()
        fetchDetail()
        
    }
    
    //MARK: - Private func
    
    private func fetchDetail() {
        viewModel.getDetail { error in
            if let error {
                print(error)
            } else {
                self.setupSliderImg()
                self.addSizeLabels()
                self.lblProductName.text = self.viewModel.productDetail?.productName
                self.lblDescription.text = self.viewModel.productDetail?.description
                self.lblOriginPrice.text = "€\(self.viewModel.productDetail?.originPrice ?? 0)"
                self.lblCurrentPrice.text = "€\(self.viewModel.productDetail?.currentPrice ?? 0)"
                self.lblPercent.text = "\(self.viewModel.productDetail?.originPrice ?? 0)% Off"
                self.textViewDetail.text = "\(self.viewModel.productDetail?.productDetail ?? "")"
                self.cosmosView.text = "\(self.viewModel.productDetail?.rating ?? 0)"
                self.lblDeliveryTime.text = "\(self.viewModel.productDetail?.deliveryTime ?? "")"
                self.updatetextView()
            }
        }
    }
    
    private func setupHeaderNaviBar() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goToBack))
        leftButton.tintColor = .black
        
        let btnRightCart: UIButton = {
            let btn = UIButton(type: .custom)
            btn.setImage(UIImage(named: "ic_cart"), for: .normal)
            btn.backgroundColor = UIColor(hexString: "F2F2F2")
            btn.frame = .init(x: 0, y: 0, width: 32, height: 32)
            btn.layer.cornerRadius = 16
            return btn
        }()
        
        let rightButton = UIBarButtonItem(customView: btnRightCart)
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    private func setupSliderImg() {
        viewModel.imageUrl.forEach { urlString in
            let wrapperView = UIView()
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 16
            imageView.kf.setImage(with: URL(string: urlString))
            wrapperView.addSubview(imageView)
            imgHstack.addArrangedSubview(wrapperView)
               
            
            imageView.snp.makeConstraints { make in
                make.verticalEdges.equalToSuperview()
                make.horizontalEdges.equalToSuperview().inset(16)
                make.width.equalTo(UIScreen.main.bounds.width - 32)
            }
           
        }
        pageControl.numberOfPages = viewModel.imageUrl.count /* API */
        scrollImage.contentInset = .init(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    private func addSizeLabels() {
        viewModel.sizeString.forEach { text in
            let btnSize = UIButton(type: .custom)
            btnSize.setTitle(text, for: .normal)
            btnSize.setTitleColor(UIColor(hexString: "FA7189"), for: .normal)
            btnSize.titleLabel?.font = .semiBold(size: 14)
            btnSize.layer.borderColor = UIColor(hexString: "FA7189").cgColor
            btnSize.layer.borderWidth = 1
            btnSize.backgroundColor = .white
            btnSize.layer.cornerRadius = 4
            btnSize.addTarget(self, action: #selector(sizeButtonTapped), for: .touchUpInside)
            btnSize.snp.makeConstraints { make in
                make.height.equalTo(32)
                make.width.equalTo(51)
            }
            sizeStackView.addArrangedSubview(btnSize)
        }
    }
    
    private func updatetextView() {
        let maxTextLength = 281
        var displayText: String?
        var toggleText: String?

        if isExpanded {
            displayText = self.viewModel.productDetail?.productDetail
            toggleText = "  Less"
            print("displayText: \(displayText ?? ""),toggletext: \(toggleText ?? "")")
        } else {
            displayText = textViewDetail.text?.count ?? 0 > maxTextLength ? String(textViewDetail.text?.prefix(maxTextLength) ?? "") + "…" : textViewDetail.text
            toggleText = textViewDetail.text?.count ?? 0 > maxTextLength ? " More" : ""
            print("displayText: \(displayText ?? ""),toggletext: \(toggleText ?? "")")
        }
        textViewDetail.attributedText = displayText!.creatReadMoreAttributedText(displayText: displayText, toggleText: toggleText, colorAtt: UIColor(hexString: "FA7189"), font: .regular(size: 12))
        textViewDetail.gestureRecognizers?.forEach(textViewDetail.removeGestureRecognizer)
        textViewDetail.isUserInteractionEnabled = true
        textViewDetail.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moreTapped)))
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(hexString: "F9F9F9")
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubViews([scrollImage, pageControl, sizeVstack, detailVstack, otherOptionHstack, customButton, deliveryView, similarView])
        
        scrollImage.addSubview(imgHstack)
        sizeVstack.addArrangedSubviews([lblSize, sizeStackView])
        detailVstack.addArrangedSubviews([lblProductName, lblDescription, cosmosView, priceHstack, lblDetail])
        detailVstack.addArrangedView(textViewDetail, spacingAbove: 4)
        priceHstack.addArrangedSubviews([lblOriginPrice, lblCurrentPrice, lblPercent, UIView()])
        otherOptionHstack.addArrangedSubviews([btnLocation, btnVIP, btnPolicy])
        deliveryView.addSubview(deliveryVstack)
        deliveryVstack.addArrangedSubviews([lblTitleDelivery, lblDeliveryTime])
        
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view.snp.width)
            make.height.equalToSuperview().priority(.low)
        }
        
        scrollImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(213)
        }
        
        imgHstack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview().priority(.low)
            make.height.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(scrollImage.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(10)
        }
        
        sizeVstack.snp.makeConstraints { make in
            make.top.equalTo(pageControl.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        sizeStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        
        detailVstack.snp.makeConstraints { make in
            make.top.equalTo(sizeVstack.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        otherOptionHstack.snp.makeConstraints { make in
            make.top.equalTo(detailVstack.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
        }
        
        btnLocation.snp.makeConstraints { make in
            make.width.equalTo(97)
            make.height.equalTo(24)
        }
        
        btnVIP.snp.makeConstraints { make in
            make.width.equalTo(46)
            make.height.equalTo(24)
        }
        
        btnPolicy.snp.makeConstraints { make in
            make.width.equalTo(96)
            make.height.equalTo(24)
        }
        
        customButton.snp.makeConstraints { make in
            make.top.equalTo(otherOptionHstack.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
        }
        deliveryView.snp.makeConstraints { make in
            make.top.equalTo(customButton.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        deliveryVstack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(26)
            make.centerY.equalToSuperview()
        }
        
        similarView.snp.makeConstraints { make in
            make.top.equalTo(deliveryView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(clickToDetailPage), name: .didSelectItem, object: nil)
        
    }
    
    @objc func clickToDetailPage(notification: NSNotification) {
        guard let productId = notification.object as? String else { return }
        let viewModel = DetailViewModel(productId: productId)
        let customButtonView = CustomButtonView()
        let similarViewMd = SimilarViewModel()
        let similarView = SimilarView(viewModel: similarViewMd)
        let detailVC = DetailViewController(viewModel: viewModel, customButton: customButtonView, similarView: similarView)
        navigationController?.pushViewController(detailVC, animated: true)
        
        NotificationCenter.default.post(name: .changeColorButtonCart, object: nil)
    }
    
    @objc func goToBack() {
        navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(name: .resetBackgroundBtnCart, object: nil)
        
    }
    
    @objc func goToCart() {
        
    }
    
    @objc func sizeButtonTapped(sender: UIButton) {
        if let previousButton = selectedButton, previousButton != sender {
            previousButton.isSelected = false
            previousButton.backgroundColor = .white
            previousButton.setTitleColor(UIColor(hexString: "FA7189"), for: .normal)
        }
        
        sender.isSelected.toggle()
        
        if sender.isSelected {
            sender.backgroundColor = UIColor(hexString: "FA7189")
            sender.setTitleColor(.white, for: .normal)
            selectedButton = sender
            lblSize.text = "Size: \(sender.title(for: .normal) ?? "")"
        } else {
            sender.backgroundColor = .white
            sender.setTitleColor(UIColor(hexString: "FA7189"), for: .normal)
            selectedButton = nil
            lblSize.text = "Size: "
        }
    }
    
    @objc func moreTapped() {
        isExpanded.toggle()
        print("IsExpanded: \(isExpanded)")
        updatetextView()
    }
    
    @objc func buttonTapped() {
    
    }
    
}
extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = pageIndex
    }
}

extension NSNotification.Name {
    static let resetBackgroundBtnCart = NSNotification.Name("resetBackgroundBtnCart")
}
