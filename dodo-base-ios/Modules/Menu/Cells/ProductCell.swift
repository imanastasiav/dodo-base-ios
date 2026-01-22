//
//  ProductCell.swift
//  newApp1
//
//  Created by Анастасия on 24.09.2025.
//

import UIKit
import SnapKit

final class ProductCell: UITableViewCell {
    
    static let reuseID = "ProductCell"
    
    var onButtonTap: (()->())?
    
    private var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.applyShadow(cornerRadius: 10)
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Неополитанская"
        return label
    }()
    
    private var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "сыр, тесто"
        label.numberOfLines = 0
        return label
    }()
    
    private var priceButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "500 р"
        config.titleAlignment = .center
        config.baseBackgroundColor = .orange.withAlphaComponent(0.2)
        config.baseForegroundColor = .orange
        config.cornerStyle = .capsule
        
        let button = UIButton.init(configuration: config)
        button.addTarget(nil, action: #selector(priceButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "margarita")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        priceButtonTapped()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: Product) {
        nameLabel.text = product.name
        detailLabel.text = product.detail
        priceButton.setTitle("\(product.price) p", for: .normal)
        productImageView.image = UIImage(named: product.image)
    }
    
    @objc func priceButtonTapped() {
        print(#function)
        onButtonTap?()
    }
}

private extension ProductCell {
    
    func setupViews() {
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailLabel)
        contentView.addSubview(priceButton)
        contentView.addSubview(productImageView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        
        productImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(16)
            make.top.bottom.equalTo(contentView).priority(.low)
            make.width.height.equalTo(100)
            make.centerY.equalTo(contentView)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.right.equalTo(contentView).offset(16)
            make.left.equalTo(productImageView.snp.right).offset(8)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.right.equalTo(contentView).inset(16)
            make.left.equalTo(productImageView.snp.right).offset(8)
        }
        
        priceButton.snp.makeConstraints { make in
            make.top.equalTo(detailLabel.snp.bottom).offset(16)
            make.bottom.equalTo(contentView).inset(16)
            make.left.equalTo(productImageView.snp.right).offset(8)
        }
    }
}
