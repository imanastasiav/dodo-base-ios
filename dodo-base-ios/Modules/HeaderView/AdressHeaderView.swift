//
//  AdressHeaderView.swift
//  newApp1
//
//  Created by Анастасия on 14.01.2026.
//

import UIKit
import SnapKit

final class AddressHeaderView: UIView {

    // MARK: - Callbacks
    var onTapAddress: (() -> Void)?
    var onTapProfile: (() -> Void)?

    // MARK: - UI

    private let leftIconButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "locationIcon") ?? UIImage(systemName: "figure.walk"), for: .normal)
        button.tintColor = .orange
        button.backgroundColor = .white
        button.layer.cornerRadius = 22
        button.clipsToBounds = true
        return button
    }()

    private let addressButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Укажите адрес доставки", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        button.contentHorizontalAlignment = .left

        let chevron = UIImage(systemName: "chevron.down")
        button.setImage(chevron, for: .normal)
        button.tintColor = .black

        // стрелка справа
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)

        return button
    }()

    private let profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🙂", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.backgroundColor = UIColor.systemMint.withAlphaComponent(0.35)
        button.layer.cornerRadius = 22
        button.clipsToBounds = true
        return button
    }()

    private let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 12
        return stack
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupViews() {
        backgroundColor = UIColor(white: 0.96, alpha: 1.0)

        addSubview(hStack)

        hStack.addArrangedSubview(leftIconButton)
        hStack.addArrangedSubview(addressButton)
        hStack.addArrangedSubview(profileButton)
    }

    private func setupConstraints() {
        leftIconButton.snp.makeConstraints { make in
            make.width.height.equalTo(44)
        }

        profileButton.snp.makeConstraints { make in
            make.width.height.equalTo(44)
        }

        hStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16))
        }
    }

    private func setupActions() {
        addressButton.addTarget(self, action: #selector(addressTapped), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        leftIconButton.addTarget(self, action: #selector(addressTapped), for: .touchUpInside)
    }

    // MARK: - Public

    func setAddress(_ text: String) {
        addressButton.setTitle(text, for: .normal)
    }

    // MARK: - Actions

    @objc private func addressTapped() {
        onTapAddress?()
    }

    @objc private func profileTapped() {
        onTapProfile?()
    }
}
