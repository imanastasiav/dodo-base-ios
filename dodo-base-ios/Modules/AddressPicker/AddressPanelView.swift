//
//  AddressPanelView.swift
//  newApp1
//
//  Created by Анастасия on 14.01.2026.
//

import UIKit
import SnapKit

final class AddressPanelView: UIView {
    
    var onAddressChanged: ((String) -> Void)?
    var onSaveTap: ((String) -> Void)?
    
    var timer: Timer?
    var delayValue : Double = 2.0
    
    let addressView = AddressView()
    let saveButton = SaveButton()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        observe()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ addressText: String) {
        addressView.addressTextField.text = addressText
    }
    
    func observe() {
        addressView.addressTextField.addTarget(self, action: #selector(addressTextFieldChanged(_:)), for: .editingChanged)
    }
    
    func setupActions() {
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    @objc private func saveTapped() {
        let text = addressView.addressTextField.text ?? ""
        onSaveTap?(text)
    }
}

//MARK: - Event Handler

private extension AddressPanelView {
    
    @objc func addressTextFieldChanged(_ sender: UITextField) {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: delayValue, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
    }
    
    @objc func timerAction() {
        if let addressText = addressView.addressTextField.text {
            onAddressChanged?(addressText)
        }
    }
}

private extension AddressPanelView {
    
    func setupViews() {
        backgroundColor = .systemBackground
        self.addSubview(stackView)
        stackView.addArrangedSubview(addressView)
        stackView.addArrangedSubview(saveButton)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
