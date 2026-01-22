//
//  ProductsinCartCell.swift
//  newApp1
//
//  Created by Анастасия on 14.10.2025.
//

import UIKit

final class ProductsinCartCell: UITableViewCell {
    
    static let reuseID = "ProductsinCartCell"
    
    private lazy var counterView = CounterView()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var containerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 20
        return stack
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 10
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var productImageView: UIImageView = {
        let productImage = UIImageView()
        
        productImage.image = UIImage(named: "hawaii")
        productImage.contentMode = .scaleAspectFit
        
        productImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        return productImage
    }()
    
    private lazy var changeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Изменить"
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    private lazy var footerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ productsinCart: ProductsinCart) {
        titleLabel.text = productsinCart.title
        descriptionLabel.text = productsinCart.description
        detailLabel.text = productsinCart.size
        priceLabel.text = "\(productsinCart.price) р"
    }
}

private extension ProductsinCartCell {
    func setupViews() {
        contentView.addSubview(containerStack)
        
        containerStack.addArrangedSubview(horizontalStack)
        containerStack.addArrangedSubview(footerStackView)
        
        horizontalStack.addArrangedSubview(productImageView)
        horizontalStack.addArrangedSubview(verticalStack)
        
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(descriptionLabel)
        verticalStack.addArrangedSubview(detailLabel)
        
        footerStackView.addArrangedSubview(priceLabel)
        footerStackView.addArrangedSubview(changeLabel)
        footerStackView.addArrangedSubview(counterView)
    }
    
    func setupConstraints() {
        containerStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
        }
        
        horizontalStack.snp.makeConstraints { make in
            make.left.right.equalTo(containerStack).inset(20)
        }
        verticalStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(horizontalStack).inset(10)
        }
        footerStackView.snp.makeConstraints { make in
            make.left.right.equalTo(horizontalStack)
            make.centerX.equalToSuperview()
        }
        priceLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(footerStackView).inset(10)
            make.left.equalTo(footerStackView.snp.left)
            
        }
        
        counterView.snp.makeConstraints { make in
            make.left.equalTo(changeLabel.snp.right).offset(10)
        }
    }
}
