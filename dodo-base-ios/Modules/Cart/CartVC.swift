//
//  CartVC.swift
//  newApp1
//
//  Created by Анастасия on 14.10.2025.
//

import UIKit
import SnapKit

final class CartVC: UIViewController {
    
    var addToCartProduct: [AddToCartProduct] = []
    var addToCartProductService = AddToCartProductService()
    
    var pricePanelView = PricePanelView()
    var priceHeaderView = PriceHeaderView()
    
    private lazy var cartTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.allowsSelection = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CartCell.self, forCellReuseIdentifier: CartCell.reuseID)
        tableView.register(AddToOrderCell.self, forCellReuseIdentifier: AddToOrderCell.reuseID)
        
        tableView.separatorColor = .white
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        fetchAddProducts()
    }
    
    func fetchAddProducts() {
        self.addToCartProduct = addToCartProductService.fetchAddProducts()
        cartTableView.reloadData()
    }
}

private extension CartVC {
    
    private func setupViews() {
        view.addSubview(priceHeaderView)
        view.addSubview(cartTableView)
        view.addSubview(pricePanelView)
    }
    
    private func setupConstraints() {
        priceHeaderView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        cartTableView.snp.makeConstraints { make in
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(priceHeaderView.snp.bottom).offset(10)
            make.bottom.equalTo(pricePanelView.snp.top)
        }
        pricePanelView.snp.makeConstraints { make in
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return addToCartProduct.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.reuseID, for: indexPath) as? CartCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddToOrderCell.reuseID, for: indexPath) as? AddToOrderCell else { return UITableViewCell() }
            cell.config2(addToCartProducts: addToCartProduct)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
