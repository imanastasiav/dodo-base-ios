//
//  OrderButtonView.swift
//  newApp1
//
//  Created by Анастасия on 19.11.2025.
//

import UIKit
import SnapKit

final class OrderButtonView: UIView {
    
    private var containerView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var orderButton = {
        var button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.backgroundColor = .orange
        button.setTitle("Добавить в корзину", for: .normal)
        
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

private extension OrderButtonView {
    
    func setupViews() {
        self.addSubview(containerView)
        containerView.addSubview(orderButton)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        orderButton.snp.makeConstraints { make in
            make.left.top.right.equalTo(containerView).inset(10)
            make.bottom.equalTo(containerView).inset(20)
        }
    }
}
