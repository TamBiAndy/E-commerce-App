//
//  SearchResultViewController.swift
//  E-commerce-App
//
//  Created by Andy on 17/10/2024.
//

import UIKit

class SearchResultViewController: UIViewController {

    lazy var searchBar = UISearchBar(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()
        setupSearchBar()
        view.backgroundColor = UIColor(hexString: "F9F9F9")
    }
    
    private func setupHeaderView() {
        navigationItem.titleView = searchBar
        navigationController?.navigationBar.backgroundColor = .clear
        
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
    }
}

extension SearchResultViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
}
