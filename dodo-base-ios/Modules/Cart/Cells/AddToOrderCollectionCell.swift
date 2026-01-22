//
//  AddToOrderCollectionCell.swift
//  newApp1
//
//  Created by Анастасия on 07.11.2025.
//

import UIKit
import SnapKit

final class AddToOrderCollectionCell: UICollectionViewCell {
    
    static let reuseID = "AddToOrderCollectionCell"
    
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
    
    private var imageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "pepperoni")
        image.translatesAutoresizingMaskIntoConstraints = false
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
    
    func update2(_ addToCartProducts: AddToCartProduct) {
        nameLabel.text = addToCartProducts.name
        imageView.image = UIImage(named: addToCartProducts.image)
    }
}

private extension AddToOrderCollectionCell {
    
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(imageView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(6)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(containerView).inset(6)
            make.width.height.equalTo(80)
        }

        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(10)
            make.centerY.equalTo(imageView)
            make.top.right.equalToSuperview().inset(10)
        }
    }
}

