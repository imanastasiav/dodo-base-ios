//
//  CartCell.swift
//  newApp1
//
//  Created by Анастасия on 06.11.2025.
//

import UIKit
import SnapKit

final class CartCell: UITableViewCell {
    
    static let reuseID = "CartCell"
    
    private var mainView: UIView = {
        var view = UIView()
        view.applyShadow(cornerRadius: 10)
        view.backgroundColor = .white
        return view
    }()
    
    private var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var cartImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "margarita")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Пепперони фреш"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private var parameterLabel: UILabel = {
        let label = UILabel()
        label.text = "30 см, традиционное тесто 30"
        label.textColor = .lightGray
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
     private var deleteButton: UIButton = {
        var config = UIButton.Configuration.plain()
        
        let image = UIImage(named: "delete")?.withRenderingMode(.alwaysTemplate)
    
        let resizedImage = image?.resized(to: CGSize(width: 10, height: 10))
        config.image = resizedImage
        
        config.baseForegroundColor = .red
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private var separatorView: UIView = {
        var view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .lightGray
        return view
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "149 ₽"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private var counterView = CounterView()
    
    private var changeButton: UIButton = {
       let button = UIButton()
        button.setTitle("Изменить", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
       return button
   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func deleteButtonTapped() {
        print("Delete button tapped")
    }
}

private extension CartCell {
    func setupViews() {
        contentView.addSubview(mainView)
        contentView.addSubview(containerView)
        containerView.addSubview(cartImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(parameterLabel)
        containerView.addSubview(deleteButton)
        contentView.addSubview(separatorView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(counterView)
        contentView.addSubview(changeButton)
    }
    
    func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        cartImageView.snp.makeConstraints { make in
            make.left.equalTo(containerView).inset(16)
            make.top.bottom.equalTo(containerView).inset(8)
            make.width.height.equalTo(100)
            make.centerY.equalTo(containerView)
        }
                                 
        nameLabel.snp.makeConstraints { make in
            make.top.right.equalTo(containerView).offset(16)
            make.left.equalTo(cartImageView.snp.right).offset(8)
        }
        
        parameterLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.right.equalTo(containerView).inset(16)
            make.left.equalTo(cartImageView.snp.right).offset(8)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.right.equalTo(containerView).inset(6)
        }
        
        separatorView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(containerView.snp.bottom).offset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.left.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).inset(8)
        }
        
        counterView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.right.equalTo(contentView).inset(10)
            make.bottom.equalTo(contentView).inset(8)
        }
        
        changeButton.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.right.equalTo(counterView.snp.left).offset(-10)
            make.bottom.equalTo(contentView).inset(8)
        }
    }
}

private extension UIImage {
    /// Удобный метод для изменения размера картинки
    func resized(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
