//
//  ComponentsCollectionCell.swift
//  newApp1
//
//  Created by Анастасия on 19.10.2025.
//

import UIKit
import SnapKit

final class ComponentsCollectionCell: UICollectionViewCell {
    
    static let reuseID = "ComponentsCollectionCell"
    
    private var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.applyShadow(cornerRadius: 10)
        return view
    }()
    
    var componentImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "cheese")
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Сырный бортик"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var priceLabel: UILabel = {
        var label = UILabel()
        label.text = "205 p"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
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
    
    func update(_ component: Component) {
        nameLabel.text = component.name
        priceLabel.text = "\(component.price) p"
        componentImageView.image = UIImage(named: component.image)
    }
}

private extension ComponentsCollectionCell {
    func setupViews() {
        contentView.addSubview(containerView)
        contentView.addSubview(componentImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        componentImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(8)
            make.height.equalTo(70)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(componentImageView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(8)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.left.bottom.right.equalToSuperview().inset(8)
        }
    }
}
