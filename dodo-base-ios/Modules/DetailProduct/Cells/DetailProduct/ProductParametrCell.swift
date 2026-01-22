//
//  ProductParametrCell.swift
//  newApp1
//
//  Created by Анастасия on 18.10.2025.
//

import UIKit
import SnapKit

final class ProductParametrCell: UITableViewCell {
    
    static let reuseID = "ProductParametrCell"
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Пепперони фреш"
        label.font = .boldSystemFont(ofSize: 16)
        //label.translatesAutoresizingMaskIntoConstraints = false
        //не ставим, если используем snapkit
        return label
    }()
    
    private var parameterLabel: UILabel = {
        let label = UILabel()
        label.text = "30 см, традиционное тесто 30, 580 г"
        label.textColor = .lightGray
        label.font = .boldSystemFont(ofSize: 12)
        
        return label
    }()
    
    private var infoButton: UIButton = {
        var config = UIButton.Configuration.plain()
        
        let image = UIImage(named: "info")?.withRenderingMode(.alwaysTemplate)
    
        let resizedImage = image?.resized(to: CGSize(width: 16, height: 16))
        config.image = resizedImage
        
        config.baseForegroundColor = .red
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        
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
    
    @objc private func infoButtonTapped() {
        print("❤️ Button tapped")
    }
}

private extension ProductParametrCell {
    
    func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(parameterLabel)
        contentView.addSubview(infoButton)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.right.equalTo(contentView).inset(6)
            make.left.equalTo(contentView).inset(16)
        }
        parameterLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.left.equalTo(contentView).inset(16)
            make.right.equalTo(contentView).inset(6)
            make.bottom.equalTo(contentView).inset(6)
        }
        infoButton.snp.makeConstraints { make in
            make.top.right.equalTo(contentView).inset(6)
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
