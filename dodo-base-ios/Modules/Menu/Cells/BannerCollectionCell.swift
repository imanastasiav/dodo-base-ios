//
//  BannerCollectionCell.swift
//  newApp1
//
//  Created by Анастасия on 08.10.2025.
//

import UIKit
import SnapKit

final class BannerCollectionCell: UICollectionViewCell {
    
    static let reuseID = "BannerCollectionCell"
    
    private var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.applyShadow(cornerRadius: 10)
        
        return view
    }()
    
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Пепперони фреш"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private var priceButton: UIButton = {
        var button = UIButton()
        button.setTitle("от 289 руб.", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.2)
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 5)
        return button
    }()
    
    private var pizzaImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "pepperoni")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: Product) {
        nameLabel.text = product.name
        priceButton.setTitle("\(product.price) p", for: .normal)
        pizzaImageView.image = UIImage(named: product.image)
    }
}

private extension BannerCollectionCell {
    
    func setupViews() {
        contentView.addSubview(containerView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceButton)
        contentView.addSubview(pizzaImageView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(6)
        }
        
        pizzaImageView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(6)
            make.left.equalTo(contentView)
        }

        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(pizzaImageView.snp.right).offset(10)
            make.top.right.equalTo(contentView).inset(20)
        }
        
        priceButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.right.bottom.equalTo(contentView).inset(30)
        }
    }
}
