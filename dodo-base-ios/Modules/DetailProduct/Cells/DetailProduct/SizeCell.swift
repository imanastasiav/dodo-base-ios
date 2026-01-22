//
//  SizeCell.swift
//  newApp1
//
//  Created by Анастасия on 19.10.2025.
//

import UIKit
import SnapKit

final class SizeCell: UITableViewCell {

    static let reuseID = "SizeCell"
    
    private lazy var sizeSegmentControl: UISegmentedControl = {
        let items = ["20 см", "25 см", "30 см", "35 см"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.selectedSegmentTintColor = .white
        control.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        control.setTitleTextAttributes([.foregroundColor: UIColor.lightGray], for: .normal)
        control.layer.cornerRadius = 50
        control.layer.masksToBounds = true
        control.layer.shadowColor = .init(gray: 222, alpha: 1)
        
        return control
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SizeCell {
    
    func setupViews() {
        contentView.addSubview(sizeSegmentControl)
    }
    
    func setupConstraints() {
        sizeSegmentControl.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.bottom.equalTo(contentView).inset(8)
        }
    }
}
