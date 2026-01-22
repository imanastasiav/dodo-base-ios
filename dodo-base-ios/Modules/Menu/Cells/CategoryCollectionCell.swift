//
//  CategoryCollectionCell.swift
//  newApp1
//
//  Created by Анастасия on 11.10.2025.
//

import UIKit
import SnapKit

final class CategoryCollectionCell: UICollectionViewCell {
    
    static let reuseID = "CategotyCollectionCell"
    
    var onButtonTap: (()->())?
    
    private var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemGray6
        view.applyShadow(cornerRadius: 10)
        
        return view
    }()

    private var categoryLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 1.5
        return label
    }()
    
    override func prepareForReuse() {
        //categoryButton.titleLabel = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ category: Category) {
        //categoryButton.setTitle(category.name, for: .normal)
        categoryLabel.text = category.name
    }
}

private extension CategoryCollectionCell {
    
    func setupViews() {
        contentView.addSubview(containerView)
        contentView.addSubview(categoryLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
           // make.width.equalTo(200)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.edges.equalTo(containerView).inset(4)
            //make.left.right.equalTo(containerView).inset(7)
        }
    }
}
