//
//  SaveButton.swift
//  newApp1
//
//  Created by Анастасия on 14.01.2026.
//

import UIKit

final class SaveButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCommonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCommonInit() {
        self.backgroundColor = .orange
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        
        self.setTitle("Save", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}

