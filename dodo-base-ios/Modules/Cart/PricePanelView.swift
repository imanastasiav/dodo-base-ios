//
//  PricePanelView.swift
//  newApp1
//
//  Created by Анастасия on 07.11.2025.
//

import UIKit

final class PricePanelView: UIView {
    
    private lazy var orderButton: UIButton = {
        var button = UIButton()

        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.backgroundColor = .orange
        button.setTitle("Оформить заказ на 1 999 ₽", for: .normal)
        
        return button
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

private extension PricePanelView {
    func setupViews() {
        addSubview(orderButton)
    }
    
    func setupConstraints() {
        orderButton.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(self).inset(20)
        }
    }
}

