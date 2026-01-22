//
//  MainProductCell.swift
//  newApp1
//
//  Created by Анастасия on 04.10.2025.
//

import UIKit
import SnapKit

final class MainProductCell: UITableViewCell {

    var onButtonTap: (() -> Void)?
    static let reuseID = "MainProductCell"

    // Фон: под всем контентом
    private let backdropView: CustomRoundedView = {
        let v = CustomRoundedView()
        return v
    }()

    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()

    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()

    private lazy var priceButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.titleAlignment = .center
        config.baseBackgroundColor = UIColor.white
        config.baseForegroundColor = .black
        config.cornerStyle = .capsule
        
        var title = AttributedString("от 590 ₽")
            title.font = .boldSystemFont(ofSize: 16)
            config.attributedTitle = title

        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
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

    func update(_ product: Product) {
        productImageView.image = UIImage(named: product.image)
        nameLabel.text = product.name

        var config = priceButton.configuration
        config?.title = "от \(product.price) ₽"
        priceButton.configuration = config
    }

    @objc private func priceButtonTapped() {
        onButtonTap?()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        onButtonTap = nil
        productImageView.image = nil
        nameLabel.text = nil
    }
}

private extension MainProductCell {
    private func setupViews() {
        selectionStyle = .none
        contentView.backgroundColor = .white

        contentView.addSubview(backdropView)
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(productImageView)
        verticalStackView.addArrangedSubview(nameLabel)
        contentView.addSubview(priceButton)
    }

    private func setupConstraints() {
        backdropView.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.90)
        }

        verticalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(60)
        }
        
        productImageView.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(315)
        }

        priceButton.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(100)
            make.right.bottom.equalTo(backdropView).inset(12)
        }
    }
}
