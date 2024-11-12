//
//  ShoppingBagViewController.swift
//  E-commerce-App
//
//  Created by Andy on 04/11/2024.
//

import UIKit

class ShoppingBagViewController: UIViewController {
    
    //MARK: - UIComponent
   
    lazy var topHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 21)
        .with(\.alignment, setTo: .center)
    
    lazy var productImgView = UIImageView(frame: .zero)
        .with(\.contentMode, setTo: .scaleToFill)
        .with(\.layer.cornerRadius, setTo: 4)
        .with(\.clipsToBounds, setTo: true)
    
    lazy var detailVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 8)
    
    lazy var lblProductName = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 16))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Women’s Casual Wear")
    
    lazy var llblDescription = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 13))
        .with(\.textColor, setTo: .black)
        .with(\.numberOfLines, setTo: 0)
        .with(\.text, setTo: "Checked Single-Breasted Blazer")
    
    lazy var sizeQtyHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 12)
    
    lazy var sizeView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: UIColor(hexString: "F2F2F2"))
        .with(\.clipsToBounds, setTo: true)
        .with(\.layer.cornerRadius, setTo: 4)
    
    lazy var lblSizeTitle = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 14))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Size")
    
    lazy var lblSize = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 14))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "42")
    
    lazy var arrowImage = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "ic_arrrowDown"))
        .with(\.contentMode, setTo: .scaleAspectFit)
    
    lazy var qtyView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: UIColor(hexString: "F2F2F2"))
        .with(\.clipsToBounds, setTo: true)
        .with(\.layer.cornerRadius, setTo: 4)
    
    lazy var lblQtyTitle = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 14))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Qty")
    
    lazy var lblQty = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 14))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "1")
    
    lazy var arrowDownImg = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "ic_arrrowDown"))
        .with(\.contentMode, setTo: .scaleAspectFit)
    
    lazy var lblDeliveryDate = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 13))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Delivery by 10 May 2XXX")
    
    lazy var detailOrderVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
    
    lazy var couponHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 10)
    
    lazy var couponImgView = UIImageView(frame: .zero)
        .with(\.image, setTo: UIImage(named: "ic_coupon"))
    
    lazy var lblCoupon = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 16))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Apply Coupons")
    
    lazy var btnSelect:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Select", for: .normal)
        btn.titleLabel?.font = .semiBold(size: 14)
        btn.setTitleColor(UIColor(hexString: "F83758"), for: .normal)
        return btn
    }()
    
    lazy var lineView = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: UIColor(hexString: "CACACA"))
    
    lazy var lblOrderPaymentDetails = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 17))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Order Payment Details")
    
    lazy var amountHstack = UIStackView(frame: .zero)
    
    lazy var lblTitleAmount = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 16))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Order Amounts")
    
    lazy var lblPrice = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 16))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "$ 7,000.00")
    
    lazy var convenienceHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 14)
    
    lazy var lblConvenience = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 16))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Convenience")
    
    lazy var btnKnowMore:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Know More", for: .normal)
        btn.titleLabel?.font = .semiBold(size: 14)
        btn.setTitleColor(UIColor(hexString: "F83758"), for: .normal)
        return btn
    }()
    
    lazy var btnApply:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Apply Coupon", for: .normal)
        btn.titleLabel?.font = .semiBold(size: 14)
        btn.setTitleColor(UIColor(hexString: "EA1712"), for: .normal)
        return btn
    }()
    
    lazy var deliveryHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 14)
    
    lazy var lblDeliveryFee = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 16))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Delivery Fee")
    
    lazy var btnFree:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Free", for: .normal)
        btn.titleLabel?.font = .semiBold(size: 14)
        btn.setTitleColor(UIColor(hexString: "F83758"), for: .normal)
        return btn
    }()
    
    lazy var lineView2 = UIView(frame: .zero)
        .with(\.backgroundColor, setTo: UIColor(hexString: "CACACA"))
    
    lazy var orderTotalHstack = UIStackView(frame: .zero)
    
    lazy var lblOrderTotal = UILabel(frame: .zero)
        .with(\.font, setTo: .medium(size: 17))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "Order Total")
    
    lazy var lblTotalPrice = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 16))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "$ 7,000.00")
    
    lazy var eMIHstack = UIStackView(frame: .zero)
        .with(\.spacing, setTo: 14)
    
    lazy var lblEMIAvailable = UILabel(frame: .zero)
        .with(\.font, setTo: .regular(size: 16))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "EMI  Available ")
    
    lazy var btnDetails:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Details", for: .normal)
        btn.titleLabel?.font = .semiBold(size: 14)
        btn.setTitleColor(UIColor(hexString: "F83758"), for: .normal)
        return btn
    }()
    
    lazy var bottomView = UIView(frame: .zero)
        .with(\.layer.cornerRadius, setTo: 24)
        .with(\.backgroundColor, setTo: UIColor(hexString: "F8F8F8"))
    
    lazy var bottomHstack = UIStackView(frame: .zero)
        
    lazy var leftVstack = UIStackView(frame: .zero)
        .with(\.axis, setTo: .vertical)
        .with(\.spacing, setTo: 6)
        .with(\.alignment, setTo: .leading)
    
    lazy var lblPriceFinal = UILabel(frame: .zero)
        .with(\.font, setTo: .semiBold(size: 16))
        .with(\.textColor, setTo: .black)
        .with(\.text, setTo: "$ 7,000.00")
    
    lazy var btnViewDetails:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("View Details", for: .normal)
        btn.titleLabel?.font = .semiBold(size: 14)
        btn.setTitleColor(UIColor(hexString: "F83758"), for: .normal)
        return btn
    }()
    
    lazy var btnPayment:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Proceed to Payment", for: .normal)
        btn.titleLabel?.font = .semiBold(size: 17)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(hexString: "F83758")
        btn.layer.cornerRadius = 5
        return btn
    }()
        

    //MARK: - Variables
    var viewModel: ShopBagViewModel
    
    init(viewModel: ShopBagViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderNavi()
        setupView()
    }
    
    //MARK: - Private func
    private func setupHeaderNavi() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goToBack))
        leftButton.tintColor = UIColor(hexString: "323232")
        
        let rightButton = UIBarButtonItem(image: UIImage(named: "ic_favourite"), style: .plain, target: self, action: #selector(addToFavourite))
        rightButton.tintColor = UIColor(hexString: "323232")
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = "Shopping Bag"
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(hexString: "FDFDFD")
        view.addSubViews([topHstack, detailOrderVstack, UIView(), bottomView])
        topHstack.addArrangedSubviews([productImgView, detailVstack])
        detailVstack.addArrangedSubviews([lblProductName, llblDescription, sizeQtyHstack])
        detailVstack.addArrangedView(lblDeliveryDate, spacingAbove: 12)
        sizeQtyHstack.addArrangedSubviews([sizeView, qtyView, UIView()])
        sizeView.addSubViews([lblSizeTitle, lblSize, arrowImage])
        qtyView.addSubViews([lblQtyTitle, lblQty, arrowDownImg])
        
        detailOrderVstack.addArrangedSubview(couponHstack)
        detailOrderVstack.addArrangedView(lineView, spacingAbove: 36)
        detailOrderVstack.addArrangedView(lblOrderPaymentDetails, spacingAbove: 35)
        detailOrderVstack.addArrangedView(amountHstack, spacingAbove: 26)
        detailOrderVstack.addArrangedView(convenienceHstack, spacingAbove: 12)
        detailOrderVstack.addArrangedView(deliveryHstack, spacingAbove: 12)
        detailOrderVstack.addArrangedView(lineView2, spacingAbove: 41)
        detailOrderVstack.addArrangedView(orderTotalHstack, spacingAbove: 29)
        detailOrderVstack.addArrangedView(eMIHstack, spacingAbove: 10)
        
        couponHstack.addArrangedSubviews([couponImgView, lblCoupon, btnSelect])
        amountHstack.addArrangedSubviews([lblTitleAmount, UIView(), lblPrice])
        convenienceHstack.addArrangedSubviews([lblConvenience, btnKnowMore, UIView(), btnApply])
        deliveryHstack.addArrangedSubviews([lblDeliveryFee, btnFree])
        orderTotalHstack.addArrangedSubviews([lblOrderTotal, lblTotalPrice])
        eMIHstack.addArrangedSubviews([lblEMIAvailable, btnDetails, UIView()])
        
        bottomView.addSubview(bottomHstack)
        bottomHstack.addArrangedSubviews([leftVstack, btnPayment])
        leftVstack.addArrangedSubviews([lblPriceFinal, btnViewDetails])
        
        topHstack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(37)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().inset(39)
        }
        
        detailOrderVstack.snp.makeConstraints { make in
            make.top.equalTo(topHstack.snp.bottom).offset(54)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().inset(18)
        }
        
        productImgView.snp.makeConstraints { make in
            make.height.equalTo(153)
            make.width.equalTo(123)
            make.verticalEdges.equalToSuperview()
        }
        
        lblSizeTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().inset(4)
        }
        
        lblSize.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalTo(lblSizeTitle.snp.trailing).offset(7)
            make.bottom.equalToSuperview().inset(4)
        }
        
        arrowImage.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(11)
            make.verticalEdges.equalToSuperview()
            make.leading.equalTo(lblSize.snp.trailing).offset(9)
            make.trailing.equalToSuperview().inset(6)
        }
        
        lblQtyTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().inset(4)
        }
        
        lblQty.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalTo(lblQtyTitle.snp.trailing).offset(7)
            make.bottom.equalToSuperview().inset(4)
        }
        
        arrowDownImg.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(11)
            make.verticalEdges.equalToSuperview()
            make.leading.equalTo(lblQty.snp.trailing).offset(9)
            make.trailing.equalToSuperview().inset(6)
        }
        
        sizeView.snp.makeConstraints { make in
            make.width.equalTo(90)
        }
        
        qtyView.snp.makeConstraints { make in
            make.width.equalTo(90)
        }
        
        couponImgView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(31)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        lineView2.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        bottomView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        bottomView.applySketchShadow(color: .black, alpha: 0.3, x: 0, y: -0.5, blur: 0, spread: 0)
        
        bottomHstack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().inset(22)
            make.bottom.equalToSuperview().inset(16)
        }
        
        btnPayment.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(219)
        }
    }
    
    @objc func goToBack() {
        navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
    }
    
    @objc func addToFavourite() {
        
    }


}
