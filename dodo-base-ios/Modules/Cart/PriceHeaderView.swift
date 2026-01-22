//
//  PriceHeaderView.swift
//  newApp1
//
//  Created by Анастасия on 07.11.2025.
//

import UIKit

final class PriceHeaderView: UIView {
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Товаров на сумму"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PriceHeaderView {
    func setupViews() {
        addSubview(priceLabel)
    }
    
    func setupConstraints() {
        priceLabel.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(self).inset(20)
        }
    }
}
