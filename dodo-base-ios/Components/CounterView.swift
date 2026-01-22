//
//  CounterView.swift
//  newApp1
//
//  Created by Анастасия on 14.10.2025.
//

import UIKit
import SnapKit

final class CounterView: UIControl {
    
    //Устанавливается значение CounterView 
    var countValue = 1 {
        didSet {
            countValue = countValue > 0 ? countValue : 1
            countLabel.text = "\(countValue)"
        }
    }
    
    private let containerStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        
        label.text = "1"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("+", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 12
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    private let decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 12
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CounterView {
    
    func setup() {
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 247/255, alpha: 1)
        
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupViews() {
        self.addSubview(containerStack)
        containerStack.addArrangedSubview(decreaseButton)
        containerStack.addArrangedSubview(countLabel)
        containerStack.addArrangedSubview(increaseButton)
    }
    
    func setupConstraints() {
        containerStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        switch sender {
        case decreaseButton:
            countValue -= 1
        case increaseButton:
            countValue += 1
        default: break
        }
        sendActions(for: .valueChanged)
    }
}
